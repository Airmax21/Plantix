import 'package:flutter/material.dart';
import 'package:plantix/models/Data.dart';
import 'package:plantix/modules/dashboard/controllers/getData.dart';
import 'package:plantix/size_config.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart extends StatefulWidget {
  final List<Data> data;
  const Chart({required this.data});
  @override
  _Chart createState() => _Chart();
}

class _Chart extends State<Chart> {
  late TooltipBehavior _tooltipBehavior;
  List<Data> ldata = [];
  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(5),
            vertical: getProportionateScreenHeight(5)),
        child: Column(
          children: [
            SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                // Chart title
                title: ChartTitle(text: 'Data Sensor'),
                // Enable legend
                legend: Legend(
                    isVisible: true,
                    overflowMode: LegendItemOverflowMode.wrap,
                    position: LegendPosition.bottom),
                // Enable tooltip
                tooltipBehavior: _tooltipBehavior,
                series: <LineSeries<Data, String>>[
                  LineSeries<Data, String>(
                      name: 'Kelembapan Tanah',
                      dataSource: widget.data,
                      xValueMapper: (Data data, _) => data.tgl_terima,
                      yValueMapper: (Data data, _) => data.soilhumid,
                      // Enable data label
                      dataLabelSettings: DataLabelSettings(isVisible: true)),
                  LineSeries<Data, String>(
                      name: 'Intensitas Cahaya',
                      dataSource: widget.data,
                      xValueMapper: (Data data, _) => data.tgl_terima,
                      yValueMapper: (Data data, _) => data.lightint,
                      // Enable data label
                      dataLabelSettings: DataLabelSettings(isVisible: true)),
                ]),
            SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                // Chart title
                title: ChartTitle(text: 'Data Suhu'),
                // Enable legend
                legend: Legend(
                    isVisible: true,
                    overflowMode: LegendItemOverflowMode.wrap,
                    position: LegendPosition.bottom),
                // Enable tooltip
                tooltipBehavior: _tooltipBehavior,
                series: <LineSeries<Data, String>>[
                  LineSeries<Data, String>(
                      name: 'Suhu',
                      dataSource: widget.data,
                      xValueMapper: (Data data, _) => data.tgl_terima,
                      yValueMapper: (Data data, _) => data.temp,
                      // Enable data label
                      dataLabelSettings: DataLabelSettings(isVisible: true)),
                ])
          ],
        ));
  }
}
