import 'package:flutter/material.dart';

class RiwayatSDQPage extends StatefulWidget {
  const RiwayatSDQPage({Key? key}) : super(key: key);

  @override
  State<RiwayatSDQPage> createState() => _RiwayatSDQPageState();
}

class _RiwayatSDQPageState extends State<RiwayatSDQPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        toolbarHeight: 80,
        title: Text('Riwayat Kuisioner SDQ'),
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.vertical(
        //     bottom: Radius.circular(25),
        //   ),
        // ),
      ),
      body: Center(
        child: Text('Riwayat SDQ'),
      ),
    );
  }
}
