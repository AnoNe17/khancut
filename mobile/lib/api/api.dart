import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

const String baseURL = "https://puskesmaskertasemaya.com/api/"; //emulator localhost
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
      String? umur,
      String? instansi,
      String? total_kesulitan,
      String? hasil_e,
      String? hasil_c,
      String? hasil_h,
      String? hasil_p,
      String? hasil_pro
      ) async {

    // return hasil_c;
    Map data = {
      "nama": nama,
      "umur": umur,
      "instansi": instansi,
      "total_kesulitan": total_kesulitan,
      "hasil_e": hasil_e,
      "hasil_c": hasil_c,
      "hasil_h": hasil_h,
      "hasil_p": hasil_p,
      "hasil_pro": hasil_pro,
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

    return "Data Berhasil Di Input";
  }

  static Future<String?> tambahHasilSRQ(
      String? nama,
      String? umur,
      String? no_hp,
      String? alamat,
      String? pekerjaan,
      String? hasil
      ) async {

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
}
