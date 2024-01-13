class Matakuliah {
  String kode;
  int sks;
  String nama;

  Matakuliah({required this.kode, required this.sks, required this.nama});

  factory Matakuliah.fromJson(Map<String, dynamic> json) {
    return Matakuliah(
      kode: json['kode'],
      sks: json['sks'],
      nama: json['nama'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'kode': kode,
      'sks': sks,
      'nama': nama,
    };
  }
}
