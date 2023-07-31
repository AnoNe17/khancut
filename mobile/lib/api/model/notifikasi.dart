class Notifikasi {
  String? kategori, tanggal, isi;

  int? id;

  Notifikasi({
    this.id,
    this.kategori,
    this.tanggal,
    this.isi,
  });

  factory Notifikasi.fromJson(Map<String, dynamic> json) {
    return Notifikasi(
      id: json['id'],
      kategori: json['kategori'],
      tanggal: json['tanggal'],
      isi: json['isi'],
    );
  }
}
