import 'package:flutter/material.dart';
import 'ui/background/background.dart';
import 'ui/forms/login_form.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        body: Stack(
          children: [
            Background(),
            const LoginForm(),
          ],
        ),
      ),
    );
  }
}
