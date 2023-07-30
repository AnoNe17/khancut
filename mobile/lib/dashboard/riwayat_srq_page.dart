import 'package:flutter/material.dart';

class RiwayatSRQPage extends StatefulWidget {
  const RiwayatSRQPage({Key? key}) : super(key: key);

  @override
  State<RiwayatSRQPage> createState() => _RiwayatSRQPageState();
}

class _RiwayatSRQPageState extends State<RiwayatSRQPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        toolbarHeight: 80,
        title: Text('Riwayat Kuisioner SRQ'),
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
