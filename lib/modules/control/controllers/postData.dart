import 'package:flutter/material.dart';
import 'package:plantix/constants.dart';
import 'package:http/http.dart' as http;

Future<bool> postData(String status) async {
  var url = Uri.parse('${kEndpoint}api/pompa');
  var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
  var body = {'pompa': '${status}'};
  var response = await http.post(url, headers: headers, body: body);
  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
  
}
