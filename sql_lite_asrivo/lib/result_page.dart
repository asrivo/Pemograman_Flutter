import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String nobp;
  final String nama;
  final String mtk;
  final String bIng;
  final String java;

  ResultPage({
    required this.nobp,
    required this.nama,
    required this.mtk,
    required this.bIng,
    required this.java,
  });

  @override
  Widget build(BuildContext context) {
    double mtkValue = double.parse(mtk);
    double bIngValue = double.parse(bIng);
    double javaValue = double.parse(java);

    double rataRata = (mtkValue + bIngValue + javaValue) / 3;

    return Scaffold(
      appBar: AppBar(
        title: Text("Hasil Data"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            buildResultRow("Nomor BP:", nobp),
            buildResultRow("Nama:", nama),
            buildResultRow("Matematika:", mtk),
            buildResultRow("Bahasa Inggris:", bIng),
            buildResultRow("Java:", java),
            buildResultRow("Rata-rata:", rataRata.toStringAsFixed(2)),
          ],
        ),
      ),
    );
  }

  Widget buildResultRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(value),
        ],
      ),
    );
  }
}
