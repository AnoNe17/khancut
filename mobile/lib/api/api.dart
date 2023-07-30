import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/api/model/dashboard.dart';
import 'package:untitled/api/model/profil.dart';

const String baseURL = "http://192.168.0.105:8000/api/"; //emulator localhost
const Map<String, String> header = {"Content-Type": "application/json"};

class API {
  static Future<http.Response> login(
      String email, String password, BuildContext context) async {
    Map data = {
      "email": email,
      "password": password,
    };
    var body = json.encode(data);
    var url = Uri.parse(baseURL + 'login');
    http.Response response = await http.post(
      url,
      headers: header,
      body: body,
    );

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

  static Future pdfSDQPasienBaru() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    Map data = {
      "id": prefs.getString('id_sdq'),
      "pasien_baru": true,
    };

    var body = json.encode(data);
    var url = Uri.parse(baseURL + 'hasil_sdq/pdf');

    http.Response response = await http.post(
      url,
      headers: header,
      body: body,
    );

    // return "Data Berhasil Di Input";
  }

  static Future<String?> tambahHasilSRQ(String? nama, String? umur,
      String? no_hp, String? alamat, String? pekerjaan, String? hasil) async {
    Map data = {
      "nama": nama,
      "umur": umur,
      "no_hp": no_hp,
      "alamat": alamat,
      "pekerjaan": pekerjaan,
      "hasil": hasil,
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

    return "Data Berhasil Di Input";
  }

  static Future<Dashboard> dashboard() async {
    Uri url = Uri.parse(baseURL + 'dashboard');

    Map data = {
      "user_id": 40,
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
        success: success,
      );
    }
    return Dashboard(
      success: success,
    );
  }

  static Future<Profil> getProfil() async {
    Uri url = Uri.parse(baseURL + 'profil');

    Map data = {
      "user_id": 40,
    };

    var body = json.encode(data);

    http.Response response = await http.post(
      url,
      headers: header,
      body: body,
    );

    var data_profil = json.decode(response.body)['data'];

    print(data_profil);

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
