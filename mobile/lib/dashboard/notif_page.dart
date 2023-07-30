import 'package:flutter/material.dart';

class NotifPage extends StatefulWidget {
  const NotifPage({Key? key}) : super(key: key);

  @override
  State<NotifPage> createState() => _NotifPageState();
}

class _NotifPageState extends State<NotifPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        toolbarHeight: 80,
        title: Text('Notifikasi'),
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
