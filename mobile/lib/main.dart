import 'package:flutter/material.dart';
import 'package:untitled/dashboard.dart';
import 'package:untitled/kuisioner.dart';
import 'package:untitled/kusioner/soal_sdq_11-18.dart';
import 'package:untitled/login.dart';

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
      ),),
      home: const MyHomePage(title: 'Puskesmas Kertasemaya'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

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
            // Container(
            //   margin: ,
            // )
            Image.asset(
              'assets/logo.png',
              width: 500,
              height: 500,
            ),
            // Text(
            //   "Selamat Datang",
            //   style: TextStyle(
            //     fontSize: 50,
            //     // color: Color(0xffffffff),
            //   ),
            // ),
            // SizedBox(height: 50),
            // _title()
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
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Kuisioner()));
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
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login()));
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 22,
                    color: Color(0xffffffff),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}