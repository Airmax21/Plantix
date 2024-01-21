import 'package:flutter/material.dart';
import 'package:plantix/constants.dart';
import 'package:plantix/models/Data.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../controllers/getData.dart';
import 'dart:async';
import '../controllers/getData.dart';
import 'package:plantix/size_config.dart';

class Gauge extends StatefulWidget {
  final Data data;

  const Gauge({required this.data});
  @override
  _Gauge createState() => _Gauge();
}

class _Gauge extends State<Gauge> {
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
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(5),
            vertical: getProportionateScreenHeight(5)),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _getRadialGauge('Kelembapan Tanah', data.soilhumid, '%'),
              _getRadialGauge('Kelembapan Udara', data.airhumid, '%')
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _getRadialGauge('Suhu', data.temp, 'C'),
              _getRadialGauge('Intensitas Cahaya', data.lightint, '%')
            ],
          ),
        ]));
  }
  // Widget _getGauge({bool isRadialGauge = true}) {
  //   if (isRadialGauge) {
  //     return _getRadialGauge();
  //   } else {
  //     return _getLinearGauge();
  //   }
  // }

  Widget _getRadialGauge(String judul, double nilai, String satuan) {
    return SfRadialGauge(
        title: GaugeTitle(
            text: judul,
            textStyle:
                const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        width: 180,
        height: 180,
        axes: <RadialAxis>[
          RadialAxis(minimum: 0, maximum: 150, ranges: <GaugeRange>[
            GaugeRange(
                startValue: 0,
                endValue: 50,
                color: Colors.green,
                startWidth: 10,
                endWidth: 10),
            GaugeRange(
                startValue: 50,
                endValue: 100,
                color: Colors.orange,
                startWidth: 10,
                endWidth: 10),
            GaugeRange(
                startValue: 100,
                endValue: 150,
                color: Colors.red,
                startWidth: 10,
                endWidth: 10)
          ], pointers: <GaugePointer>[
            NeedlePointer(
              value: nilai,
              needleEndWidth: 5,
              needleStartWidth: 3,
            )
          ], annotations: <GaugeAnnotation>[
            GaugeAnnotation(
                widget: Container(
                    child: Text('$nilai' + satuan,
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold))),
                angle: 90,
                positionFactor: 0.5)
          ])
        ]);
  }

  // Widget _getLinearGauge() {
  //   return Container
  //     child: SfLinearGauge(
  //         minimum: 0.0,
  //         maximum: 100.0,
  //         orientation: LinearGaugeOrientation.horizontal,
  //         majorTickStyle: LinearTickStyle(length: 20),
  //         axisLabelStyle: TextStyle(fontSize: 12.0, color: Colors.black),
  //         axisTrackStyle: LinearAxisTrackStyle(
  //             color: Colors.cyan,
  //             edgeStyle: LinearEdgeStyle.bothFlat,
  //             thickness: 15.0,
  //             borderColor: Colors.grey)),
  //     margin: EdgeInsets.all(10),
  //   );
  // }
}
