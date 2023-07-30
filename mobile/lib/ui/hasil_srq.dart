import 'package:flutter/material.dart';
import 'package:untitled/dashboard/home.dart';
import 'package:untitled/kuisioner.dart';
import 'package:untitled/main.dart';
import 'package:untitled/api/api.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class HasilSrq extends StatefulWidget {

  final int total_psikologis;
  final int total_narkoba;
  final int total_psikotik;
  final int total_ptsd;
  final bool login;

  final String nama, umur, no_hp, alamat, pekerjaan;

  const HasilSrq({Key? key, required this.total_psikologis, required this.total_narkoba, required this.total_psikotik, required this.total_ptsd, required this.login, required this.nama, required this.umur, required this.no_hp, required this.alamat, required this.pekerjaan}) : super(key: key);

  @override
  State<HasilSrq> createState() => _HasilSrqState();
}

class _HasilSrqState extends State<HasilSrq> {

  String hasil_akhir = "";
  String hasil_psikologis = '';
  String hasil_narkoba = '';
  String hasil_psikotik = '';
  String hasil_ptsd = '';
  String keterangan_psikologis = '';
  String keterangan_narkoba = '';
  String keterangan_psikotik = '';
  String keterangan_ptsd = '';

  int skor_akhir = 0;

  initState() {
    super.initState();

    skor_akhir = widget.total_psikologis + widget.total_narkoba + widget.total_psikotik + widget.total_ptsd;

    if(skor_akhir <= 8){
      hasil_akhir = 'Normal';
    } else {
      hasil_akhir = 'Abnormal';
    }

    if(widget.total_psikologis >= 5){
      hasil_psikologis == 'ya';
      keterangan_psikologis = 'Terdapat masalah psikologis seperti cemas dan depresi';
    } else {
      hasil_psikologis = 'tidak';
      keterangan_psikologis = 'Tidak terdapat masalah';
    }

    if(widget.total_narkoba != 0){
      hasil_narkoba = 'ya';
      keterangan_narkoba = 'Terdapat penggunaan zat psikoaktif/narkoba';
    } else {
      hasil_narkoba = 'tidak';
      keterangan_narkoba = 'Tidak terdapat masalah';
    }

    if(widget.total_psikotik != 0){
      hasil_psikotik = 'ya';
      keterangan_psikotik = 'Terdapat gejala gangguan psikotik (gangguan dalam penilaian realitas) yang perlu penanganan serius';
    } else {
      hasil_psikotik = 'tidak';
      keterangan_psikotik = 'Tidak terdapat masalah';
    }

    if(widget.total_ptsd != 0){
      hasil_ptsd = 'ya';
      keterangan_ptsd = 'Terdapat gejala-gejala gangguan  PTSD (Post Traumatic Stress Disorder) / gangguan stres setelah trauma';
    } else {
      hasil_ptsd = 'tidak';
      keterangan_ptsd = 'Tidak terdapat masalah';
    }

    // try {
    //   API.tambahHasilSRQ(widget.nama, widget.umur, widget.no_hp, widget.alamat, widget.pekerjaan, hasil_akhir)
    //       .then((value) async {
    //     AwesomeDialog(
    //       context: context,
    //       dialogType: DialogType.success,
    //       animType: AnimType.scale,
    //       headerAnimationLoop: true,
    //       title: value,
    //       btnOkOnPress: () {},
    //       btnOkIcon: Icons.cancel,
    //       btnOkColor: Colors.red,
    //     ).show();
    //   });
    // } catch (e) {}
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
                            if (hasil_akhir == 'Normal') ... [
                              _card('Skor', skor_akhir.toString(), hasil_akhir, Colors.green),
                            ] else ... [
                              _card('Skor', skor_akhir.toString(), hasil_akhir, Colors.red),
                            ],
                            SizedBox(
                              height: 20,
                            ),
                            if (hasil_psikologis == 'ya') ... [
                              InkWell(
                                onTap: (){
                                  AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.info,
                                  animType: AnimType.scale,
                                  headerAnimationLoop: true,
                                  title: keterangan_psikologis,
                                  btnOkOnPress: () {},
                                  btnOkIcon: Icons.cancel,
                                  btnOkColor: Colors.blue,
                                  ).show();
                                  },
                                child: _card('Masalah Psikologis', hasil_psikologis, 'tidak_ada', Colors.red),
                              )
                            ] else ... [
                              InkWell(
                                onTap: (){
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.info,
                                    animType: AnimType.scale,
                                    headerAnimationLoop: true,
                                    title: keterangan_psikologis,
                                    btnOkOnPress: () {},
                                    btnOkIcon: Icons.cancel,
                                    btnOkColor: Colors.blue,
                                  ).show();
                                },
                                child: _card('Masalah Psikologis', hasil_psikologis, 'tidak_ada', Colors.green),
                              )
                            ],
                            SizedBox(
                              height: 20,
                            ),
                            if (hasil_narkoba == 'ya') ... [
                              InkWell(
                                onTap: (){
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.info,
                                    animType: AnimType.scale,
                                    headerAnimationLoop: true,
                                    title: keterangan_narkoba,
                                    btnOkOnPress: () {},
                                    btnOkIcon: Icons.cancel,
                                    btnOkColor: Colors.blue,
                                  ).show();
                                },
                                child: _card('Pengguna Narkoba', hasil_narkoba, 'tidak_ada', Colors.red),
                              )
                            ] else ... [
                              InkWell(
                                onTap: (){
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.info,
                                    animType: AnimType.scale,
                                    headerAnimationLoop: true,
                                    title: keterangan_narkoba,
                                    btnOkOnPress: () {},
                                    btnOkIcon: Icons.cancel,
                                    btnOkColor: Colors.blue,
                                  ).show();
                                },
                                child: _card('Pengguna Narkoba', hasil_narkoba, 'tidak_ada', Colors.green),
                              )
                            ],
                            SizedBox(
                              height: 20,
                            ),
                            if (hasil_psikotik == 'ya') ... [
                              InkWell(
                                onTap: (){
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.info,
                                    animType: AnimType.scale,
                                    headerAnimationLoop: true,
                                    title: keterangan_psikotik,
                                    btnOkOnPress: () {},
                                    btnOkIcon: Icons.cancel,
                                    btnOkColor: Colors.blue,
                                  ).show();
                                },
                                child: _card('Gangguan Psikotik', hasil_psikotik, 'tidak_ada', Colors.red),
                              )

                            ] else ... [
                              InkWell(
                                onTap: (){
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.info,
                                    animType: AnimType.scale,
                                    headerAnimationLoop: true,
                                    title: keterangan_psikotik,
                                    btnOkOnPress: () {},
                                    btnOkIcon: Icons.cancel,
                                    btnOkColor: Colors.blue,
                                  ).show();
                                },
                                child: _card('Gangguan Psikotik', hasil_psikotik, 'tidak_ada', Colors.green),
                              )
                            ],
                            SizedBox(
                              height: 20,
                            ),
                            if (hasil_ptsd == 'ya') ... [
                              InkWell(
                                onTap: (){
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.info,
                                    animType: AnimType.scale,
                                    headerAnimationLoop: true,
                                    title: keterangan_ptsd,
                                    btnOkOnPress: () {},
                                    btnOkIcon: Icons.cancel,
                                    btnOkColor: Colors.blue,
                                  ).show();
                                },
                                child: _card('Gangguan PTSD', hasil_ptsd, 'tidak_ada', Colors.red),
                              )

                            ] else ... [
                              InkWell(
                                onTap: (){
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.info,
                                    animType: AnimType.scale,
                                    headerAnimationLoop: true,
                                    title: keterangan_ptsd,
                                    btnOkOnPress: () {},
                                    btnOkIcon: Icons.cancel,
                                    btnOkColor: Colors.blue,
                                  ).show();
                                },
                                child: _card('Gangguan PTSD', hasil_ptsd, 'tidak_ada', Colors.green),
                              )
                            ],
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
                                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Home()));
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
                            SizedBox(height: 20,),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 15.0),
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
                                    title: "Ingin melakukan Perawatan Lanjutan ?",
                                    btnCancelOnPress: () {},
                                    btnOkOnPress: () {},
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
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home()));
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
                border: Border.all(width: 0),
                shape: BoxShape.circle,
                color: color,
              ),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    total.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30
                    ),),
                ],
              ),
            ),
            if (hasil_akhir == 'tidak_ada') ... [

            ] else ... [
              SizedBox(height: 20,),
              Text(hasil_akhir.toString(),
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700,),
              ),
            ],

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
