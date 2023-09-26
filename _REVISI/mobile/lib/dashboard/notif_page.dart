import 'package:flutter/material.dart';
import 'package:untitled/api/api.dart';
import 'package:untitled/api/model/notifikasi.dart';

class NotifPage extends StatefulWidget {
  const NotifPage({Key? key}) : super(key: key);

  @override
  State<NotifPage> createState() => _NotifPageState();
}

class _NotifPageState extends State<NotifPage> {
  List<Notifikasi> notifikasi = [];
  API api = API();

  getNotifikasi() async {
    notifikasi = await api.notifikasi();
    setState(() {});
  }

  @override
  void initState() {
    // http.getSemester_1();
    getNotifikasi();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (notifikasi.isEmpty) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepOrangeAccent,
            toolbarHeight: 80,
            title: Text('Notifikasi'),
          ),
          body: RefreshIndicator(
            onRefresh: () => getNotifikasi(),
            child: Stack(
              children: [
                Center(
                  child: Text(
                    "Belum ada Notifikasi",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                ListView()
              ],
            )
          ),);
    } else {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepOrangeAccent,
            toolbarHeight: 80,
            title: Text('Notifikasi'),
          ),
          body: RefreshIndicator(
            onRefresh: () => getNotifikasi(),
            child: Container(
              margin: EdgeInsets.only(bottom: 50),
              child: ListView.builder(
                itemCount: notifikasi.length,
                itemBuilder: (context, index) {
                  return SingleChildScrollView(
                      child: ExpansionTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Hai ! Apa Kabar ?",
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          "Silahkan Cek Notifikasi ini !",
                          style: TextStyle(fontSize: 20, color: Colors.orange),
                        ),
                      ],
                    ),
                    children: [
                      Column(
                        children: [
                          _card(
                            "${notifikasi[index].tanggal}",
                            "${notifikasi[index].isi}",
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ],
                  ));
                },
              ),
            ),
          ));
    }
  }

  Widget _card(
    String tanggal,
    String isi,
  ) {
    return GestureDetector(
      // onTap: () => Navigator.of(context).push(MaterialPageRoute(
      //   builder: (context) => PenilaianPage(
      //     tema: tema,
      //     sub_tema: sub_tema,
      //     minggu_ke: minggu_ke,
      //     semester: semester,
      //   ),
      // )),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(width: 15.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // _cardSkor("Skor Keseluruhan : ", "Normal", skor_keseluruhan),
                  _cardHasil("Untuk Tanggal :\t", tanggal),
                  _cardHasil("Isi :\t", isi),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _cardHasil(String judul, String isi) {
    return Padding(
        padding: EdgeInsets.all(3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              judul,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18.0,
              ),
            ),
            Text(
              isi,
              style: TextStyle(
                // color: Colors.green,
                fontWeight: FontWeight.w500,
                fontSize: 20.0,
              ),
            ),
          ],
        ));
  }
}
