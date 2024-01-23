import 'package:flutter/material.dart';
import 'package:plantix/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:plantix/models/Data.dart';

Data data = Data();
List<Data> dataGraph = [];

Data getData() {
  fetchData();
  return data;
}

List<Data> getDataGraph() {
  fetchDataGraph();
  return dataGraph;
}

Future<void> fetchData() async {
  var url = Uri.parse('${kEndpoint}api/');
  var response = await http.get(url);
  var fetch = jsonDecode(response.body);
  if (response.statusCode == 200) {
    data = Data(
        id: fetch[0]['id'],
        sumber: fetch[0]['sumber'],
        tgl_terima: fetch[0]['tgl_terima'],
        soilhumid: fetch[0]['soilhumid'].toDouble(),
        airhumid: fetch[0]['airhumid'].toDouble(),
        temp: fetch[0]['temp'].toDouble(),
        lightint: fetch[0]['lightint'].toDouble(),
        tanaman_status: fetch[0]['tanaman_status']);
  }
}

Future<void> fetchDataGraph() async {
  var url = Uri.parse('${kEndpoint}api/graph');
  var response = await http.get(url);
  var fetch = jsonDecode(response.body);
  if (response.statusCode == 200) {
    for (var dat in fetch) {
      dataGraph.add(Data(
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
