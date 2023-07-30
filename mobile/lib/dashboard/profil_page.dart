import 'package:flutter/material.dart';
import 'package:untitled/main.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 40),
              CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('assets/person.png'),
                backgroundColor: Colors.white10,
              ),
              const SizedBox(height: 10),
              Text("Profil Pasien",
                  style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Color(0xfff8a55f))),
              const SizedBox(height: 30),
              itemProfile('Kode Verifikasi', 'empus202328', Icons.lock),
              const SizedBox(height: 10),
              itemProfile('Nama', 'Syafira Nour Dillah', Icons.person),
              const SizedBox(height: 10),
              itemProfile('Umur', '22', Icons.date_range),
              const SizedBox(height: 10),
              itemProfile('Instansi', 'polindra', Icons.business_sharp),
              const SizedBox(height: 10),
              itemProfile('No HP', '08191462076', Icons.phone),
              const SizedBox(height: 10),
              itemProfile('Alamat', 'indramayu', Icons.location_on_sharp),
              const SizedBox(height: 10),
              itemProfile('Pekerjaan', 'mahasiswa', Icons.work_history),
              const SizedBox(height: 20,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pushReplacement(MaterialPageRoute(builder: (context) => new MyHomePage()));
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(15),
                        primary: Color(0xfff8a55f)
                    ),
                    child: const Text('Logout')
                ),
              ),
              const SizedBox(height: 80,),
            ],
          ),
        ),
      )
    );
  }

  itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 5),
                color: Colors.deepOrange.withOpacity(.2),
                spreadRadius: 2,
                blurRadius: 10
            )
          ]
      ),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        // trailing: Icon(Icons.arrow_forward, color: Colors.grey.shade400),
        tileColor: Colors.white,
      ),
    );
  }
}
