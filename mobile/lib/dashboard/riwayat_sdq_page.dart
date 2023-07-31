import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/api/api.dart';
import 'package:untitled/api/model/riwayat_sdq.dart';

class RiwayatSDQPage extends StatefulWidget {
  const RiwayatSDQPage({Key? key}) : super(key: key);

  @override
  State<RiwayatSDQPage> createState() => _RiwayatSDQPageState();
}

class _RiwayatSDQPageState extends State<RiwayatSDQPage> {
  List<RiwayatSDQ> riwayatSDQ = [];
  API api = API();

  getRiwayatSDQ() async {
    riwayatSDQ = await api.riwayatSDQ();
    setState(() {});
  }

  @override
  void initState() {
    // http.getSemester_1();
    getRiwayatSDQ();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (riwayatSDQ.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent,
          toolbarHeight: 80,
          title: Text('Riwayat Kuisioner SDQ'),
        ),
        body: Center(
          child: Text(
            "Belum ada riwayat SDQ",
            style: TextStyle(fontSize: 20),
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent,
          toolbarHeight: 80,
          title: Text('Riwayat Kuisioner SDQ'),
        ),
        body: Container(
          margin: EdgeInsets.only(bottom: 50),
          child: ListView.builder(
            itemCount: riwayatSDQ.length,
            itemBuilder: (context, index) {
              return SingleChildScrollView(
                  child: ExpansionTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Dibuat Pada : ",
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      "${riwayatSDQ[index].tanggal.toString()}",
                      style: TextStyle(fontSize: 20, color: Colors.orange),
                    ),
                  ],
                ),
                children: [
                  Column(
                    children: [
                      _card(
                        riwayatSDQ[index].id,
                        "${riwayatSDQ[index].skor_keseluruhan}",
                        "${riwayatSDQ[index].skor_e}",
                        "${riwayatSDQ[index].hasil_e}",
                        "${riwayatSDQ[index].skor_c}",
                        "${riwayatSDQ[index].hasil_c}",
                        "${riwayatSDQ[index].skor_h}",
                        "${riwayatSDQ[index].hasil_h}",
                        "${riwayatSDQ[index].skor_p}",
                        "${riwayatSDQ[index].hasil_p}",
                        "${riwayatSDQ[index].skor_pro}",
                        "${riwayatSDQ[index].hasil_pro}",
                        "${riwayatSDQ[index].tanggal}",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ],
              ));
            },
          ),
        ),
      );
    }
  }

  Widget _card(
    int? sdq_id,
    String skor_keseluruhan,
    String skor_e,
    String hasil_e,
    String skor_c,
    String hasil_c,
    String skor_h,
    String hasil_h,
    String skor_p,
    String hasil_p,
    String skor_pro,
    String hasil_pro,
    String tanggal,
  ) {
    return GestureDetector(
      onTap: () {
        // pdfSDQ(sdq_id, tanggal);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(width: 15.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // _cardSkor("Skor Keseluruhan : ", "Normal", skor_keseluruhan),
                  _cardHasil("Gejala Emosional :\t", hasil_e, skor_e),
                  _cardHasil("Gejala Perilaku :\t", hasil_c, skor_c),
                  _cardHasil("Hiperaktivitas :\t", hasil_h, skor_h),
                  _cardHasil("Masalah Teman Sebaya :\t", hasil_p, skor_p),
                  _cardHasil("Perilaku Proposional :\t", hasil_pro, skor_pro),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // void pdfSDQ(int? sdq_id, String nama) async {
  //   // final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   Map data = {
  //     "id": sdq_id.toString(),
  //   };

  //   var time = DateTime.now().millisecondsSinceEpoch;
  //   var path = "storage/emulated/0/Download/Hasil-SDQ-" + nama + ".pdf";
  //   var file = File(path);
  //   var res = await post(
  //       Uri.parse("https://puskesmaskertasemaya.com/api/hasil_sdq/pdf"),
  //       body: data);
  //   file.writeAsBytes(res.bodyBytes);
  // }

  _cardHasil(String judul, String hasil, String skor) {
    return Padding(
        padding: EdgeInsets.all(3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              judul,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18.0,
              ),
            ),
            if (hasil == 'NORMAL') ...[
              Text(
                hasil,
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.w500,
                  fontSize: 20.0,
                ),
              ),
            ] else if (hasil == 'BORDERLINE / AMBANG') ...[
              Text(
                hasil,
                style: TextStyle(
                  color: Colors.yellow,
                  fontWeight: FontWeight.w500,
                  fontSize: 20.0,
                ),
              ),
            ] else ...[
              Text(
                hasil,
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w500,
                  fontSize: 20.0,
                ),
              ),
            ],
          ],
        ));
  }
}
