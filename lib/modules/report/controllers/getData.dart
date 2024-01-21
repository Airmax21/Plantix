import 'package:flutter/material.dart';
import 'package:plantix/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:plantix/models/Data.dart';

List<Data> data = [];

List<Data> getData(String tgl_mulai, String tgl_akhir,
    {String sumber = 'arduino'}) {
  fetchData(tgl_mulai, tgl_akhir, sumber: sumber);
  return data;
}

Future<void> fetchData(String tgl_mulai, String tgl_akhir,
    {String sumber = 'arduino'}) async {
  var url = Uri.parse('${kEndpoint}api/');
  var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
  var body = {
    'tgl_mulai': '${tgl_mulai}',
    'tgl_akhir': '${tgl_akhir}',
    'sumber': '${sumber}',
  };
  var response = await http.post(url, headers: headers, body: body);
  var fetch = jsonDecode(response.body);
  if (response.statusCode == 200) {
    for (var dat in fetch) {
      data.add(Data(
        id: fetch['id'],
        sumber: fetch['sumber'],
        tgl_terima: fetch['tgl_terima'],
        soilhumid: fetch['soilhumid'].toDouble(),
        airhumid: fetch['airhumid'].toDouble(),
        temp: fetch['temp'].toDouble(),
        lightint: fetch['lightint'].toDouble(),
        tanaman_status: fetch['tanaman_status'],
      ));
    }
  }
}
