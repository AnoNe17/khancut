import 'package:flutter/material.dart';
import 'package:untitled/inputan/tipe_sdq.dart';
import 'package:untitled/kuisioner.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:untitled/kusioner/soal_sdq_11-18.dart';
import 'package:untitled/kusioner/soal_srq.dart';
import 'package:untitled/main.dart';

class InputanSRQ extends StatefulWidget {

  final bool login;

  const InputanSRQ({Key? key, required this.login}) : super(key: key);

  @override
  State<InputanSRQ> createState() => _InputanSRQState();
}

class _InputanSRQState extends State<InputanSRQ> {

  String _nama = '';
  String _umur = '';
  String _no_hp = '';
  String _alamat = '';
  String _pekerjaan = '';
  var txNama = TextEditingController();
  var txUmur = TextEditingController();
  var txNoHp = TextEditingController();
  var txAlamat = TextEditingController();
  var txPekerjaan = TextEditingController();
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
              child: SingleChildScrollView(
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
                              return "Nama tidak boleh Kosong";
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
                              return "Umur tidak boleh Kosong";
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
                          keyboardType: TextInputType.number,
                          controller: txNoHp,
                          decoration: InputDecoration(
                            labelText: "No HP",
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
                              return "No HP tidak boleh Kosong";
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {
                            _no_hp = value;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: TextFormField(
                          controller: txAlamat,
                          decoration: InputDecoration(
                            labelText: "Alamat",
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
                              return "Alamat tidak boleh Kosong";
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {
                            _alamat = value;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: TextFormField(
                          controller: txPekerjaan,
                          decoration: InputDecoration(
                            labelText: "Pekerjaan",
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
                              return "Pekerjaan tidak boleh Kosong";
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {
                            _pekerjaan = value;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 40,
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
    } else if(_no_hp == ''){
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.scale,
        headerAnimationLoop: true,
        title: 'No HP Tidak Boleh Kosong !',
        btnOkOnPress: () {},
        onDismissCallback: (type) {
          // progressDialog.dismiss();
        },
        btnOkIcon: Icons.cancel,
        btnOkColor: Colors.red,
      ).show();
    } else if(_alamat == ''){
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.scale,
        headerAnimationLoop: true,
        title: 'Alamat Tidak Boleh Kosong !',
        btnOkOnPress: () {},
        onDismissCallback: (type) {
          // progressDialog.dismiss();
        },
        btnOkIcon: Icons.cancel,
        btnOkColor: Colors.red,
      ).show();
    } else if(_pekerjaan == ''){
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.scale,
        headerAnimationLoop: true,
        title: 'Pekerjaan Tidak Boleh Kosong !',
        btnOkOnPress: () {},
        onDismissCallback: (type) {
          // progressDialog.dismiss();
        },
        btnOkIcon: Icons.cancel,
        btnOkColor: Colors.red,
      ).show();
    } else {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => SoalSRQ(login: widget.login, nama: _nama, umur: _umur, no_hp: _no_hp, alamat: _alamat, pekerjaan: _pekerjaan)));
    }
  }
}