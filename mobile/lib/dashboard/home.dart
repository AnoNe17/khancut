import 'package:flutter/material.dart';
import 'package:untitled/api/api.dart';
import 'package:untitled/api/model/dashboard.dart';
import 'package:untitled/main.dart';
import 'package:untitled/widgets/matiere.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Dashboard dashboard = Dashboard();

  @override
  void initState() {
    API.dashboard().then((value) {
      setState(() {
        dashboard = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xffF9FAFB),
            Color(0xffFEFEFF),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Text("SELAMAT DATANG DI",
                          style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w800,
                              color: Colors.white)),
                      SizedBox(
                        height: 10,
                      ),
                      Text("E-MPUS",
                          style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w800,
                              color: Colors.white)),
                    ],
                  ),
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color(0xfff8a55f),
                          Color(0xfff1665f),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(35)),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [
                      ChallangeCard(
                          dashboard.banyak_sdq.toString(),
                          "Riwayat SDQ",
                          "",
                          "",
                          "",
                          Color(0xfff1665f),
                          Colors.deepOrangeAccent),
                      Spacer(),
                      ChallangeCard(
                          dashboard.banyak_srq.toString(),
                          "Riwayat SRQ",
                          "",
                          "",
                          "",
                          const Color(0xffF7A94B),
                          const Color(0xffFFF7E7)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 18.0, top: 20, bottom: 20),
                      child: Text("SOAL",
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Color(0xff9FB2BA),
                            fontSize: 17,
                          )),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () async {
                    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => SoalSDQ(login: true,)));
                  },
                  child: Matiere(
                    const Color(0xffF5D9CC),
                    const Color(0xffF1E6DF),
                    const Color(0xfff1665f),
                    "SDQ",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () async {
                    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => SoalSRQ(login: true)));
                  },
                  child: Matiere(
                    const Color(0xffF5D9CC),
                    const Color(0xffF1E6DF),
                    const Color(0xfff1665f),
                    "SRQ",
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChallangeCard extends StatelessWidget {
  String Bigtxt;
  String Midtxt;
  String Littxt;
  String PathImage;
  String UpTxt;
  Color UpTxt1;
  Color UpTxt2;
  ChallangeCard(this.Bigtxt, this.Midtxt, this.Littxt, this.PathImage,
      this.UpTxt, this.UpTxt1, this.UpTxt2,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: 165,
          height: 145,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: const Color.fromARGB(255, 175, 186, 195)
                      .withOpacity(0.15),
                  offset: const Offset(0, 15),
                  blurRadius: 3,
                  spreadRadius: -5)
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(height: 30),
              Align(
                  alignment: Alignment.center,
                  child: Text(Bigtxt,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF893101),
                      ))),
              const SizedBox(height: 10),
              Align(
                  alignment: Alignment.center,
                  child: Text(Midtxt,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Color(0xfff1665f),
                        fontWeight: FontWeight.w600,
                      ))),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(Littxt,
                      style: const TextStyle(
                          color: Color(0xFF893101),
                          fontWeight: FontWeight.w600))),
            ]),
          )),
    );
  }
}
