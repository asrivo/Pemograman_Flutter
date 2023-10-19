import 'package:flutter/material.dart';
import 'result_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // Controllers untuk mengakses data yang dimasukkan pengguna
  final TextEditingController idPelangganController = TextEditingController();
  final TextEditingController namaPelangganController = TextEditingController();
  final TextEditingController meteranAwalController = TextEditingController();
  final TextEditingController meteranAkhirController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Data PDAM'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/pdam_image.jpg'),
            Center(
              child: Container(
                color: Colors.yellow,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('PDAM PADANG', style: TextStyle(fontSize: 20)),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text('ID Pelanggan'),
            TextFormField(
              controller: idPelangganController,
              decoration: InputDecoration(
                hintText: 'Masukkan ID Pelanggan',
              ),
            ),
            SizedBox(height: 10),
            Text('Nama Pelanggan'),
            TextFormField(
              controller: namaPelangganController,
              decoration: InputDecoration(
                hintText: 'Masukkan Nama Pelanggan',
              ),
            ),
            SizedBox(height: 10),
            Text('Meteran Awal'),
            TextFormField(
              controller: meteranAwalController,
              decoration: InputDecoration(
                hintText: 'Masukkan Meteran Awal',
              ),
            ),
            SizedBox(height: 10),
            Text('Meteran Akhir'),
            TextFormField(
              controller: meteranAkhirController,
              decoration: InputDecoration(
                hintText: 'Masukkan Meteran Akhir',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green, // Warna latar belakang
              ),
              onPressed: () {
                // Tambahkan logika untuk menavigasi ke halaman result_page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      idPelanggan: idPelangganController.text,
                      namaPelanggan: namaPelangganController.text,
                      meteranAwal: meteranAwalController.text,
                      meteranAkhir: meteranAkhirController.text,
                    ),
                  ),
                );
              },
              child: Text('Proses'),
            ),
          ],
        ),
      ),
    );
  }
}
