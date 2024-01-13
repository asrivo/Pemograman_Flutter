import 'dart:convert';

import 'package:flutter_application_crud/Mahasiswa.dart';
import 'package:flutter_application_crud/Matakuliah.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://192.168.30.94:9001/api/v1/mahasiswa';
  Future<Mahasiswa> getMahasiswaById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id'));

    if (response.statusCode == 200) {
      dynamic data = json.decode(response.body);
      return Mahasiswa.fromJson(data);
    } else {
      throw Exception('Failed to load mahasiswa by ID');
    }
  }

  Future<List<Mahasiswa>> getMahasiswa() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      Iterable<dynamic> data = json.decode(response.body);
      return data.map((json) => Mahasiswa.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load mahasiswa');
    }
  }

  Future<Mahasiswa> createMahasiswa(Mahasiswa mahasiswa) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(mahasiswa.toJson()),
    );

    if (response.statusCode == 200) {
      //return Mahasiswa.fromJson(json.decode(response.body));
      return Mahasiswa(
        id: 0,
        nama: mahasiswa.nama,
        email: mahasiswa.email,
        tgllahir: mahasiswa.tgllahir,
      );
    } else {
      throw Exception('Failed to create mahasiswa');
    }
  }

  Future<Mahasiswa> updateMahasiswa(Mahasiswa mahasiswa) async {
    final response = await http.put(
      Uri.parse('$baseUrl/${mahasiswa.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(mahasiswa.toJson()),
    );

    if (response.statusCode == 200) {
      return Mahasiswa.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update mahasiswa');
    }
  }

  Future<void> deleteMahasiswa(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete mahasiswa');
    }
  }
}

class MatakuliahApiService {
  static const String baseUrl = 'http://example.com/api/v1/matakuliah'; // Replace with your API endpoint

  Future<Matakuliah> getMatakuliahById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id'));

    if (response.statusCode == 200) {
      dynamic data = json.decode(response.body);
      return Matakuliah.fromJson(data);
    } else {
      throw Exception('Failed to load matakuliah by ID');
    }
  }

  Future<List<Matakuliah>> getMatakuliah() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      Iterable<dynamic> data = json.decode(response.body);
      return data.map((json) => Matakuliah.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load matakuliah');
    }
  }

  Future<Matakuliah> createMatakuliah(Matakuliah matakuliah) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(matakuliah.toJson()),
    );

    if (response.statusCode == 200) {
      return Matakuliah.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create matakuliah');
    }
  }

  Future<Matakuliah> updateMatakuliah(Matakuliah matakuliah) async {
    final response = await http.put(
      Uri.parse('$baseUrl/${matakuliah.kode}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(matakuliah.toJson()),
    );

    if (response.statusCode == 200) {
      return Matakuliah.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update matakuliah');
    }
  }

  Future<void> deleteMatakuliah(String kode) async {
    final response = await http.delete(Uri.parse('$baseUrl/$kode'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete matakuliah');
    }
  }
}