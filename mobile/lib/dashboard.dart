import 'package:flutter/material.dart';
import 'package:untitled/kusioner/soal_sdq_11-18.dart';
import 'package:untitled/kusioner/soal_srq.dart';
import 'package:untitled/main.dart';
import 'package:untitled/widgets/matiere.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
                  height: 280,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox( height: 54),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            children: [
                              MaterialButton(
                                shape: const CircleBorder(),
                                color: const Color.fromARGB(255, 255, 255, 255),
                                padding: const EdgeInsets.all(7),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyApp()));
                                },
                                child: const Icon(
                                  Icons.logout,
                                  size: 23,
                                  color: Color(0xFF009419),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 53.4,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(
                            "assets/mypic.jpg",
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text("Nama User",
                          style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w800,
                              color: Colors.white)),
                      const SizedBox(
                        height: 13,
                      ),
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
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      ChallangeCard(
                          "Abnormal",
                          "Hasil Kuisioner",
                          "",
                          "asd",
                          "asd",
                          Color(0xfff1665f),
                          Colors.deepOrangeAccent),
                      const SizedBox(width: 13),
                      ChallangeCard(
                          "5",
                          "Banyak Riwayat",
                          "",
                          "asd",
                          "asd",
                          const Color(0xffF7A94B),
                          const Color(0xffFFF7E7)),
                    ],
                  ),
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
                    "SDQ",),
                ),
                SizedBox(height: 10,),
                InkWell(
                  onTap: () async {
                    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => SoalSRQ(login: true)));
                  },
                  child: Matiere(
                    const Color(0xffF5D9CC),
                    const Color(0xffF1E6DF),
                    const Color(0xfff1665f),
                    "SRQ",),
                ),
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 18.0, top: 20, bottom: 20),
                      child: Text("RIWAYAT RUJUKAN",
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Color(0xff9FB2BA),
                            fontSize: 17,
                          )),
                    ),
                  ],
                ),
                Matiere(
                    const Color(0xffF5D9CC),
                    const Color(0xffF1E6DF),
                    const Color(0xfff1665f),
                    "Rujukan Pertama"),
                SizedBox(height: 10,),
                Matiere(
                    const Color(0xffF5D9CC),
                    const Color(0xffF1E6DF),
                    const Color(0xfff1665f),
                    "Rujukan Kedua"),

                const SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ),
        // bottomNavigationBar: CustomNavigationBar(
        //   elevation: 0,
        //   iconSize: 35.0,
        //   selectedColor: const Color(0xff4696FF),
        //   strokeColor: Colors.white,
        //   unSelectedColor: const Color(0xff0A3847),
        //   backgroundColor: const Color(0xffF4F4FF),
        //   borderRadius: const Radius.circular(20.0),
        //   blurEffect: true,
        //   opacity: 0.8,
        //   items: [
        //     CustomNavigationBarItem(
        //       title: Text(
        //         "mes enfants",
        //         style: TextStyle(
        //             color: isPressed
        //                 ? const Color(0xff4696FF)
        //                 : const Color(0xff0A3847),
        //             fontWeight: FontWeight.w900,
        //             fontSize: 15),
        //       ),
        //       icon: const Icon(
        //         Icons.stacked_line_chart_rounded,
        //       ),
        //     ),
        //     CustomNavigationBarItem(
        //       icon: const Icon(Icons.stacked_bar_chart_outlined),
        //     ),
        //     CustomNavigationBarItem(
        //       icon: IconButton(
        //         icon: const Icon(AntDesign.user),
        //         onPressed: () async {
        //           await Navigator.of(context).push(
        //               MaterialPageRoute(builder: (context) => const Profile()));
        //         },
        //       ),
        //     ),
        //   ],
        //   currentIndex: _currentIndex,
        //   onTap: (index) {
        //     setState(() {
        //       _currentIndex = index;
        //       if (index == 0) {
        //         isPressed = true;
        //       } else {
        //         isPressed = false;
        //       }
        //     });
        //   },
        //   isFloating: true,
        // ),
        // extendBody: true,
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
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF893101),
                      ))),
              const SizedBox(height: 10),
              Align(
                  alignment: Alignment.center,
                  child: Text(Midtxt,
                      style: const TextStyle(
                        fontSize: 16,
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
