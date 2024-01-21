import 'package:flutter/material.dart';
import 'package:plantix/components/CustomBottomNavBar.dart';
import 'package:plantix/enums.dart';
import 'package:plantix/modules/control/views/body.dart';
import 'package:plantix/size_config.dart';

class Control extends StatelessWidget {
  static String routeName = "/control";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.control),
    );
  }
}
