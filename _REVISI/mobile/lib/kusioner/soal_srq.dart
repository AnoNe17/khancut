import 'package:flutter/material.dart';
import 'package:untitled/model/soalsrq.dart';
import 'package:untitled/ui/hasil_srq.dart';


class SoalSRQ extends StatefulWidget {

  final bool login;

  final String nama, umur, no_hp, alamat, pekerjaan;

  const SoalSRQ({Key? key, required this.login, required this.nama, required this.umur, required this.no_hp, required this.alamat, required this.pekerjaan}) : super(key: key);

  @override
  State<SoalSRQ> createState() => _SoalSRQState();
}

class _SoalSRQState extends State<SoalSRQ> {
  List<SoalSrq> soal = [
    SoalSrq('0', 0, 0),
    SoalSrq('1. Apakah Anda sering sakit kepala?', 1, 0),
    SoalSrq('2. Apakah anda kehilangan nafsu makan?', 1, 0),
    SoalSrq('3. Apakah tidur anda nyenyak?', 1, 0),
    SoalSrq('4. Apakah anda mudah merasa takut?', 1, 0),
    SoalSrq('5. Apakah anda merasa cemas, tegang atau khawatir?', 1, 0),
    SoalSrq('6. Apakah tangan anda gemetar?', 1, 0 ),
    SoalSrq('7. Apakah anda mengalami gangguan pencernaan?', 1, 0 ),
    SoalSrq('8. Apakah anda merasa sulit berpikir jernih?', 1, 0 ),
    SoalSrq('9. Apakah anda merasa tidak Bahagia?', 1, 0 ),
    SoalSrq('10. Apakah anda lebih sering menangis?', 1, 0 ),
    SoalSrq('11. Apakah anda merasa sulit menikmati aktivitas sehari hari?', 1, 0 ),
    SoalSrq('12. Apakah anda mengalami kesulitan untuk mengambil keputusan?', 1, 0 ),
    SoalSrq('13. Apakah aktivitas/ tugas sehari hari anda terbengkalai?', 1, 0 ),
    SoalSrq('14. Anda merasa tidak mampu berperan dalam kehidupan ini?', 1, 0),
    SoalSrq('15. Apakah anda kehilangan minat terhadap banyak hal? ', 1, 0 ),
    SoalSrq('16. Apakah anda merasa tidak berharga?', 1, 0 ),
    SoalSrq('17. Apakah anda mempunyai pemikiran untuk mengakhiri hidup anda?', 1, 0 ),
    SoalSrq('18. Apakah anda merasa Lelah sepanjang masa?', 1, 0 ),
    SoalSrq('19. Apakah anda merasa tidak enak di perut?', 1, 0 ),
    SoalSrq('20. Apakah anda mudah Lelah?', 1, 0 ),
    SoalSrq('21. Apakah Anda minum alkohol lebih banyak dari biasanya atau Apakah Anda menggunakan narkoba?', 1, 0 ),
    SoalSrq('22. Apakah Anda yakin bahwa seseorang mencoba mencelakai Anda dengan cara tertentu?', 1, 0 ),
    SoalSrq('23. Apakah ada yang mengganggu atau hal yang tidak biasa dalam pikiran Anda?', 1, 0 ),
    SoalSrq('24. Apakah Anda pernah mendengar suara tanpa tahu sumbernya atau yang orang lain tidak dapat mendengar?', 1, 0 ),
    SoalSrq('25. Apakah Anda mengalami mimpi yang mengganggu tentang suatu bencana/musibah atau adakah saat-saat Anda seolah mengalami kembali kejadian bencana itu?', 1, 0 ),
    SoalSrq('26. Apakah Anda menghindari kegiatan, tempat, orang atau pikiran yang mengingatkan Anda akan bencana tersebut?', 1, 0 ),
    SoalSrq('27. Apakah minat Anda terhadap teman dan kegiatan yang biasa Anda lakukan berkurang?', 1, 0 ),
    SoalSrq('28. Apakah Anda merasa sangat terganggu jika berada dalam situasi yang mengingatkan Anda akan bencana atau jika Anda berpikir tentang bencana itu?', 1, 0 ),
    SoalSrq('29. Apakah Anda kesulitan memahami atau mengekspresikan perasaan Anda?', 1, 0 ),
  ];

  int index = 1;
  int total_psikologis = 0;
  int total_narkoba = 0;
  int total_psikotik = 0;
  int total_ptsd = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 70,
          title: Text('Soal SRQ' ),
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
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(soal[index].soal,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 30),
                ),
              ),
              SizedBox(height: 50),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15.0),
                width: double.infinity,
                height: 45,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xffF18265),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      if(index <= 20){
                        total_psikologis = total_psikologis + soal[index].nilai_1;
                        index++;
                      } else if (index == 21){
                        total_narkoba = total_narkoba + soal[index].nilai_1;
                        index++;
                      } else if (index >= 22 && index <= 24){
                        total_psikotik = total_psikotik + soal[index].nilai_1;
                        index++;
                      } else if (index >= 25 && index <= 28){
                        total_ptsd = total_ptsd + soal[index].nilai_1;
                        index++;
                      } else {
                        total_ptsd = total_ptsd + soal[index].nilai_1;
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HasilSrq(total_psikologis: total_psikologis, total_narkoba: total_narkoba, total_psikotik: total_psikotik, total_ptsd: total_ptsd, login: widget.login, nama: widget.nama, umur: widget.umur, no_hp: widget.no_hp, alamat: widget.alamat, pekerjaan: widget.pekerjaan)));
                      }
                    });
                  },
                  child: Text(
                    "Ya",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15.0),
                width: double.infinity,
                height: 45,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xffF18265),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      if(index <= 20){
                        total_psikologis = total_psikologis + soal[index].nilai_2;
                        index++;
                      } else if (index == 21){
                        total_narkoba = total_narkoba + soal[index].nilai_2;
                        index++;
                      } else if (index >= 22 && index <= 24){
                        total_psikotik = total_psikotik + soal[index].nilai_2;
                        index++;
                      } else if (index >= 25 && index <= 28){
                        total_ptsd = total_ptsd + soal[index].nilai_2;
                        index++;
                      } else {
                        total_ptsd = total_ptsd + soal[index].nilai_2;
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HasilSrq(total_psikologis: total_psikologis, total_narkoba: total_narkoba, total_psikotik: total_psikotik, total_ptsd: total_ptsd, login: widget.login, nama: widget.nama, umur: widget.umur, no_hp: widget.no_hp, alamat: widget.alamat, pekerjaan: widget.pekerjaan)));
                      }
                    });
                  },
                  child: Text(
                    "Tidak",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
