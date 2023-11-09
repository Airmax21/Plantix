import 'package:flutter/material.dart';
import 'package:plantix/modules/mqtt/views/body.dart';
import 'package:plantix/size_config.dart';

class Splash_screen extends StatelessWidget{
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

