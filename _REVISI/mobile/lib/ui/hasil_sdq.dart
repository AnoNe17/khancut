import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:untitled/api/api.dart';
import 'package:untitled/dashboard/home.dart';
import 'package:untitled/kuisioner.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/widgets/menu.dart';

class HasilSdq extends StatefulWidget {
  final int skor_e, skor_c, skor_h, skor_p, skor_pro;

  final bool login;

  final String nama, umur, instansi, tipe;

  const HasilSdq(
      {Key? key,
      required this.nama,
      required this.umur,
      required this.instansi,
      required this.skor_e,
      required this.skor_c,
      required this.skor_h,
      required this.skor_p,
      required this.skor_pro,
      required this.login,
      required this.tipe})
      : super(key: key);

  @override
  State<HasilSdq> createState() => _HasilSdqState();
}

class _HasilSdqState extends State<HasilSdq> {
  String id_sdq = '';
  String total_string = "";
  String hasil_e = "";
  String hasil_c = "";
  String hasil_h = "";
  String hasil_p = "";
  String hasil_pro = "";
  String hasil_keseluruhan = "";
  String ket_e = '';
  String ket_c = '';
  String ket_h = '';
  String ket_p = '';
  String ket_pro = '';
  int total = 0;

  @override
  void initState() {
    int total = widget.skor_e +
        widget.skor_c +
        widget.skor_h +
        widget.skor_p +
        widget.skor_pro;
    // Jika umur antara 4-11
    if (widget.tipe == '4_11') {
      // Total Kesulitan
      if (total <= 13) {
        total_string = total.toString();
        hasil_keseluruhan = 'Normal';
      } else if (total >= 14 && total <= 15) {
        total_string = total.toString();
        hasil_keseluruhan = 'Ambang';
      } else {
        total_string = total.toString();
        hasil_keseluruhan = 'Abnormal';
      }

      // Skor e
      if (widget.skor_e <= 3) {
        hasil_e = 'Normal';
        ket_e =
            '1. Tidak merasakan sakit badan\n2. Tidak ada rasa khawatir\n3. Bahagia\n4. Percaya diri yang tinggi\n5.Berani';
      } else if (widget.skor_e == 4) {
        hasil_e = 'Ambang';
        ket_e =
            '1. Sering mengeluh sakit badan ( seperti sakit kepala )\n2. Banyak kekhawatiran\n3. Sering tidak bahagia, menangis\n4. Gugup atau mudah hilang percaya diri\n5. Mudah takut';
      } else {
        hasil_e = 'Abnormal';
        ket_e =
            '1. Sering mengeluh sakit badan ( seperti sakit kepala )\n2. Banyak kekhawatiran\n3. Sering tidak bahagia, menangis\n4. Gugup atau mudah hilang percaya diri\n5. Mudah takut';
      }

      // Skor c
      if (widget.skor_c <= 2) {
        hasil_c = 'Normal';
        ket_c =
            '1. Tidak mudah marah\n2. Memiliki kepribadian dan perilaku yang baik, teguh pada pendirian diri sendiri\n3. Tidak pernah melakukan perkelahian\n4. Tidak berbohong dan tidak melakukan kecurangan dalam hal apapun\n5. Tidak mencuri';
      } else if (widget.skor_c == 3) {
        hasil_c = 'Ambang';
        ket_c =
            '1. Sering marah meledak-ledak\n2. Umunya berprilaku tidak baik, tidak melakukan apa yang diminta orang dewasa\n3. Sering berkelahi\n4. Sering berbohong, curang\n5. Mencuri';
      } else {
        hasil_c = 'Abnormal';
        ket_c =
            '1. Sering marah meledak-ledak\n2. Umunya berprilaku tidak baik, tidak melakukan apa yang diminta orang dewasa\n3. Sering berkelahi\n4. Sering berbohong, curang\n5. Mencuri';
      }

      // Skor h
      if (widget.skor_h <= 5) {
        hasil_h = 'Normal';
        ket_h =
            '1. Tidak merasa gelisah, dan dapat mengendalikan sikap\n2. Dapat mengendalikan diri dan tidak mudah resah\n3. Konsentrasi\n4. Berpikir panjang sebelum melakukan sesuatu\n5. Mampu menyelesaikan tugas sampai selesai';
      } else if (widget.skor_h == 6) {
        hasil_h = 'Ambang';
        ket_h =
            '1. Gelisah, terlalu aktif, tidak dapat diam lama\n2. Terus bergerak dengan resah\n3. Mudah teralih, konsentrasi buyar\n4. Tidak berpikir sebelum bertindak\n5. Tidak mampu menyelesaikan tugas sampai selesai';
      } else {
        hasil_h = 'Abnormal';
        ket_h =
            '1. Gelisah, terlalu aktif, tidak dapat diam lama\n2. Terus bergerak dengan resah\n3. Mudah teralih, konsentrasi buyar\n4. Tidak berpikir sebelum bertindak\n5. Tidak mampu menyelesaikan tugas sampai selesai';
      }

      // Skor p
      if (widget.skor_p <= 2) {
        hasil_p = 'Normal';
        ket_p =
            '1. Senang bergaul\n2. Memiliki sahabat / teman baik\n3. Memiliki banyak teman dan dapat bersosialisasi dengan orang banyak\n4. Bergaul dengan anak anak yang seusia nya';
      } else if (widget.skor_p == 3) {
        hasil_p = 'Ambang';
        ket_p =
            '1. Cenderung menyendiri, lebih senang main sendiri\n2. Tidak punya 1 teman baik\n3. Tidak disukai anak-anak lain\n4. Diganggu/digerak oleh anak lain\n5.	Bergaul lebih baik dengan orang dewasa dari pada anak-anak';
      } else {
        hasil_p = 'Abnormal';
        ket_p =
            '1. Cenderung menyendiri, lebih senang main sendiri\n2. Tidak punya 1 teman baik\n3. Tidak disukai anak-anak lain\n4. Diganggu/digerak oleh anak lain\n5.	Bergaul lebih baik dengan orang dewasa dari pada anak-anak';
      }

      // Skor Pro
      if (widget.skor_pro <= 4) {
        hasil_pro = 'Normal';
        ket_pro =
            '1.	Mampu mempertimbangkan perasaan orang lain\n2. Bersedia berbagi dengan anak lain. - Suka Menolong\n3. Bersikap baik pada anak yang lebih muda\n4. Sering menawarkan diri membantu orang lain';
      } else if (widget.skor_pro == 5) {
        hasil_pro = 'Ambang';
        ket_pro =
            '1. Tidak Dapat menjaga perasaan orang lain\n2. Cuek\n3. Tidak suka membantu dengan orang lain / cuek\n4. Memliki sikap yang tidak baik';
      } else {
        hasil_pro = 'Abnormal';
        ket_pro =
            '1. Tidak Dapat menjaga perasaan orang lain\n2. Cuek\n3. Tidak suka membantu dengan orang lain / cuek\n4. Memliki sikap yang tidak baik';
      }
    } else {
      // Jika umur antara 11-18

      // total
      if (total <= 15) {
        total_string = total.toString();
        hasil_keseluruhan = 'Normal';
      } else if (total >= 16 && total <= 19) {
        total_string = total.toString();
        hasil_keseluruhan = 'Ambang';
      } else {
        total_string = total.toString();
        hasil_keseluruhan = 'Abnormal';
      }

      // Skor e
      if (widget.skor_e <= 5) {
        hasil_e = 'Normal';
        ket_e =
            '1. Tidak merasakan sakit badan\n2. Tidak ada rasa khawatir\n3. Bahagia\n4. Percaya diri yang tinggi\n5.Berani';
      } else if (widget.skor_e == 6) {
        hasil_e = 'Ambang';
        ket_e =
            '1. Sering mengeluh sakit badan ( seperti sakit kepala )\n2. Banyak kekhawatiran\n3. Sering tidak bahagia, menangis\n4. Gugup atau mudah hilang percaya diri\n5. Mudah takut';
      } else {
        hasil_e = 'Abnormal';
        ket_e =
            '1. Sering mengeluh sakit badan ( seperti sakit kepala )\n2. Banyak kekhawatiran\n3. Sering tidak bahagia, menangis\n4. Gugup atau mudah hilang percaya diri\n5. Mudah takut';
      }

      // Skor c
      if (widget.skor_c <= 3) {
        hasil_c = 'Normal';
        ket_c =
            '1. Tidak mudah marah\n2. Memiliki kepribadian dan perilaku yang baik, teguh pada pendirian diri sendiri\n3. Tidak pernah melakukan perkelahian\n4. Tidak berbohong dan tidak melakukan kecurangan dalam hal apapun\n5. Tidak mencuri';
      } else if (widget.skor_c == 4) {
        hasil_c = 'Ambang';
        ket_c =
            '1. Sering marah meledak-ledak\n2. Umunya berprilaku tidak baik, tidak melakukan apa yang diminta orang dewasa\n3. Sering berkelahi\n4. Sering berbohong, curang\n5. Mencuri';
      } else {
        hasil_c = 'Abnormal';
        ket_c =
            '1. Sering marah meledak-ledak\n2. Umunya berprilaku tidak baik, tidak melakukan apa yang diminta orang dewasa\n3. Sering berkelahi\n4. Sering berbohong, curang\n5. Mencuri';
      }

      // Skor h
      if (widget.skor_h <= 5) {
        hasil_h = 'Normal';
        ket_h =
            '1. Tidak merasa gelisah, dan dapat mengendalikan sikap\n2. Dapat mengendalikan diri dan tidak mudah resah\n3. Konsentrasi\n4. Berpikir panjang sebelum melakukan sesuatu\n5. Mampu menyelesaikan tugas sampai selesai';
      } else if (widget.skor_h == 6) {
        hasil_h = 'Ambang';
        ket_h =
            '1. Gelisah, terlalu aktif, tidak dapat diam lama\n2. Terus bergerak dengan resah\n3. Mudah teralih, konsentrasi buyar\n4. Tidak berpikir sebelum bertindak\n5. Tidak mampu menyelesaikan tugas sampai selesai';
      } else {
        hasil_h = 'Abnormal';
        ket_h =
            '1. Gelisah, terlalu aktif, tidak dapat diam lama\n2. Terus bergerak dengan resah\n3. Mudah teralih, konsentrasi buyar\n4. Tidak berpikir sebelum bertindak\n5. Tidak mampu menyelesaikan tugas sampai selesai';
      }

      // Skor p
      if (widget.skor_p <= 3) {
        hasil_p = 'Normal';
        ket_p =
            '1. Senang bergaul\n2. Memiliki sahabat / teman baik\n3. Memiliki banyak teman dan dapat bersosialisasi dengan orang banyak\n4. Bergaul dengan anak anak yang seusia nya';
      } else if (widget.skor_p >= 4 && widget.skor_e <= 5) {
        hasil_p = 'Ambang';
        ket_p =
            '1. Cenderung menyendiri, lebih senang main sendiri\n2. Tidak punya 1 teman baik\n3. Tidak disukai anak-anak lain\n4. Diganggu/digerak oleh anak lain\n5.	Bergaul lebih baik dengan orang dewasa dari pada anak-anak';
      } else {
        hasil_p = 'Abnormal';
        ket_p =
            '1. Cenderung menyendiri, lebih senang main sendiri\n2. Tidak punya 1 teman baik\n3. Tidak disukai anak-anak lain\n4. Diganggu/digerak oleh anak lain\n5.	Bergaul lebih baik dengan orang dewasa dari pada anak-anak';
      }

      // Skor Pro
      if (widget.skor_pro <= 4) {
        hasil_pro = 'Normal';
        ket_pro =
            '1.	Mampu mempertimbangkan perasaan orang lain\n2. Bersedia berbagi dengan anak lain. - Suka Menolong\n3. Bersikap baik pada anak yang lebih muda\n4. Sering menawarkan diri membantu orang lain';
      } else if (widget.skor_pro == 5) {
        hasil_pro = 'Ambang';
        ket_pro =
            '1. Tidak Dapat menjaga perasaan orang lain\n2. Cuek\n3. Tidak suka membantu dengan orang lain / cuek\n4. Memliki sikap yang tidak baik';
      } else {
        hasil_pro = 'Abnormal';
        ket_pro =
            '1. Tidak Dapat menjaga perasaan orang lain\n2. Cuek\n3. Tidak suka membantu dengan orang lain / cuek\n4. Memliki sikap yang tidak baik';
      }
    }

    if (widget.login == true) {
      try {
        API
            .tambahHasilSDQPasien(
          widget.nama,
          widget.instansi,
          hasil_e,
          hasil_c,
          hasil_h,
          hasil_p,
          hasil_pro,
          widget.skor_e,
          widget.skor_c,
          widget.skor_h,
          widget.skor_p,
          widget.skor_pro,
          hasil_keseluruhan,
          total,
        )
            .then((value) async {
          // await
          setState(() {
            id_sdq == value;
          });

          AwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            animType: AnimType.scale,
            headerAnimationLoop: true,
            title: "Data Berhasil Di Input",
            btnOkOnPress: () {},
            btnOkIcon: Icons.cancel,
            btnOkColor: Colors.red,
          ).show();
        });
      } catch (e) {}
    } else {
      try {
        API
            .tambahHasilSDQ(
          widget.nama,
          widget.instansi,
          hasil_e,
          hasil_c,
          hasil_h,
          hasil_p,
          hasil_pro,
          widget.skor_e,
          widget.skor_c,
          widget.skor_h,
          widget.skor_p,
          widget.skor_pro,
          hasil_keseluruhan,
          total,
        )
            .then((value) async {
          // await
          setState(() {
            id_sdq == value;
          });

          AwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            animType: AnimType.scale,
            headerAnimationLoop: true,
            title: "Data Berhasil Di Input",
            btnOkOnPress: () {},
            btnOkIcon: Icons.cancel,
            btnOkColor: Colors.red,
          ).show();
        });
      } catch (e) {}
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
            appBar: AppBar(
              title: Text("Hasil Kuisioner SDQ"),
              automaticallyImplyLeading: false,
            ),
            body: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.only(top: 20.0),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          _card_data(),
                          SizedBox(
                            height: 30,
                          ),
                          // Text("Skor Akhir Keseluruhan",
                          //   textAlign: TextAlign.justify,
                          //   style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700,),
                          // ),
                          // SizedBox(
                          //   height: 20,
                          // ),
                          if (hasil_keseluruhan == 'Normal') ...[
                            _card('Skor Keseluruhan', total_string.toString(),
                                hasil_keseluruhan, Colors.green),
                          ] else if (hasil_keseluruhan == 'Ambang') ...[
                            _card('Skor Keseluruhan', total_string.toString(),
                                hasil_keseluruhan, Colors.yellow),
                          ] else ...[
                            _card('Skor Keseluruhan', total_string.toString(),
                                hasil_keseluruhan, Colors.red),
                          ],
                          SizedBox(
                            height: 30,
                          ),
                          if (hasil_e == 'Normal') ...[
                            InkWell(
                              onTap: () {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.info,
                                  animType: AnimType.scale,
                                  headerAnimationLoop: true,
                                  title: ket_e,
                                  btnOkOnPress: () {},
                                  btnOkIcon: Icons.cancel,
                                  btnOkColor: Colors.blue,
                                ).show();
                              },
                              child: _card(
                                  'Gejala Emosional',
                                  widget.skor_e.toString(),
                                  hasil_e,
                                  Colors.green),
                            ),
                          ] else if (hasil_e == 'Ambang') ...[
                            InkWell(
                              onTap: () {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.info,
                                  animType: AnimType.scale,
                                  headerAnimationLoop: true,
                                  title: ket_e,
                                  btnOkOnPress: () {},
                                  btnOkIcon: Icons.cancel,
                                  btnOkColor: Colors.blue,
                                ).show();
                              },
                              child: _card(
                                  'Gejala Emosional',
                                  widget.skor_e.toString(),
                                  hasil_e,
                                  Colors.yellow),
                            ),
                          ] else ...[
                            InkWell(
                              onTap: () {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.info,
                                  animType: AnimType.scale,
                                  headerAnimationLoop: true,
                                  title: ket_e,
                                  btnOkOnPress: () {},
                                  btnOkIcon: Icons.cancel,
                                  btnOkColor: Colors.blue,
                                ).show();
                              },
                              child: _card(
                                  'Gejala Emosional',
                                  widget.skor_e.toString(),
                                  hasil_e,
                                  Colors.red),
                            ),
                          ],
                          SizedBox(
                            height: 10,
                          ),
                          if (hasil_c == 'Normal') ...[
                            InkWell(
                              onTap: () {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.info,
                                  animType: AnimType.scale,
                                  headerAnimationLoop: true,
                                  title: ket_c,
                                  btnOkOnPress: () {},
                                  btnOkIcon: Icons.cancel,
                                  btnOkColor: Colors.blue,
                                ).show();
                              },
                              child: _card(
                                  'Masalah Perilaku',
                                  widget.skor_c.toString(),
                                  hasil_c,
                                  Colors.green),
                            ),
                          ] else if (hasil_c == 'Ambang') ...[
                            InkWell(
                              onTap: () {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.info,
                                  animType: AnimType.scale,
                                  headerAnimationLoop: true,
                                  title: ket_c,
                                  btnOkOnPress: () {},
                                  btnOkIcon: Icons.cancel,
                                  btnOkColor: Colors.blue,
                                ).show();
                              },
                              child: _card(
                                  'Masalah Perilaku',
                                  widget.skor_c.toString(),
                                  hasil_c,
                                  Colors.yellow),
                            ),
                          ] else ...[
                            InkWell(
                              onTap: () {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.info,
                                  animType: AnimType.scale,
                                  headerAnimationLoop: true,
                                  title: ket_c,
                                  btnOkOnPress: () {},
                                  btnOkIcon: Icons.cancel,
                                  btnOkColor: Colors.blue,
                                ).show();
                              },
                              child: _card(
                                  'Masalah Perilaku',
                                  widget.skor_c.toString(),
                                  hasil_c,
                                  Colors.red),
                            ),
                          ],
                          SizedBox(
                            height: 10,
                          ),
                          if (hasil_h == 'Normal') ...[
                            InkWell(
                              onTap: () {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.info,
                                  animType: AnimType.scale,
                                  headerAnimationLoop: true,
                                  title: ket_h,
                                  btnOkOnPress: () {},
                                  btnOkIcon: Icons.cancel,
                                  btnOkColor: Colors.blue,
                                ).show();
                              },
                              child: _card(
                                  'Hiperaktivitas',
                                  widget.skor_h.toString(),
                                  hasil_h,
                                  Colors.green),
                            ),
                          ] else if (hasil_h == 'Ambang') ...[
                            InkWell(
                              onTap: () {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.info,
                                  animType: AnimType.scale,
                                  headerAnimationLoop: true,
                                  title: ket_h,
                                  btnOkOnPress: () {},
                                  btnOkIcon: Icons.cancel,
                                  btnOkColor: Colors.blue,
                                ).show();
                              },
                              child: _card(
                                  'Hiperaktivitas',
                                  widget.skor_h.toString(),
                                  hasil_h,
                                  Colors.yellow),
                            ),
                          ] else ...[
                            InkWell(
                              onTap: () {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.info,
                                  animType: AnimType.scale,
                                  headerAnimationLoop: true,
                                  title: ket_h,
                                  btnOkOnPress: () {},
                                  btnOkIcon: Icons.cancel,
                                  btnOkColor: Colors.blue,
                                ).show();
                              },
                              child: _card(
                                  'Hiperaktivitas',
                                  widget.skor_h.toString(),
                                  hasil_h,
                                  Colors.red),
                            ),
                          ],
                          SizedBox(
                            height: 10,
                          ),
                          if (hasil_p == 'Normal') ...[
                            InkWell(
                              onTap: () {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.info,
                                  animType: AnimType.scale,
                                  headerAnimationLoop: true,
                                  title: ket_p,
                                  btnOkOnPress: () {},
                                  btnOkIcon: Icons.cancel,
                                  btnOkColor: Colors.blue,
                                ).show();
                              },
                              child: _card(
                                  'Masalah Teman Sebaya',
                                  widget.skor_p.toString(),
                                  hasil_p,
                                  Colors.green),
                            ),
                          ] else if (hasil_p == 'Ambang') ...[
                            InkWell(
                              onTap: () {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.info,
                                  animType: AnimType.scale,
                                  headerAnimationLoop: true,
                                  title: ket_p,
                                  btnOkOnPress: () {},
                                  btnOkIcon: Icons.cancel,
                                  btnOkColor: Colors.blue,
                                ).show();
                              },
                              child: _card(
                                  'Masalah Teman Sebaya',
                                  widget.skor_p.toString(),
                                  hasil_p,
                                  Colors.yellow),
                            ),
                          ] else ...[
                            InkWell(
                              onTap: () {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.info,
                                  animType: AnimType.scale,
                                  headerAnimationLoop: true,
                                  title: ket_p,
                                  btnOkOnPress: () {},
                                  btnOkIcon: Icons.cancel,
                                  btnOkColor: Colors.blue,
                                ).show();
                              },
                              child: _card(
                                  'Masalah Teman Sebaya',
                                  widget.skor_p.toString(),
                                  hasil_p,
                                  Colors.red),
                            ),
                          ],
                          SizedBox(
                            height: 10,
                          ),
                          if (hasil_pro == 'Normal') ...[
                            InkWell(
                              onTap: () {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.info,
                                  animType: AnimType.scale,
                                  headerAnimationLoop: true,
                                  title: ket_pro,
                                  btnOkOnPress: () {},
                                  btnOkIcon: Icons.cancel,
                                  btnOkColor: Colors.blue,
                                ).show();
                              },
                              child: _card(
                                  'Perilaku Proposional',
                                  widget.skor_pro.toString(),
                                  hasil_pro,
                                  Colors.green),
                            ),
                          ] else if (hasil_pro == 'Ambang') ...[
                            InkWell(
                              onTap: () {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.info,
                                  animType: AnimType.scale,
                                  headerAnimationLoop: true,
                                  title: ket_pro,
                                  btnOkOnPress: () {},
                                  btnOkIcon: Icons.cancel,
                                  btnOkColor: Colors.blue,
                                ).show();
                              },
                              child: _card(
                                  'Perilaku Proposional',
                                  widget.skor_pro.toString(),
                                  hasil_pro,
                                  Colors.yellow),
                            ),
                          ] else ...[
                            InkWell(
                              onTap: () {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.info,
                                  animType: AnimType.scale,
                                  headerAnimationLoop: true,
                                  title: ket_pro,
                                  btnOkOnPress: () {},
                                  btnOkIcon: Icons.cancel,
                                  btnOkColor: Colors.blue,
                                ).show();
                              },
                              child: _card(
                                  'Perilaku Proposional',
                                  widget.skor_pro.toString(),
                                  hasil_pro,
                                  Colors.red),
                            ),
                          ],
                          SizedBox(
                            height: 50,
                          ),
                          Container(
                            margin:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            width: double.infinity,
                            height: 70,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Color(0xffF18265),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              onPressed: () {
                                if (widget.login == true) {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) => Home()));
                                } else {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) => Kuisioner()));
                                }
                              },
                              child: Text(
                                "Kembali",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xffffffff),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          if (widget.login == true)
                            ...[]
                          else ...[
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              width: double.infinity,
                              height: 70,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: Color(0xff43978D),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                onPressed: () {
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.question,
                                    animType: AnimType.scale,
                                    headerAnimationLoop: true,
                                    title: "Ingin melanjutkan perawatan ?",
                                    btnCancelText: "Tidak",
                                    btnCancelOnPress: () {
                                      pdfSDQ();
                                      AwesomeDialog(
                                        context: context,
                                        dialogType: DialogType.info,
                                        animType: AnimType.scale,
                                        headerAnimationLoop: true,
                                        title:
                                            'Hasil Kuisioner berhasil di simpan, Silahkan cek di folder Download',
                                        btnOkOnPress: () {},
                                        onDismissCallback: (type) {
                                          if (widget.login == true) {
                                            Navigator.of(context)
                                                .pushReplacement(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Menu()));
                                          } else {
                                            Navigator.of(context)
                                                .pushReplacement(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Kuisioner()));
                                          }
                                        },
                                        btnOkIcon: Icons.cancel,
                                        btnOkColor: Colors.blue,
                                      ).show();
                                    },
                                    btnOkOnPress: () {
                                      pdfSDQPasienBaru();
                                      AwesomeDialog(
                                          context: context,
                                          dialogType: DialogType.info,
                                          animType: AnimType.scale,
                                          headerAnimationLoop: true,
                                          title:
                                              'Hasil Kuisioner berhasil di simpan, Silahkan cek di folder Download',
                                          btnOkOnPress: () {},
                                          btnOkIcon: Icons.cancel,
                                          btnOkColor: Colors.blue,
                                          onDismissCallback: (type) {
                                            if (widget.login == true) {
                                              Navigator.of(context)
                                                  .pushReplacement(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Menu()));
                                            } else {
                                              Navigator.of(context)
                                                  .pushReplacement(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Kuisioner()));
                                            }
                                          }).show();
                                    },
                                    btnOkColor: Colors.blue,
                                  ).show();
                                },
                                child: Text(
                                  "Cetak Hasil PDF",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                    SizedBox(height: 50),
                  ],
                ),
              ),
            )),
        onWillPop: () async {
          if (widget.login == true) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Home()));
          } else {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Kuisioner()));
          }
          return true;
        });
  }

  void pdfSDQPasienBaru() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Map data = {
      "id": prefs.getString('id_sdq'),
      "pasien_baru": "true",
    };

    var time = DateTime.now().millisecondsSinceEpoch;
    var path = "storage/emulated/0/Download/Hasil-SDQ-" +
        widget.nama.toString() +
        "-Pasien-Baru.pdf";
    var file = File(path);
    var res = await post(
        Uri.parse("https://puskesmaskertasemaya.com/api/hasil_sdq/pdf"),
        body: data);
    file.writeAsBytes(res.bodyBytes);
  }

  void pdfSDQ() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Map data = {
      "id": prefs.getString('id_sdq'),
    };

    var time = DateTime.now().millisecondsSinceEpoch;
    var path = "storage/emulated/0/Download/Hasil-SDQ-" +
        widget.nama.toString() +
        ".pdf";
    var file = File(path);
    var res = await post(
        Uri.parse("https://puskesmaskertasemaya.com/api/hasil_sdq/pdf"),
        body: data);
    file.writeAsBytes(res.bodyBytes);
  }

  Widget _card(
      String? nama_hasil, String? total, String hasil, MaterialColor color) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.65,
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              nama_hasil.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(width: 2),
                shape: BoxShape.circle,
                color: color,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    total.toString(),
                    style: TextStyle(fontSize: 40),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              hasil.toString(),
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
            // SizedBox(height: 40,),
          ],
        ),
      ),
    );
  }

  Widget _card_data() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        // margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              "Nama :",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: Colors.orangeAccent),
            ),
            Text(
              widget.nama.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff43978D)),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Umur :",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: Colors.orangeAccent),
            ),
            Text(
              widget.umur.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff43978D)),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Instansi :",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: Colors.orangeAccent),
            ),
            Text(
              widget.instansi.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff43978D)),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
