import 'dart:async';

import 'package:flutter/material.dart';
import 'package:untitled/api/api.dart';
import 'package:untitled/dashboard.dart';
import 'package:untitled/kuisioner.dart';
import 'package:awesome_dialog/awesome_dialog.dart';


class HasilSdq extends StatefulWidget {

  final int hasil_e, hasil_c, hasil_h, hasil_p, hasil_pro;

  final bool login;

  final String nama, umur, instansi, tipe;


  const HasilSdq({Key? key, required this.nama, required this.umur, required this.instansi, required this.hasil_e, required this.hasil_c, required this.hasil_h, required this.hasil_p, required this.hasil_pro, required this.login, required this.tipe}) : super(key: key);

  @override
  State<HasilSdq> createState() => _HasilSdqState();
}

class _HasilSdqState extends State<HasilSdq> {

  String total_kesulitan = "";
  String total_string = "";
  String hasil_akhir_e = "";
  String hasil_akhir_c = "";
  String hasil_akhir_h = "";
  String hasil_akhir_p = "";
  String hasil_akhir_pro = "";
  int total = 0;

  initState() {
    super.initState();
    int total = widget.hasil_e + widget.hasil_c + widget.hasil_h + widget.hasil_p;
    // Jika umur antara 4-11
    if(widget.tipe == '4_11'){
      // Total Kesulitan
      if(total <= 13){
        total_string = total.toString();
        total_kesulitan = 'Normal';
      } else if(total >= 14 && total <= 15){
        total_string = total.toString();
        total_kesulitan = 'Borderline / Ambang';
      } else {
        total_string = total.toString();
        total_kesulitan = 'Abnormal';
      }

      // Skor e
      if(widget.hasil_e <= 3){
        hasil_akhir_e = 'Normal';
      } else if(widget.hasil_e == 4 ){
        hasil_akhir_e = 'Borderline / Ambang';
      } else {
        hasil_akhir_e = 'Abnormal';
      }

      // Skor c
      if(widget.hasil_c <= 2){
        hasil_akhir_c = 'Normal';
      } else if(widget.hasil_c == 3){
        hasil_akhir_c = 'Borderline / Ambang';
      } else {
        hasil_akhir_c = 'Abnormal';
      }

      // Skor h
      if(widget.hasil_h <= 5){
        hasil_akhir_h = 'Normal';
      } else if(widget.hasil_h == 6){
        hasil_akhir_h = 'Borderline / Ambang';
      } else {
        hasil_akhir_h = 'Abnormal';
      }

      // Skor p
      if(widget.hasil_p <= 2){
        hasil_akhir_p = 'Normal';
      } else if(widget.hasil_p == 3){
        hasil_akhir_p = 'Borderline / Ambang';
      } else {
        hasil_akhir_p = 'Abnormal';
      }

      // Skor Pro
      if(widget.hasil_pro <= 4){
        hasil_akhir_pro = 'Normal';
      } else if(widget.hasil_pro == 5){
        hasil_akhir_pro = 'Borderline / Ambang';
      } else {
        hasil_akhir_pro = 'Abnormal';
      }

    } else {
      // Jika umur antara 11-18

      // total
      if(total <= 15){
        total_string = total.toString();
        total_kesulitan = 'Normal';
      } else if(total >= 16 && total <= 19){
        total_string = total.toString();
        total_kesulitan = 'Borderline / Ambang';
      } else {
        total_string = total.toString();
        total_kesulitan = 'Abnormal';
      }

      // Skor e
      if(widget.hasil_e <= 5){
        hasil_akhir_e = 'Normal';
      } else if(widget.hasil_e == 6){
        hasil_akhir_e = 'Borderline / Ambang';
      } else {
        hasil_akhir_e = 'Abnormal';
      }

      // Skor c
      if(widget.hasil_c <= 3){
        hasil_akhir_c = 'Normal';
      } else if(widget.hasil_c == 4){
        hasil_akhir_c = 'Borderline / Ambang';
      } else {
        hasil_akhir_c = 'Abnormal';
      }

      // Skor h
      if(widget.hasil_h <= 5){
        hasil_akhir_h = 'Normal';
      } else if(widget.hasil_h == 6){
        hasil_akhir_h = 'Borderline / Ambang';
      } else {
        hasil_akhir_h = 'Abnormal';
      }

      // Skor p
      if(widget.hasil_p <= 3){
        hasil_akhir_p = 'Normal';
      } else if(widget.hasil_p >= 4 && widget.hasil_e <= 5){
        hasil_akhir_p = 'Borderline / Ambang';
      } else {
        hasil_akhir_p = 'Abnormal';
      }

      // Skor Pro
      if(widget.hasil_pro <= 4){
        hasil_akhir_pro = 'Normal';
      } else if(widget.hasil_pro == 5){
        hasil_akhir_pro = 'Borderline / Ambang';
      } else {
        hasil_akhir_pro = 'Abnormal';
      }
    }
    try {
      API.tambahHasilSDQ(widget.nama, widget.umur, widget.instansi, total_kesulitan, hasil_akhir_e, hasil_akhir_c, hasil_akhir_h, hasil_akhir_p, hasil_akhir_pro)
          .then((value) async {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          animType: AnimType.scale,
          headerAnimationLoop: true,
          title: value,
          btnOkOnPress: () {},
          btnOkIcon: Icons.cancel,
          btnOkColor: Colors.red,
        ).show();
      });
    } catch (e) {}
  }


  @override
  Widget build(BuildContext context) {

    return WillPopScope(
        child: Scaffold(
            appBar: AppBar(
              title: Text("Hasil Kusioner SDQ"),
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
                            Text("Skor Akhir Kesulitan",
                              textAlign: TextAlign.justify,
                              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700,),
                            ),
                            SizedBox(
                              height: 20,
                            ),_card('Total Skor Kesulitan', total_string.toString(), total_kesulitan, Colors.indigo),
                            SizedBox(
                              height: 10,
                            ),
                            _card('Gejala Emosional', widget.hasil_e.toString(), hasil_akhir_e, Colors.red),
                            SizedBox(
                              height: 10,
                            ),
                            _card('Masalah Perilaku', widget.hasil_c.toString(), hasil_akhir_c, Colors.yellow),
                            SizedBox(
                              height: 10,
                            ),
                            _card('Hiperaktivitas', widget.hasil_h.toString(), hasil_akhir_h, Colors.green),
                            SizedBox(
                              height: 10,
                            ),
                            _card('Masalah Teman Sebaya', widget.hasil_p.toString(), hasil_akhir_p, Colors.blue),
                            SizedBox(
                              height: 50,
                            ),
                            Text("Skor Akhir Kekuatan",
                              textAlign: TextAlign.justify,
                              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700,),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            _card('Perilaku Proposional', widget.hasil_pro.toString(), hasil_akhir_pro, Colors.cyan),
                            SizedBox(height: 50,),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 15.0),
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
                                  if(widget.login == true){
                                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Dashboard()));
                                  } else {
                                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Kuisioner()));
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
                          ],
                        )
                    ),
                    SizedBox(height: 50),
                  ],
                ),
              ),
            )
        ),
        onWillPop: () async {
          if(widget.login == true){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Dashboard()));
          } else {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Kuisioner()));
          }
          return true;
        });
  }

  Widget _card(String? nama_hasil, String? total, String hasil_akhir, MaterialColor color){
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
            Text(nama_hasil.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 20,),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(width: 2),
                shape: BoxShape.circle,
                color: color,
              ),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(total.toString(), style: TextStyle(fontSize: 40),),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Text(hasil_akhir.toString(),
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700,),
            ),
            // SizedBox(height: 40,),
          ],
        ),
      ),
    );
  }

  Widget _card_data(){
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
            Text("Nama :",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700,color: Colors.orangeAccent),
            ),
            Text(widget.nama.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700,color: Color(0xff43978D)),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Umur :",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700, color: Colors.orangeAccent),
            ),
            Text(widget.umur.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700,color: Color(0xff43978D)),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Instansi :",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700, color: Colors.orangeAccent),
            ),
            Text(widget.instansi.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700,color: Color(0xff43978D)),
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
