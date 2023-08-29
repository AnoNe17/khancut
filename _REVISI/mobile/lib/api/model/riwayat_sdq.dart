class RiwayatSDQ {
  String? skor_e,
      hasil_e,
      skor_c,
      hasil_c,
      skor_h,
      hasil_h,
      skor_p,
      hasil_p,
      skor_pro,
      hasil_pro,
      skor_keseluruhan,
      hasil_keseluruhan,
      nama,
      tanggal;

  int? id;

  RiwayatSDQ(
      {this.id,
      this.skor_e,
      this.hasil_e,
      this.skor_c,
      this.hasil_c,
      this.skor_h,
      this.hasil_h,
      this.skor_p,
      this.hasil_p,
      this.skor_pro,
      this.hasil_pro,
      this.skor_keseluruhan,
      this.hasil_keseluruhan,
      this.nama,
      this.tanggal});

  factory RiwayatSDQ.fromJson(Map<String, dynamic> json) {
    return RiwayatSDQ(
      id: json['id'],
      skor_e: json['skor_e'],
      hasil_e: json['hasil_e'],
      skor_c: json['skor_c'],
      hasil_c: json['hasil_c'],
      skor_h: json['skor_h'],
      hasil_h: json['hasil_h'],
      skor_p: json['skor_p'],
      hasil_p: json['hasil_p'],
      skor_pro: json['skor_pro'],
      hasil_pro: json['hasil_pro'],
      skor_keseluruhan: json['skor_keseluruhan'],
      hasil_keseluruhan: json['hasil_keseluruhan'],
      nama: json['nama'],
      tanggal: json['tanggal'],
    );
  }
}
