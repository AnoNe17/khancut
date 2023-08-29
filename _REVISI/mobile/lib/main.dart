import 'dart:async';

import 'package:flutter/material.dart';
import 'kuisioner.dart';
import 'login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        scaffoldBackgroundColor: const Color(0xFFf0fcf2),
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
          color: const Color(0xff43978D),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int progress = 0;

  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 3), () {
      if (this.mounted) {
        setState(() {
          progress = 1;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color(0xfffff9f2),
                  const Color(0xfffff9f2),
                ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/logo.png',
              width: 500,
              height: 500,
            ),
            if (progress == 0) ...[
              CircularProgressIndicator(
                color: Colors.deepOrangeAccent,
              ),
            ] else ...[
              Container(
                width: 300,
                height: 60,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xff43978D),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => new Kuisioner()));
                  },
                  child: Text(
                    "Isi Kuisioner",
                    style: TextStyle(
                      fontSize: 22,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 300,
                height: 60,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.deepOrangeAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pushReplacement(
                        MaterialPageRoute(builder: (context) => new Login()));
                    // setState(() {
                    //   progress = 1 ;
                    // });
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 22,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
