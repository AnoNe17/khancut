// ignore_for_file: use_function_type_syntax_for_parameters

import 'package:flutter/material.dart';
import 'package:untitled/model/soal.dart';
import 'package:untitled/ui/hasil_sdq.dart';
import 'package:untitled/ui/hasil_srq.dart';

class SoalSDQ4_11 extends StatefulWidget {
  final bool login;
  final String nama, umur, instansi;

  const SoalSDQ4_11(
      {Key? key,
      required this.login,
      required this.nama,
      required this.umur,
      required this.instansi})
      : super(key: key);

  @override
  State<SoalSDQ4_11> createState() => _SoalSDQ4_11State();
}

class _SoalSDQ4_11State extends State<SoalSDQ4_11> {
  List<Soal> soal = [
    Soal('e', '0', 0, 0, 0),
    Soal('pro', '1. Dapat memperdulikan perasaan orang lain.', 0, 1, 2),
    Soal('h', '2. Gelisah, terlalu aktif, tidak dapat diam untuk waktu lama.',
        0, 1, 2),
    Soal(
        'e',
        '3. Sering mengeluh sakit kepala, sakit perut atau sakit lainnya.',
        0,
        1,
        2),
    Soal(
        'pro',
        '4. Kalau mempunyai mainan, kesenangan atau pensil, anak bersedia berbagi dengan anak anak lain. ',
        0,
        1,
        2),
    Soal('c', '5. Sering sulit mengendalikan kemarahan. ', 0, 1, 2),
    Soal('p', '6. Cenderung menyendiri lebih suka bermain seorang diri. ', 0, 1,
        2),
    Soal(
        'c',
        '7. Umumya bertingkah laku baik, biasanya melakukan apa yang disuruh oleh orang dewasa.',
        2,
        1,
        0),
    Soal('e', '8. Banyak kekhawatiran atau sering tampak khawatir.', 0, 1, 2),
    Soal(
        'pro',
        '9. Suka menolong jika seseorang terluka, kecewa atau merasa sakit. ',
        0,
        1,
        2),
    Soal('h', '10. Terus menerus bergerak dengan resah atau menggeliat-geliat',
        0, 1, 2),
    Soal('p', '11. Mempunyai satu atau lebih teman baik', 2, 1, 0),
    Soal(
        'c',
        '12. Sering berkelahi dengan anak-anak lain atau mengintimidasi mereka',
        0,
        1,
        2),
    Soal('e', '13. Sering merasatidak bahagia, sedih atau menangis ', 0, 1, 2),
    Soal('p', '14. pada umumnya di sukai oleh anak anak lain. ', 2, 1, 0),
    Soal('h', '15. Mudah teralih perhatiannya, tidak dapat berkonsentrasi.  ',
        0, 1, 2),
    Soal(
        'e',
        '16. Gugup atau sulit berpisah dengan orang tua/pengasuhnya pada situasi baru, mudah kehilangan rasa percaya diri. ',
        0,
        1,
        2),
    Soal('pro', '17. Bersikap baik terhadap anak-anak yang lebih muda.', 0, 1,
        2),
    Soal('c', '18. Sering berbohong atau berbuat curang', 0, 1, 2),
    Soal(
        'p',
        '19. Diganggu dipermainkan, dintimidasi atau diancam oleh anak-anak lain.',
        0,
        1,
        2),
    Soal(
        'pro',
        '20. Sering menawarkan diri untuk membantu orang lain (orang tua, guru, anak-anak )',
        0,
        1,
        2),
    Soal(
        'h',
        '21. Sebelum melakukan sesuatu ia berfikir dahulu tentang akibatnya.',
        2,
        1,
        0),
    Soal('c', '22. Mencuri dari rumah, sekolah atau tempat lain', 0, 1, 2),
    Soal(
        'p',
        '23. Lebih mudah berteman dengan orang dewasa dari pada dengan anak anak lain.',
        0,
        1,
        2),
    Soal('e', '24. Banyak yang ditakuti, mudah menjadi takut', 0, 1, 2),
    Soal(
        'h',
        '25. Memiliki perhatian yang baik terhadap apapun, mampu menyelesaikan tugas atau pekerjaan rumah sampai selesai .',
        2,
        1,
        0),
  ];

  int index = 1;
  int hasil_e = 0;
  int hasil_c = 0;
  int hasil_h = 0;
  int hasil_p = 0;
  int hasil_pro = 0;
  String tipe = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // leading: IconButton(
          //   icon: Icon(Icons.arrow_back, color: Colors.white),
          //   onPressed: () {
          //     setState(() {
          //       if(index > 1){
          //         index--;
          //       } else {
          //         Navigator.of(context).pop();
          //       }
          //     });
          //   },
          // ),
          automaticallyImplyLeading: false,
          toolbarHeight: 70,
          title: Text('Soal SDQ (Umur 4 - 10)'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(25),
            ),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.only(top: 20.0),
          child: Column(
            children: [
              SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  soal[index].soal,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 30),
                ),
              ),
              SizedBox(height: 50),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15.0),
                width: double.infinity,
                height: 45,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xffF18265),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      if (index < 25) {
                        if (soal[index].kategori == 'e') {
                          hasil_e = hasil_e + soal[index].nilai_1;
                        } else if (soal[index].kategori == 'c') {
                          hasil_c = hasil_c + soal[index].nilai_1;
                        } else if (soal[index].kategori == 'h') {
                          hasil_h = hasil_h + soal[index].nilai_1;
                        } else if (soal[index].kategori == 'p') {
                          hasil_p = hasil_p + soal[index].nilai_1;
                        } else {
                          hasil_pro = hasil_pro + soal[index].nilai_1;
                        }
                        index++;
                      } else {
                        if (soal[index].kategori == 'e') {
                          hasil_e = hasil_e + soal[index].nilai_1;
                        } else if (soal[index].kategori == 'c') {
                          hasil_c = hasil_c + soal[index].nilai_1;
                        } else if (soal[index].kategori == 'h') {
                          hasil_h = hasil_h + soal[index].nilai_1;
                        } else if (soal[index].kategori == 'p') {
                          hasil_p = hasil_p + soal[index].nilai_1;
                        } else {
                          hasil_pro = hasil_pro + soal[index].nilai_1;
                        }
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HasilSdq(
                                  nama: widget.nama,
                                  umur: widget.umur,
                                  instansi: widget.instansi,
                                  skor_e: hasil_e,
                                  skor_c: hasil_c,
                                  skor_h: hasil_h,
                                  skor_p: hasil_p,
                                  skor_pro: hasil_pro,
                                  login: widget.login,
                                  tipe: '4_11',
                                )));
                      }
                    });
                  },
                  child: Text(
                    "Tidak Benar",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15.0),
                width: double.infinity,
                height: 45,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xffF18265),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      if (index < 25) {
                        if (soal[index].kategori == 'e') {
                          hasil_e = hasil_e + soal[index].nilai_2;
                        } else if (soal[index].kategori == 'c') {
                          hasil_c = hasil_c + soal[index].nilai_2;
                        } else if (soal[index].kategori == 'h') {
                          hasil_h = hasil_h + soal[index].nilai_2;
                        } else if (soal[index].kategori == 'p') {
                          hasil_p = hasil_p + soal[index].nilai_2;
                        } else {
                          hasil_pro = hasil_pro + soal[index].nilai_2;
                        }
                        index++;
                      } else {
                        if (soal[index].kategori == 'e') {
                          hasil_e = hasil_e + soal[index].nilai_2;
                        } else if (soal[index].kategori == 'c') {
                          hasil_c = hasil_c + soal[index].nilai_2;
                        } else if (soal[index].kategori == 'h') {
                          hasil_h = hasil_h + soal[index].nilai_2;
                        } else if (soal[index].kategori == 'p') {
                          hasil_p = hasil_p + soal[index].nilai_2;
                        } else {
                          hasil_pro = hasil_pro + soal[index].nilai_2;
                        }
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HasilSdq(
                                  nama: widget.nama,
                                  umur: widget.umur,
                                  instansi: widget.instansi,
                                  skor_e: hasil_e,
                                  skor_c: hasil_c,
                                  skor_h: hasil_h,
                                  skor_p: hasil_p,
                                  skor_pro: hasil_pro,
                                  login: widget.login,
                                  tipe: '4_11',
                                )));
                      }
                    });
                  },
                  child: Text(
                    "Kadang Benar",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15.0),
                width: double.infinity,
                height: 45,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xffF18265),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      if (index < 25) {
                        if (soal[index].kategori == 'e') {
                          hasil_e = hasil_e + soal[index].nilai_3;
                        } else if (soal[index].kategori == 'c') {
                          hasil_c = hasil_c + soal[index].nilai_3;
                        } else if (soal[index].kategori == 'h') {
                          hasil_h = hasil_h + soal[index].nilai_3;
                        } else if (soal[index].kategori == 'p') {
                          hasil_p = hasil_p + soal[index].nilai_3;
                        } else {
                          hasil_pro = hasil_pro + soal[index].nilai_3;
                        }
                        index++;
                      } else {
                        if (soal[index].kategori == 'e') {
                          hasil_e = hasil_e + soal[index].nilai_3;
                        } else if (soal[index].kategori == 'c') {
                          hasil_c = hasil_c + soal[index].nilai_3;
                        } else if (soal[index].kategori == 'h') {
                          hasil_h = hasil_h + soal[index].nilai_3;
                        } else if (soal[index].kategori == 'p') {
                          hasil_p = hasil_p + soal[index].nilai_3;
                        } else {
                          hasil_pro = hasil_pro + soal[index].nilai_3;
                        }
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HasilSdq(
                                  nama: widget.nama,
                                  umur: widget.umur,
                                  instansi: widget.instansi,
                                  skor_e: hasil_e,
                                  skor_c: hasil_c,
                                  skor_h: hasil_h,
                                  skor_p: hasil_p,
                                  skor_pro: hasil_pro,
                                  login: widget.login,
                                  tipe: '4_11',
                                )));
                      }
                    });
                  },
                  child: Text(
                    "Selalu Benar",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
