import 'package:flutter/material.dart';
import 'package:untitled/inputan/tipe_sdq.dart';
import 'package:untitled/kuisioner.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:untitled/kusioner/soal_sdq_11-18.dart';
import 'package:untitled/kusioner/soal_srq.dart';
import 'package:untitled/main.dart';

class InputanSDQ extends StatefulWidget {

  final bool login;

  const InputanSDQ({Key? key, required this.login}) : super(key: key);

  @override
  State<InputanSDQ> createState() => _InputanSDQState();
}

class _InputanSDQState extends State<InputanSDQ> {

  String _nama = '';
  String _umur = '';
  String _instansi = '';
  var txNama = TextEditingController();
  var txUmur = TextEditingController();
  var txInstansi = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Kuisioner()));
                },
              ),
              toolbarHeight: 70,
              title: Text('Input Data Diri'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(25),
                ),
              ),
            ),
            body: Form(
              key: formKey,
              child: Container(
                margin: const EdgeInsets.only(top: 20.0),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Text("Input Data Diri",
                      style: TextStyle(fontSize: 30),
                    ),
                    SizedBox(height: 30),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
                        controller: txNama,
                        decoration: InputDecoration(
                          labelText: "Nama",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(21),
                            borderSide: BorderSide(
                                color: Colors.orange
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(21),
                              borderSide: BorderSide(
                                  color: Colors.orange
                              )
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Email tidak boleh Kosong";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          _nama = value;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: txUmur,
                        decoration: InputDecoration(
                          labelText: "Umur",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(21),
                            borderSide: BorderSide(
                                color: Colors.orange
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(21),
                              borderSide: BorderSide(
                                  color: Colors.orange
                              )
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Email tidak boleh Kosong";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          _umur = value;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
                        controller: txInstansi,
                        decoration: InputDecoration(
                          labelText: "Instansi",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(21),
                            borderSide: BorderSide(
                                color: Colors.orange
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(21),
                              borderSide: BorderSide(
                                  color: Colors.orange
                              )
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Email tidak boleh Kosong";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          _instansi = value;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15.0),
                      width: double.infinity,
                      height: 60,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Color(0xffF18265),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {
                          cek_inputan();
                          // Navigator.of(context).push(MaterialPageRoute(builder: (context) => TipeSDQ(login: false, nama: txNama.text.toString(), umur: txUmur.text.toString(), instansi: txInstansi.text.toString(),)));
                        },
                        child: Text(
                          "Lanjutkan",
                          style: TextStyle(
                            fontSize: 24,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
        ),
        onWillPop: () async {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Kuisioner()));
          return true;
        });
  }

  cek_inputan(){
    if(_nama == ''){
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.scale,
        headerAnimationLoop: true,
        title: 'Nama Tidak Boleh Kosong !',
        btnOkOnPress: () {},
        onDismissCallback: (type) {
          // progressDialog.dismiss();
        },
        btnOkIcon: Icons.cancel,
        btnOkColor: Colors.red,
      ).show();
    } else if(_umur == ''){
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.scale,
        headerAnimationLoop: true,
        title: 'Umur Tidak Boleh Kosong !',
        btnOkOnPress: () {},
        onDismissCallback: (type) {
          // progressDialog.dismiss();
        },
        btnOkIcon: Icons.cancel,
        btnOkColor: Colors.red,
      ).show();
    } else if(_instansi == ''){
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.scale,
        headerAnimationLoop: true,
        title: 'Instansi Tidak Boleh Kosong !',
        btnOkOnPress: () {},
        onDismissCallback: (type) {
          // progressDialog.dismiss();
        },
        btnOkIcon: Icons.cancel,
        btnOkColor: Colors.red,
      ).show();
    } else {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => TipeSDQ(login: false, nama: _nama, umur: _umur, instansi: _instansi,)));
    }
  }
}