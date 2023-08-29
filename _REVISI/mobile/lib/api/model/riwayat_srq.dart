class RiwayatSRQ {
  String? total,
      hasil,
      masalah_psikologis,
      pengguna_narkoba,
      gangguan_psikotik,
      gangguan_ptsd,
      tanggal;

  int? id;

  RiwayatSRQ(
      {this.id,
      this.total,
      this.hasil,
      this.masalah_psikologis,
      this.pengguna_narkoba,
      this.gangguan_psikotik,
      this.gangguan_ptsd,
      this.tanggal});

  factory RiwayatSRQ.fromJson(Map<String, dynamic> json) {
    return RiwayatSRQ(
      id: json['id'],
      total: json['total'],
      hasil: json['hasil'],
      masalah_psikologis: json['masalah_psikologis'],
      pengguna_narkoba: json['pengguna_narkoba'],
      gangguan_psikotik: json['gangguan_psikotik'],
      gangguan_ptsd: json['gangguan_ptsd'],
      tanggal: json['tanggal'],
    );
  }
}
