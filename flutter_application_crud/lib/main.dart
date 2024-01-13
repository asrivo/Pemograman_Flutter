import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_crud/Mahasiswa.dart';
import 'package:flutter_application_crud/Matakuliah.dart';
import 'package:flutter_application_crud/api.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ApiService _apiService = ApiService();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _tgllahirController = TextEditingController();

  final TextEditingController _kodeMatakuliahController = TextEditingController();
  final TextEditingController _namaMatakuliahController = TextEditingController();
  final TextEditingController _sksMatakuliahController = TextEditingController();

  int? selectedMahasiswaId;
  int? selectedMatakuliahId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CRUD Example'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: _namaController,
                    decoration: InputDecoration(labelText: 'Nama'),
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                  TextFormField(
                    controller: _tgllahirController,
                    decoration: InputDecoration(labelText: 'Tgl Lahir'),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () async {
                      if (selectedMahasiswaId == null) {
                        // Create new Mahasiswa
                        Mahasiswa newPost = Mahasiswa(
                          id: 0,
                          nama: _namaController.text,
                          email: _emailController.text,
                          tgllahir: _tgllahirController.text,
                        );
                        await _apiService.createMahasiswa(newPost);
                      } else {
                        // Update existing Mahasiswa
                        Mahasiswa updatedPost = Mahasiswa(
                          id: selectedMahasiswaId!,
                          nama: _namaController.text,
                          email: _emailController.text,
                          tgllahir: _tgllahirController.text,
                        );
                        await _apiService.updateMahasiswa(updatedPost);
                        selectedMahasiswaId = null; // Reset selected ID after updating
                      }

                      // Clear text fields
                      _namaController.clear();
                      _emailController.clear();
                      _tgllahirController.clear();

                      // Refresh the UI after creating or updating a Mahasiswa
                      setState(() {});
                    },
                    child: Text(selectedMahasiswaId == null ? 'Create Post' : 'Update Post'),
                  ),
                ],
              ),
            ),
          ),

          // Matakuliah Section
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Matakuliah Section',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    // Add logic to handle Matakuliah button press
                    // For example, navigate to the Matakuliah screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MatakuliahScreen()),
                    );
                  },
                  child: Text('Matakuliah'),
                ),
              ],
            ),
          ),

          // Mahasiswa Section
          Expanded(
            child: FutureBuilder<List<Mahasiswa>>(
              future: _apiService.getMahasiswa(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  List<Mahasiswa> posts = snapshot.data!;
                  return ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(posts[index].nama),
                        subtitle: Text(posts[index].email),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(Colors.green),
                              ),
                              onPressed: () {
                                // Set the selectedMahasiswaId for editing
                                selectedMahasiswaId = posts[index].id;

                                // Set the controller values with the selected Mahasiswa's data
                                _namaController.text = posts[index].nama;
                                _emailController.text = posts[index].email;
                                _tgllahirController.text = posts[index].tgllahir;

                                setState(() {});
                              },
                              child: Text("Edit"),
                            ),
                            SizedBox(width: 8),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(Colors.red),
                              ),
                              onPressed: () async {
                                await _apiService.deleteMahasiswa(posts[index].id);
                                setState(() {});
                              },
                              child: Text("Delete"),
                            ),
                          ],
                        ),
                        onTap: () async {
                          Mahasiswa selectedMahasiswa =
                              await _apiService.getMahasiswaById(posts[index].id);

                          // Set the controller values with the selected Mahasiswa's data
                          _namaController.text = selectedMahasiswa.nama;
                          _emailController.text = selectedMahasiswa.email;
                          _tgllahirController.text = selectedMahasiswa.tgllahir;

                          setState(() {});
                        },
                      );
                    },
                  );
                }
              },
            ),
          ),

          // Matakuliah Section
          // Expanded(
          //   child: FutureBuilder<List<Matakuliah>>(
          //     future: _apiService.getMatakuliah(),
          //     builder: (context, snapshot) {
          //       if (snapshot.connectionState == ConnectionState.waiting) {
          //         return Center(child: CircularProgressIndicator());
          //       } else if (snapshot.hasError) {
          //         return Center(child: Text('Error: ${snapshot.error}'));
          //       } else {
          //         List<Matakuliah> matakuliahs = snapshot.data!;
          //         return ListView.builder(
          //           itemCount: matakuliahs.length,
          //           itemBuilder: (context, index) {
          //             return ListTile(
          //               title: Text(matakuliahs[index].nama),
          //               subtitle: Text('Kode: ${matakuliahs[index].kode}, SKS: ${matakuliahs[index].sks}'),
          //               trailing: Row(
          //                 mainAxisSize: MainAxisSize.min,
          //                 children: [
          //                   ElevatedButton(
          //                     style: ButtonStyle(
          //                       backgroundColor: MaterialStatePropertyAll(Colors.blue),
          //                     ),
          //                     onPressed: () {
          //                       // Set the selectedMatakuliahId for editing
          //                       selectedMatakuliahId = matakuliahs[index].id;

          //                       // Set the controller values with the selected Matakuliah's data
          //                       _kodeMatakuliahController.text = matakuliahs[index].kode;
          //                       _namaMatakuliahController.text = matakuliahs[index].nama;
          //                       _sksMatakuliahController.text = matakuliahs[index].sks.toString();

          //                       setState(() {});
          //                     },
          //                     child: Text("Edit"),
          //                   ),
          //                   SizedBox(width: 8),
          //                   ElevatedButton(
          //                     style: ButtonStyle(
          //                       backgroundColor: MaterialStatePropertyAll(Colors.red),
          //                     ),
          //                     onPressed: () async {
          //                       await _apiService.deleteMatakuliah(matakuliahs[index].kode);
          //                       setState(() {});
          //                     },
          //                     child: Text("Delete"),
          //                   ),
          //                 ],
          //               ),
          //               onTap: () async {
          //                 Matakuliah selectedMatakuliah =
          //                     await _apiService.getMatakuliahById(matakuliahs[index].id);

          //                 // Set the controller values with the selected Matakuliah's data
          //                 _kodeMatakuliahController.text = selectedMatakuliah.kode;
          //                 _namaMatakuliahController.text = selectedMatakuliah.nama;
          //                 _sksMatakuliahController.text = selectedMatakuliah.sks.toString();

          //                 setState(() {});
          //               },
          //             );
          //           },
          //         );
          //       }
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}

class MatakuliahScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Matakuliah Screen'),
      ),
      body: Center(
        child: Text('This is the Matakuliah screen'),
      ),
    );
  }
}
