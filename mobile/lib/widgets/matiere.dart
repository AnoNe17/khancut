
import 'package:flutter/material.dart';


class Matiere extends StatefulWidget {
  Color bigColor;
  Color midColor;
  Color sliderColor;
  String bigText;
  // double perc;
  Matiere(this.bigColor, this.midColor, this.sliderColor, this.bigText,
      {Key? key})
      : super(key: key);

  @override
  State<Matiere> createState() => _MatiereState();
}

class _MatiereState extends State<Matiere> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
        child: Container(
            width: double.infinity,
            height: 90,
            decoration: BoxDecoration(
                color: widget.bigColor,
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(21, 15, 15, 10),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: widget.midColor,
                        radius: 20,
                        child: Icon(
                          Icons.history_edu,
                          color: widget.sliderColor,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 20),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          widget.bigText,
                          style: const TextStyle(
                              fontSize: 20,
                              color: Color(0xff2E5961),
                              fontWeight: FontWeight.w700),
                        ),
                      ]),
                  // const SizedBox(width: 20),
                  // Column(
                  //   children: const [
                  //     SizedBox(height: 13),
                  //     Icon(
                  //       Icons.arrow_forward,
                  //       color: Color(0xff2E5961),
                  //     ),
                  //   ],
                  // )
                ],
              ),
            )),
    );
  }
}
