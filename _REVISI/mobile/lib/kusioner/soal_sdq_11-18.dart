// ignore_for_file: use_function_type_syntax_for_parameters

import 'package:flutter/material.dart';
import 'package:untitled/model/soal.dart';
import 'package:untitled/ui/hasil_sdq.dart';


class SoalSDQ11_18 extends StatefulWidget {

  final bool login;
  final String nama, umur, instansi;

  const SoalSDQ11_18({Key? key, required this.login, required this.nama, required this.umur, required this.instansi}) : super(key: key);

  @override
  State<SoalSDQ11_18> createState() => _SoalSDQ11_18State();
}

class _SoalSDQ11_18State extends State<SoalSDQ11_18> {
  List<Soal> soal = [
    //objek soal
    Soal('a','0', 0, 0, 0),
    Soal('pro', '1. Saya berusaha baik kepada orang lain. Saya peduli dengan perasaan mereka', 0, 1, 2),
    Soal('h', '2. Saya gelisah. saya tidak dapat diam untuk waktu lama', 0, 1, 2),
    Soal('e', '3. Saya sering sakit kepala, sakit perut atau macam-macam sakit lainnya', 0, 1, 2),
    Soal('pro', '4. Kalau saya memiliki mainan, CD, atau makanan, Saya biasanya berbagi dengan orang lain', 0, 1, 2),
    Soal('c', '5. Saya menjadi sangat marah dan sering tidak dapat mengendalikan kemarahan saya', 0, 1, 2),
    Soal('p', '6. Saya lebih suka sendiri daripada bersama dengan orang yang seusiaku', 0, 1, 2),
    Soal('c', '7. Saya biasanya melakukan apa yang diperintahkan oleh orang lain.', 2, 1, 0),
    Soal('e', '8. Saya banyak merasa cemas atau khawatir terhadap apapun', 0, 1 ,2),
    Soal('pro', '9. Saya selalu siap menolong jika seseorang terluka, kecewa atau merasa sakit', 0, 1 ,2),
    Soal('h', '10. Bila sedang gelisah atau cemas badan saya sering bergerak –gerask tanpa saya sadari', 0, 1 ,2),
    Soal('p', '11. Saya mempunyai satu orang teman baik atau lebih', 2, 1 ,0),
    Soal('c', '12. Saya sering bertengkar dengan orang lain. Saya dapat memaksa orang lain melakukan apa  yang saya inginkan', 0, 1 ,2),
    Soal('e', '13. Saya sering merasa tidak bahagia, sedih atau menangis', 0, 1 ,2),
    Soal('p', '14. Orang lain seusia saya umumnya menyukai saya', 2, 1 ,0),
    Soal('h', '15. Perhatian saya mudah teralih, saya sulit untuk memusatkan perhatian pada apapun ', 0, 1 ,2),
    Soal('e', '16. Saya merasa gugup dalam situasi baru, saya mudah kehilangan rasa percaya Diri', 0, 1 ,2),
    Soal('pro', '17. Saya bersikap baik terhadap anak-anak yang lebih muda dari saya', 0, 1 ,2),
    Soal('c', '18. Saya sering dituduh berbohong atau berbuat curang', 0, 1 ,2),
    Soal('p', '19. Saya sering diganggu atau dipermainkan oleh anak-anak atau remaja lainnya', 0, 1 ,2),
    Soal('pro', '20. Saya sering menawarkan diri untuk membantu orang lain (orang tua, guru, anak-anak )', 0, 1 ,2),
    Soal('h', '21. Saya berpikir terlebih dulu akibat yang akan terjadi, sebelum berbuat atau melakukan sesuatu', 2, 1 ,0),
    Soal('c', '22. Saya mengambil barang yang bukan milik saya dari rumah, sekolah atau dari mana saja', 0, 1 ,2),
    Soal('p', '23. Saya lebih mudah berteman dengan orang dewasa daripada dengan orang seusia Saya', 0, 1 ,2),
    Soal('e', '24. Banyak yang saya takuti, saya mudah menjadi takut', 0, 1 ,2),
    Soal('h', '25. Saya menyelesaikan pekerjaan yang sedang saya lakukan. Saya mempunyai perhatian  yang baik terhadap apapun.', 2, 1 ,0),
  ];

  int index = 1;
  int hasil_e = 0;
  int hasil_c = 0;
  int hasil_h = 0;
  int hasil_p = 0;
  int hasil_pro = 0;

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
          title: Text('Soal SDQ (Umur 11 - 18)' ),
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
                child: Text(soal[index].soal,
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
                      if(index<25){
                        if (soal[index].kategori == 'e'){
                          hasil_e = hasil_e + soal[index].nilai_1;
                        } else if (soal[index].kategori == 'c'){
                          hasil_c = hasil_c + soal[index].nilai_1;
                        } else if (soal[index].kategori == 'h'){
                          hasil_h = hasil_h + soal[index].nilai_1;
                        } else if (soal[index].kategori == 'p'){
                          hasil_p = hasil_p + soal[index].nilai_1;
                        } else {
                          hasil_pro = hasil_pro + soal[index].nilai_1;
                        }

                        // Buat nambah nomor soal
                        index++;

                      } else {
                        if (soal[index].kategori == 'e'){
                          hasil_e = hasil_e + soal[index].nilai_1;
                        } else if (soal[index].kategori == 'c'){
                          hasil_c = hasil_c + soal[index].nilai_1;
                        } else if (soal[index].kategori == 'h'){
                          hasil_h = hasil_h + soal[index].nilai_1;
                        } else if (soal[index].kategori == 'p'){
                          hasil_p = hasil_p + soal[index].nilai_1;
                        } else {
                          hasil_pro = hasil_pro + soal[index].nilai_1;
                        }
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => HasilSdq(nama: widget.nama,umur: widget.umur, instansi: widget.instansi , skor_e: hasil_e, skor_c: hasil_c, skor_h: hasil_h, skor_p: hasil_p, skor_pro: hasil_pro, login: widget.login, tipe: '11-18',)));
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
                      if(index<25){
                        if (soal[index].kategori == 'e'){
                          hasil_e = hasil_e + soal[index].nilai_2;
                        } else if (soal[index].kategori == 'c'){
                          hasil_c = hasil_c + soal[index].nilai_2;
                        } else if (soal[index].kategori == 'h'){
                          hasil_h = hasil_h + soal[index].nilai_2;
                        } else if (soal[index].kategori == 'p'){
                          hasil_p = hasil_p + soal[index].nilai_2;
                        } else {
                          hasil_pro = hasil_pro + soal[index].nilai_2;
                        }
                        index++;
                      } else {
                        if (soal[index].kategori == 'e'){
                          hasil_e = hasil_e + soal[index].nilai_2;
                        } else if (soal[index].kategori == 'c'){
                          hasil_c = hasil_c + soal[index].nilai_2;
                        } else if (soal[index].kategori == 'h'){
                          hasil_h = hasil_h + soal[index].nilai_2;
                        } else if (soal[index].kategori == 'p'){
                          hasil_p = hasil_p + soal[index].nilai_2;
                        } else {
                          hasil_pro = hasil_pro + soal[index].nilai_2;
                        }
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => HasilSdq(nama: widget.nama,umur: widget.umur, instansi: widget.instansi , skor_e: hasil_e, skor_c: hasil_c, skor_h: hasil_h, skor_p: hasil_p, skor_pro: hasil_pro, login: widget.login, tipe: '11-18',)));
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
                      if(index<25){
                        print(hasil_e);
                        print(hasil_c);
                        if (soal[index].kategori == 'e'){
                          hasil_e = hasil_e + soal[index].nilai_3;
                        } else if (soal[index].kategori.toString() == "c"){
                          hasil_c = hasil_c + soal[index].nilai_3;
                        } else if (soal[index].kategori == 'h'){
                          hasil_h = hasil_h + soal[index].nilai_3;
                        } else if (soal[index].kategori == 'p'){
                          hasil_p = hasil_p + soal[index].nilai_3;
                        } else {
                          hasil_pro = hasil_pro + soal[index].nilai_3;
                        }
                        index++;
                      } else {
                        if (soal[index].kategori == 'e'){
                          hasil_e = hasil_e + soal[index].nilai_3;
                        } else if (soal[index].kategori == 'c'){
                          hasil_c = hasil_c + soal[index].nilai_3;
                        } else if (soal[index].kategori == 'h'){
                          hasil_h = hasil_h + soal[index].nilai_3;
                        } else if (soal[index].kategori == 'p'){
                          hasil_p = hasil_p + soal[index].nilai_3;
                        } else {
                          hasil_pro = hasil_pro + soal[index].nilai_3;
                        }
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => HasilSdq(nama: widget.nama,umur: widget.umur, instansi: widget.instansi , skor_e: hasil_e, skor_c: hasil_c, skor_h: hasil_h, skor_p: hasil_p, skor_pro: hasil_pro, login: widget.login, tipe: '11-18',)));
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
        )
    );
  }
}
