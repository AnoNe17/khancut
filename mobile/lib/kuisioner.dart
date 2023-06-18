import 'package:flutter/material.dart';
import 'package:untitled/inputan/inputan_sdq.dart';
import 'package:untitled/inputan/inputan_srq.dart';
import 'package:untitled/kusioner/soal_sdq_11-18.dart';
import 'package:untitled/kusioner/soal_srq.dart';
import 'package:untitled/main.dart';

class Kuisioner extends StatefulWidget {

  const Kuisioner({Key? key}) : super(key: key);

  @override
  State<Kuisioner> createState() => _KuisionerState();
}

class _KuisionerState extends State<Kuisioner> {


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MyApp()));
                },
              ),
              toolbarHeight: 70,
              title: Text('Kuisioner'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(25),
                ),
              ),
            ),
          body: Container(
              margin: const EdgeInsets.only(top: 20.0),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Text("Pilihan Kuisioner",
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(height: 30),
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
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => InputanSDQ(login: false,)));
                      },
                      child: Text(
                        "SDQ",
                        style: TextStyle(
                          fontSize: 24,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
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
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => InputanSRQ(login: false,)));
                      },
                      child: Text(
                        "SRQ",
                        style: TextStyle(
                          fontSize: 24,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
        ),
        onWillPop: () async {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyApp()));
          return true;
        });
  }
}