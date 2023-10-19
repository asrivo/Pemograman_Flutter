import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String idPelanggan;
  final String namaPelanggan;
  final String meteranAwal;
  final String meteranAkhir;

  ResultPage({
    required this.idPelanggan,
    required this.namaPelanggan,
    required this.meteranAwal,
    required this.meteranAkhir,
  });

  @override
  Widget build(BuildContext context) {
    double meteranAwalValue = double.parse(meteranAwal);
    double meteranAkhirValue = double.parse(meteranAkhir);
    double biayaPerMeterKubik = 5000;
    double totalMeteran = meteranAkhirValue - meteranAwalValue;
    double totalBiaya = totalMeteran * biayaPerMeterKubik;
    double pajak = totalBiaya * 0.05;
    double totalPembayaran = totalBiaya + pajak;

    return Scaffold(
      appBar: AppBar(
        title: Text("Hasil Data"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            buildResultRow("ID Pelanggan:", idPelanggan),
            buildResultRow("Nama Pelanggan:", namaPelanggan),
            buildResultRow("Total Meteran:", totalMeteran.toStringAsFixed(2)),
            buildResultRow("Total Biaya:", totalBiaya.toStringAsFixed(2)),
            buildResultRow("Pajak:", pajak.toStringAsFixed(2)),
            buildResultRow(
                "Total Pembayaran:", totalPembayaran.toStringAsFixed(2)),
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
