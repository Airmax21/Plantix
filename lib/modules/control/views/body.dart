import 'package:flutter/material.dart';
import 'package:plantix/modules/control/views/header.dart';
import 'package:plantix/modules/control/views/switch.dart';
import 'package:plantix/size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
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
    return SafeArea(
      child: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(height: getProportionateScreenHeight(10)),
          Header(),
          SizedBox(height: getProportionateScreenHeight(20)),
          SwitchB()
        ],
      )),
    );
  }
}
