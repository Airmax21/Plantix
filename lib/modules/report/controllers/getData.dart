import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
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
        id: dat['id'],
        sumber: dat['sumber'],
        tgl_terima: dat['tgl_terima'],
        soilhumid: dat['soilhumid'].toDouble(),
        airhumid: dat['airhumid'].toDouble(),
        temp: dat['temp'].toDouble(),
        lightint: dat['lightint'].toDouble(),
        tanaman_status: dat['tanaman_status'],
      ));
    }
  }
}

Future<void> downloadFile(
    String tgl_mulai, String tgl_akhir, BuildContext context,
    {String sumber = 'arduino'}) async {
  Directory? directory;
  var status = await Permission.storage.request();
  var url = Uri.parse('${kEndpoint}print/');
  var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
  var body = {
    'tgl_mulai': '${tgl_mulai}',
    'tgl_akhir': '${tgl_akhir}',
    'sumber': '${sumber}',
  };
  debugPrint(tgl_mulai);
  var response = await http.post(url, headers: headers, body: body);

  if (response.statusCode == 200) {
    if (status.isGranted) {
      if (Platform.isIOS) {
        directory = await getApplicationDocumentsDirectory(); // for iOS
      } else {
        directory = Directory('/storage/emulated/0/Download/'); // for android
        if (!await directory.exists())
          directory = (await getExternalStorageDirectory())!;
      }
      final filePath = '${directory.path}/data_sensor.xlsx';
      if (await File(filePath).exists()) {
        await File(filePath).delete();
      }
      File file = File(filePath);
      await file.writeAsBytes(response.bodyBytes);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('File berhasil di download pada folder Download'),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.green,
      ));
    } else if (status.isDenied) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Gagal! Perizinan file ditolak'),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
      ));
    } else if (status.isPermanentlyDenied) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Gagal! Perizinan file ditolak permanen'),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
      ));
    }
  }
}
