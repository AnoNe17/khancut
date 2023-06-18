import 'package:flutter/material.dart';
import 'package:untitled/dashboard.dart';
import 'package:untitled/kuisioner.dart';
import 'package:untitled/main.dart';
import 'package:untitled/api/api.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class HasilSrq extends StatefulWidget {

  final int hasil;
  final bool login;

  final String nama, umur, no_hp, alamat, pekerjaan;

  const HasilSrq({Key? key, required this.hasil, required this.login, required this.nama, required this.umur, required this.no_hp, required this.alamat, required this.pekerjaan}) : super(key: key);

  @override
  State<HasilSrq> createState() => _HasilSrqState();
}

class _HasilSrqState extends State<HasilSrq> {

  String hasil_akhir = "";

  initState() {
    super.initState();
    if(widget.hasil <= 8){
      hasil_akhir = 'Normal';
    } else {
      hasil_akhir = 'Abnormal';
    }

    try {
      API.tambahHasilSRQ(widget.nama, widget.umur, widget.no_hp, widget.alamat, widget.pekerjaan, hasil_akhir)
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
              title: Text("Hasil Kusioner SRQ"),
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
                            Text("Skor Akhir Kuis SRQ",
                              textAlign: TextAlign.justify,
                              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700,),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            _card('Skor', widget.hasil.toString(), hasil_akhir, Colors.green),
                            SizedBox(
                              height: 50,
                            ),
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
            Text("No HP :",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700, color: Colors.orangeAccent),
            ),
            Text(widget.no_hp.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700,color: Color(0xff43978D)),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Alamat :",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700, color: Colors.orangeAccent),
            ),
            Text(widget.alamat.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700,color: Color(0xff43978D)),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Pekerjaan :",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700, color: Colors.orangeAccent),
            ),
            Text(widget.pekerjaan.toString(),
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
