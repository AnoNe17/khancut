import 'package:flutter/material.dart';
import 'package:untitled/api/api.dart';
import 'package:untitled/dashboard/home.dart';
import 'package:http/http.dart' as http;
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:untitled/main.dart';
import 'package:untitled/widgets/menu.dart';
// import 'package:ndialog/ndialog.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String _email = '';
  String _password = '';
  bool _obscureText = true;
  final formKey = GlobalKey<FormState>();
  TextEditingController txEmail = new TextEditingController();
  TextEditingController txPass = new TextEditingController();

  ceklogin() async {
    // ProgressDialog progressDialog = ProgressDialog(
    //   context,
    //   blur: 10,
    //   message: Text("Please Wait ..."),
    // );
    // progressDialog.show();
      try {
        http.Response response = await API.login(_email, _password, context);
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
      } catch (e) {
        // API.gagal(context, progressDialog);
      }
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
                                  margin: const EdgeInsets.only(left: 6, right: 50 ),
                                  alignment: Alignment.center,
                                  child: TextFormField(
                                    controller: txEmail,
                                    style: TextStyle(fontSize: 18),
                                    showCursor: true,
                                    autofocus: true,
                                    decoration: InputDecoration(
                                      icon: Icon(Icons.person),
                                      labelText: 'Email',
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
                                  margin: const EdgeInsets.only(left: 6, right: 50),
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
                                          _obscureText ? Icons.visibility_off : Icons.visibility,
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
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => Menu()),
                                (route) => false);
                        // ceklogin();
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
                Container(
                  margin: const EdgeInsets.only(left: 16, top: 24),
                  child: const Text(
                    "",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffe98f60),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        onWillPop: () async {
          Navigator.of(context, rootNavigator: true).pushReplacement(MaterialPageRoute(builder: (context) => new MyApp()));
          return true;
        });
  }
}
