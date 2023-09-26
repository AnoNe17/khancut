import 'package:flutter/material.dart';
import 'package:untitled/api/api.dart';
import 'package:untitled/dashboard/home.dart';
import 'package:http/http.dart' as http;
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:untitled/main.dart';
import 'package:untitled/widgets/menu.dart';
import 'dart:math';
// import 'package:ndialog/ndialog.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String _email = '';
  String _password = '';
  String lupa_email = '';
  String lupa_no_hp = '';
  bool _obscureText = true;
  final formKey = GlobalKey<FormState>();
  TextEditingController txEmail = new TextEditingController();
  TextEditingController txPass = new TextEditingController();

  TextEditingController txLupaEmail = new TextEditingController();
  TextEditingController txLupaNoHp = new TextEditingController();

  int _valCapsa = 0;
  var txCapsa = TextEditingController();

  ceklogin() async {
    var rnd = Random();
    var next = rnd.nextDouble() * 1000000;
    while (next < 100000) {
      next *= 10;
    }
    int capsa = next.toInt();

    AwesomeDialog(
      context: context,
      animType: AnimType.scale,
      dialogType: DialogType.info,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            capsa.toString(),
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(height: 30),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: TextFormField(
              keyboardType: TextInputType.number,
              controller: txCapsa,
              decoration: InputDecoration(
                labelText: "Captcha",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(21),
                  borderSide: BorderSide(color: Colors.orange),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(21),
                    borderSide: BorderSide(color: Colors.orange)),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "";
                } else {
                  return null;
                }
              },
              onChanged: (value) {
                _valCapsa = int.parse(value);
              },
            ),
          ),
        ],
      ),
      onDismissCallback: (type) {},
      btnOkOnPress: () async {
        if (_valCapsa == capsa) {
          http.Response response = await API.login(_email, _password);
          if (response.statusCode == 200) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => Menu()),
                    (route) => false);
          } else {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              animType: AnimType.scale,
              headerAnimationLoop: true,
              title: 'Username atau Password Salah !',
              btnOkOnPress: () {},
              onDismissCallback: (type) {
                // progressDialog.dismiss();
              },
              btnOkIcon: Icons.cancel,
              btnOkColor: Colors.red,
            ).show();
            txEmail.text = "";
            txPass.text = "";
          }
        } else {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.scale,
            headerAnimationLoop: true,
            title: 'Captcha yang anda masukan salah',
            btnOkOnPress: () {},
            onDismissCallback: (type) {
              // progressDialog.dismiss();
            },
            btnOkIcon: Icons.cancel,
            btnOkColor: Colors.red,
          ).show();
          txEmail.text = "";
          txPass.text = "";
        }
      },
      btnOkIcon: Icons.check,
      btnOkColor: Colors.blue,
    ).show();

    // } catch (e) {
    // API.gagal(context, progressDialog);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 60),
              child: const Text(
                "Login",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 150,
              child: Stack(
                children: [
                  Container(
                    height: 150,
                    margin: const EdgeInsets.only(
                      right: 70,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(100),
                        bottomRight: Radius.circular(100),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 0,
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: Form(
                            key: formKey,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  margin:
                                  const EdgeInsets.only(left: 6, right: 50),
                                  alignment: Alignment.center,
                                  child: TextFormField(
                                    controller: txEmail,
                                    style: TextStyle(fontSize: 18),
                                    showCursor: true,
                                    autofocus: true,
                                    decoration: InputDecoration(
                                      icon: Icon(Icons.person),
                                      labelText: 'Username',
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Email tidak boleh Kosong";
                                      } else {
                                        return null;
                                      }
                                    },
                                    onChanged: (value) {
                                      _email = value;
                                    },
                                  ),
                                ),
                                Container(
                                  margin:
                                  const EdgeInsets.only(left: 6, right: 50),
                                  alignment: Alignment.center,
                                  child: TextFormField(
                                    controller: txPass,
                                    obscureText: _obscureText,
                                    decoration: InputDecoration(
                                      icon: Icon(Icons.lock),
                                      labelText: 'Password',
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _obscureText = !_obscureText;
                                          });
                                        },
                                        icon: Icon(
                                          _obscureText
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                        ),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Password tidak boleh Kosong";
                                      } else {
                                        return null;
                                      }
                                    },
                                    onChanged: (value) {
                                      _password = value;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        ceklogin();
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 15),
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.orange[200]!.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                          shape: BoxShape.circle,
                          gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color(0xfff8a55f),
                              Color(0xfff1665f),
                            ],
                          ),
                        ),
                        child: const Icon(
                          Icons.arrow_forward_outlined,
                          color: Colors.white,
                          size: 32,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 16, top: 16),
                  child: Text(
                    "",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[400],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    AwesomeDialog(
                      context: context,
                      animType: AnimType.scale,
                      dialogType: DialogType.info,
                      body: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Lupa Password",
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(height: 30),
                          Container(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: txLupaNoHp,
                              decoration: InputDecoration(
                                labelText: "Nomor HP",
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(21),
                                  borderSide: BorderSide(color: Colors.orange),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(21),
                                    borderSide:
                                    BorderSide(color: Colors.orange)),
                              ),
                              onChanged: (value) {
                                lupa_no_hp = value;
                              },
                            ),
                          ),
                          SizedBox(height: 30),
                          Container(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: TextFormField(
                              controller: txLupaEmail,
                              decoration: InputDecoration(
                                labelText: "Email",
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(21),
                                  borderSide: BorderSide(color: Colors.orange),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(21),
                                    borderSide:
                                    BorderSide(color: Colors.orange)),
                              ),
                              onChanged: (value) {
                                lupa_email = value;
                              },
                            ),
                          ),
                        ],
                      ),
                      onDismissCallback: (type) {},
                      btnOkOnPress: () async {
                        try {
                          API
                              .lupaPass(lupa_email, lupa_no_hp)
                              .then((value) async {
                            // await

                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.success,
                              animType: AnimType.scale,
                              headerAnimationLoop: true,
                              title:
                              "Email telah dikirim, Mohon cek email anda",
                              btnOkOnPress: () {},
                              btnOkIcon: Icons.cancel,
                              btnOkColor: Colors.green,
                            ).show();
                          });
                        } catch (e) {}
                      },
                      btnOkIcon: Icons.check,
                      btnOkColor: Colors.blue,
                    ).show();
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 16, top: 24),
                    child: const Text(
                      "Lupa Password ?",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffe98f60),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
        onWillPop: () async {
          Navigator.of(context, rootNavigator: true).pushReplacement(
              MaterialPageRoute(builder: (context) => new MyApp()));
          return true;
        });
  }
}