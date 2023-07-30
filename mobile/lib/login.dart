import 'package:flutter/material.dart';
import 'package:untitled/main.dart';
import 'package:untitled/ui/background/background.dart';
import 'package:untitled/ui/forms/login_form.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
          child: Scaffold(
            body: Stack(
              children: [
                Background(),
                const LoginForm(),
              ],
            ),
          ),
          onWillPop: () async {
            Navigator.of(context, rootNavigator: true).pushReplacement(MaterialPageRoute(builder: (context) => new MyApp()));
            return true;
          });
  }
}
