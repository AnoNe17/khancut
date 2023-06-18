import 'package:flutter/material.dart';
import 'package:untitled/inputan/inputan_sdq.dart';
import 'package:untitled/kusioner/soal_sdq_11-18.dart';
import 'package:untitled/kusioner/soal_sdq_4-11.dart';
import 'package:untitled/kusioner/soal_srq.dart';
import 'package:untitled/main.dart';

class TipeSDQ extends StatefulWidget {

  final bool login;
  final String nama, umur, instansi;

  const TipeSDQ({Key? key, required this.login, required this.nama, required this.umur, required this.instansi}) : super(key: key);

  @override
  State<TipeSDQ> createState() => _TipeSDQState();
}

class _TipeSDQState extends State<TipeSDQ> {


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => InputanSDQ(login: false)));
                },
              ),
              toolbarHeight: 70,
              title: Text('Kuisioner SDQ'),
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
                  Text("Pilihan Kuisioner SDQ",
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
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SoalSDQ4_11(login: widget.login, nama: widget.nama, umur: widget.umur, instansi: widget.instansi)));
                      },
                      child: Text(
                        "SDQ (Umur 4 - 11 Tahun)",
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
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SoalSDQ11_18(login: widget.login, nama: widget.nama, umur: widget.umur, instansi: widget.instansi)));
                      },
                      child: Text(
                        "SDQ (Umur 11 - 18 Tahun)",
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
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => InputanSDQ(login: false)));
          return true;
        });
  }
}