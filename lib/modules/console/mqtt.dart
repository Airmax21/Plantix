import 'package:flutter/material.dart';
import 'package:plantix/modules/console/views/body.dart';
import 'package:plantix/size_config.dart';

class Mqtt extends StatelessWidget{
  static String routeName = "/mqtt";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}

