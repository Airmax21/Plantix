import 'package:flutter/material.dart';
import 'package:plantix/modules/splash_screen/views/body.dart';
import 'package:plantix/size_config.dart';

class Splash_screen extends StatelessWidget{
  static String routeName = "/splash_screen";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}

