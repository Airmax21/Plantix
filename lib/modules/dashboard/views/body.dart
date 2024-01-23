import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plantix/modules/dashboard/views/chart.dart';
import 'package:plantix/modules/dashboard/views/gauge.dart';
import 'package:plantix/modules/dashboard/views/header.dart';
import 'package:plantix/modules/dashboard/views/status.dart';
import 'package:plantix/size_config.dart';
import 'package:plantix/constants.dart';

import '../../../models/Data.dart';
import '../controllers/getData.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  static late BuildContext parentContext;
  Data data = getData();
  List<Data> ldata = [];
  late Timer timer;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 5), (Timer t) {
      setState(() {
        data = getData();
        ldata = getDataGraph();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(height: getProportionateScreenHeight(10)),
          Header(),
          SizedBox(height: getProportionateScreenHeight(20)),
          Status(
            data: data,
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          Gauge(
            data: data,
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          Chart(data: ldata)
        ],
      )),
    );
  }
}
