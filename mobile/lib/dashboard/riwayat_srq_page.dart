import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:untitled/api/api.dart';
import 'package:untitled/api/model/riwayat_srq.dart';
import 'dart:io';
import 'dart:convert';
import 'package:awesome_dialog/awesome_dialog.dart';

class RiwayatSRQPage extends StatefulWidget {
  const RiwayatSRQPage({Key? key}) : super(key: key);

  @override
  State<RiwayatSRQPage> createState() => _RiwayatSRQPageState();
}

class _RiwayatSRQPageState extends State<RiwayatSRQPage> {
  List<RiwayatSRQ> riwayatSRQ = [];
  API api = API();

  getriwayatSRQ() async {
    riwayatSRQ = await api.riwayatSRQ();
    setState(() {});
  }

  @override
  void initState() {
    // http.getSemester_1();
    getriwayatSRQ();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (riwayatSRQ.isEmpty) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepOrangeAccent,
            toolbarHeight: 80,
            title: Text('Riwayat Kuisioner SRQ'),
          ),
          body: RefreshIndicator(
            onRefresh: () => getriwayatSRQ(),
            child: Center(
              child: Text(
                "Belum ada riwayat SRQ",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ));
    } else {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepOrangeAccent,
            toolbarHeight: 80,
            title: Text('Riwayat Kuisioner SRQ'),
          ),
          body: RefreshIndicator(
            onRefresh: () => getriwayatSRQ(),
            child: Container(
              margin: EdgeInsets.only(bottom: 50),
              child: ListView.builder(
                itemCount: riwayatSRQ.length,
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
                          "${riwayatSRQ[index].tanggal.toString()}",
                          style: TextStyle(fontSize: 20, color: Colors.orange),
                        ),
                      ],
                    ),
                    children: [
                      Column(
                        children: [
                          _card(
                            riwayatSRQ[index].id,
                            "${riwayatSRQ[index].total}",
                            "${riwayatSRQ[index].hasil}",
                            "${riwayatSRQ[index].masalah_psikologis}",
                            "${riwayatSRQ[index].pengguna_narkoba}",
                            "${riwayatSRQ[index].gangguan_psikotik}",
                            "${riwayatSRQ[index].gangguan_ptsd}",
                            "${riwayatSRQ[index].tanggal}",
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
          ));
    }
  }

  Widget _card(
      int? srq_id,
      String total,
      String hasil,
      String masalah_psikologis,
      String pengguna_narkoba,
      String gangguan_psikotik,
      String gangguan_ptsd,
      String tanggal) {
    return GestureDetector(
      onTap: () {
        pdfSRQ(srq_id, tanggal);
        AwesomeDialog(
          context: context,
          dialogType: DialogType.info,
          animType: AnimType.scale,
          headerAnimationLoop: true,
          title:
              'Hasil Kuisioner berhasil di simpan, Silahkan cek di folder Download',
          btnOkOnPress: () {},
          onDismissCallback: (type) {},
          btnOkIcon: Icons.cancel,
          btnOkColor: Colors.blue,
        ).show();
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
                  _cardHasil("Masalah Psikologis :\t", masalah_psikologis),
                  _cardHasil("Pengguna Narkoba :\t", pengguna_narkoba),
                  _cardHasil("Gangguan Psikotik :\t", gangguan_psikotik),
                  _cardHasil("Gangguan PTSD :\t", gangguan_ptsd),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void pdfSRQ(int? srq_id, String tanggal) async {
    Map data = {
      "id": srq_id,
    };

    var body = json.encode(data);

    var time = DateTime.now().millisecondsSinceEpoch;
    var path =
        "storage/emulated/0/Download/" + "Hasil SRQ Pasien " + tanggal + ".pdf";
    var file = File(path);
    var res = await post(
        Uri.parse("https://www.puskesmaskertasemaya.com/api/hasil_sdq/pdf"),
        body: body);
    file.writeAsBytes(res.bodyBytes);
  }

  _cardHasil(String judul, String hasil) {
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
          if (hasil == 'tidak') ...[
            Text(
              hasil,
              style: TextStyle(
                color: Colors.green,
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
      ),
    );
  }
}
