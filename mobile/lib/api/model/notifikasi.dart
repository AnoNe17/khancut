class Notifikasi {
  String? tanggal, isi;

  int? id;

  Notifikasi({
    this.id,
    this.tanggal,
    this.isi,
  });

  factory Notifikasi.fromJson(Map<String, dynamic> json) {
    return Notifikasi(
      id: json['id'],
      tanggal: json['tanggal'],
      isi: json['isi'],
    );
  }
}
