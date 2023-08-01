import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/api/model/dashboard.dart';
import 'package:untitled/api/model/notifikasi.dart';
import 'package:untitled/api/model/profil.dart';
import 'package:untitled/api/model/riwayat_sdq.dart';
import 'package:untitled/api/model/riwayat_srq.dart';

const String baseURL = "http://192.168.0.105:8000/api/"; //emulator localhost
const Map<String, String> header = {"Content-Type": "application/json"};

class API {
  static Future<http.Response> login(String email, String password) async {
    Map data = {
      "name": email,
      "password": password,
    };
    var body = json.encode(data);
    var url = Uri.parse(baseURL + 'login');
    http.Response response = await http.post(
      url,
      headers: header,
      body: body,
    );

    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(
        'user_id', json.decode(response.body)["data"]["id"].toString());

    try {
      return response;
    } catch (e) {
      return response;
    }
  }

  static Future<String?> tambahHasilSDQ(
    String? nama,
    String? instansi,
    String? hasil_e,
    String? hasil_c,
    String? hasil_h,
    String? hasil_p,
    String? hasil_pro,
    int? skor_e,
    int? skor_c,
    int? skor_h,
    int? skor_p,
    int? skor_pro,
    String? hasil_kesulitan,
    int? skor_kesulitan,
  ) async {
    Map data = {
      "nama": nama,
      "instansi": instansi,
      "hasil_e": hasil_e,
      "hasil_c": hasil_c,
      "hasil_h": hasil_h,
      "hasil_p": hasil_p,
      "hasil_pro": hasil_pro,
      "skor_e": skor_e,
      "skor_c": skor_c,
      "skor_h": skor_h,
      "skor_p": skor_p,
      "skor_pro": skor_pro,
      "hasil_kesulitan": hasil_kesulitan,
      "skor_kesulitan": skor_kesulitan
    };
    //
    var body = json.encode(data);
    var url = Uri.parse(baseURL + 'input_sdq');
    //
    http.Response response = await http.post(
      url,
      headers: header,
      body: body,
    );

    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('id_sdq', json.decode(response.body)["data"].toString());

    return json.decode(response.body)["data"].toString();
  }

  static Future<String?> tambahHasilSDQPasien(
    String? nama,
    String? instansi,
    String? hasil_e,
    String? hasil_c,
    String? hasil_h,
    String? hasil_p,
    String? hasil_pro,
    int? skor_e,
    int? skor_c,
    int? skor_h,
    int? skor_p,
    int? skor_pro,
    String? hasil_kesulitan,
    int? skor_kesulitan,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Map data = {
      "nama": nama,
      "instansi": instansi,
      "hasil_e": hasil_e,
      "hasil_c": hasil_c,
      "hasil_h": hasil_h,
      "hasil_p": hasil_p,
      "hasil_pro": hasil_pro,
      "skor_e": skor_e,
      "skor_c": skor_c,
      "skor_h": skor_h,
      "skor_p": skor_p,
      "skor_pro": skor_pro,
      "hasil_kesulitan": hasil_kesulitan,
      "skor_kesulitan": skor_kesulitan,
      "user_id": prefs.getString('user_id')
    };
    //
    var body = json.encode(data);
    var url = Uri.parse(baseURL + 'input_sdq_pasien');
    //
    http.Response response = await http.post(
      url,
      headers: header,
      body: body,
    );

    prefs.setString('id_sdq', json.decode(response.body)["data"].toString());

    return json.decode(response.body)["data"].toString();
  }

  static Future<String?> tambahHasilSRQ(
    String? nama,
    String? umur,
    String? no_hp,
    String? alamat,
    String? pekerjaan,
    String? hasil_akhir,
    String? skor_akhir,
    String? hasil_psikologis,
    String? hasil_narkoba,
    String? hasil_psikotik,
    String? hasil_ptsd,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Map data = {
      "nama": nama,
      "umur": umur,
      "no_hp": no_hp,
      "alamat": alamat,
      "pekerjaan": pekerjaan,
      "hasil_akhir": hasil_akhir,
      "skor_akhir": skor_akhir,
      "hasil_psikologis": hasil_psikologis,
      "hasil_narkoba": hasil_narkoba,
      "hasil_psikotik": hasil_psikotik,
      "hasil_ptsd": hasil_ptsd,
    };
    //
    var body = json.encode(data);
    var url = Uri.parse(baseURL + 'input_srq');
    //
    http.Response response = await http.post(
      url,
      headers: header,
      body: body,
    );

    prefs.setString('id_srq', json.decode(response.body)["data"].toString());

    return json.decode(response.body)["data"].toString();
  }

  static Future<String?> tambahHasilSRQPasien(
    String? nama,
    String? umur,
    String? no_hp,
    String? alamat,
    String? pekerjaan,
    String? hasil_akhir,
    String? skor_akhir,
    String? hasil_psikologis,
    String? hasil_narkoba,
    String? hasil_psikotik,
    String? hasil_ptsd,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Map data = {
      "nama": nama,
      "umur": umur,
      "no_hp": no_hp,
      "alamat": alamat,
      "pekerjaan": pekerjaan,
      "hasil_akhir": hasil_akhir,
      "skor_akhir": skor_akhir,
      "hasil_psikologis": hasil_psikologis,
      "hasil_narkoba": hasil_narkoba,
      "hasil_psikotik": hasil_psikotik,
      "hasil_ptsd": hasil_ptsd,
      "user_id": prefs.getString('user_id')
    };
    //
    var body = json.encode(data);
    var url = Uri.parse(baseURL + 'input_srq_pasien');
    //
    http.Response response = await http.post(
      url,
      headers: header,
      body: body,
    );

    prefs.setString('id_srq', json.decode(response.body)["data"].toString());

    return json.decode(response.body)["data"].toString();
  }

  static Future<Dashboard> dashboard() async {
    Uri url = Uri.parse(baseURL + 'dashboard');

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    Map data = {
      "user_id": prefs.getString('user_id'),
    };

    var body = json.encode(data);

    http.Response response = await http.post(
      url,
      headers: header,
      body: body,
    );

    var data_dashboard = json.decode(response.body)['data'];

    bool success = json.decode(response.body)["success"];

    if (response.statusCode == 200) {
      return Dashboard(
        banyak_sdq: data_dashboard['banyak_sdq'],
        banyak_srq: data_dashboard['banyak_srq'],
        nama: data_dashboard['nama'],
        umur: data_dashboard['umur'],
        instansi: data_dashboard['instansi'],
        no_hp: data_dashboard['no_hp'],
        alamat: data_dashboard['alamat'],
        pekerjaan: data_dashboard['pekerjaan'],
        tipe: data_dashboard['tipe'],
        success: success,
      );
    }
    return Dashboard(
      success: success,
    );
  }

  Future riwayatSDQ() async {
    Uri url = Uri.parse(baseURL + 'riwayat_sdq');

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    Map data = {
      "user_id": prefs.getString('user_id'),
    };

    var body = json.encode(data);

    http.Response response = await http.post(
      url,
      headers: header,
      body: body,
    );

    var data_sdq = json.decode(response.body)['data'];

    Iterable it = data_sdq;
    List<RiwayatSDQ> riwayat_sdq =
        it.map((e) => RiwayatSDQ.fromJson(e)).toList();

    if (response.statusCode == 200) {
      return riwayat_sdq;
    } else {
      return riwayat_sdq;
    }
  }

  Future riwayatSRQ() async {
    Uri url = Uri.parse(baseURL + 'riwayat_srq');

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    Map data = {
      "user_id": prefs.getString('user_id'),
    };

    var body = json.encode(data);

    http.Response response = await http.post(
      url,
      headers: header,
      body: body,
    );

    var data_srq = json.decode(response.body)['data'];

    Iterable it = data_srq;
    List<RiwayatSRQ> riwayat_srq =
        it.map((e) => RiwayatSRQ.fromJson(e)).toList();

    if (response.statusCode == 200) {
      return riwayat_srq;
    } else {
      return riwayat_srq;
    }
  }

  Future notifikasi() async {
    Uri url = Uri.parse(baseURL + 'notifikasi');
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    Map data = {
      "user_id": prefs.getString('user_id'),
    };

    var body = json.encode(data);

    http.Response response = await http.post(
      url,
      headers: header,
      body: body,
    );

    var data_notif = json.decode(response.body)['data'];

    Iterable it = data_notif;
    List<Notifikasi> notifikasi =
        it.map((e) => Notifikasi.fromJson(e)).toList();

    if (response.statusCode == 200) {
      return notifikasi;
    } else {
      return notifikasi;
    }
  }

  static Future<Profil> getProfil() async {
    Uri url = Uri.parse(baseURL + 'profil');
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    Map data = {
      "user_id": prefs.getString('user_id'),
    };

    var body = json.encode(data);

    http.Response response = await http.post(
      url,
      headers: header,
      body: body,
    );

    var data_profil = json.decode(response.body)['data'];

    bool success = json.decode(response.body)["success"];

    if (response.statusCode == 200) {
      return Profil(
        nama: data_profil['nama'],
        umur: data_profil['umur'],
        instansi: data_profil['instansi'],
        no_hp: data_profil['no_hp'],
        alamat: data_profil['alamat'],
        pekerjaan: data_profil['pekerjaan'],
        kode_verif: data_profil['kode_verif'],
        success: success,
      );
    } else {}
    return Profil(
      success: success,
    );
  }
}
