import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:plantix/constants.dart';
import 'package:plantix/models/Data.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../controllers/getData.dart';
import 'package:plantix/size_config.dart';

class Status extends StatefulWidget {
  final Data data;

  const Status({required this.data});
  @override
  _Status createState() => _Status();
}

class _Status extends State<Status> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.all(5),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Text(
            data.tanaman_status,
            style: TextStyle(
                color: (data.tanaman_status == 'Tanaman butuh air')
                    ? HexColor('#63000f')
                    : kPrimaryColor,
                fontSize: 20),
          )
        ]));
  }
  // Widget _getGauge({bool isRadialGauge = true}) {
  //   if (isRadialGauge) {
  //     return _getRadialGauge();
  //   } else {
  //     return _getLinearGauge();
  //   }
  // }
}
