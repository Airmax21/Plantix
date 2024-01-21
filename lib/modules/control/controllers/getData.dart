import 'package:flutter/material.dart';
import 'package:plantix/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:plantix/models/Pompa.dart';

Pompa data = Pompa();

Pompa getData() {
  fetchData();
  return data;
}

Future<void> fetchData() async {
  var url = Uri.parse('${kEndpoint}api/pompa');
  var response = await http.get(url);
  var fetch = jsonDecode(response.body);
  if (response.statusCode == 200) {
    data = Pompa(
        id: fetch[0]['id'],
        sumber: fetch[0]['sumber'],
        tgl_terima: fetch[0]['tgl_terima'],
        pompa: fetch[0]['pompa']);
  }
}
