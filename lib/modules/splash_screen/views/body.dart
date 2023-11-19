import 'package:flutter/material.dart';
import 'package:plantix/modules/dashboard/dashboard.dart';
import 'package:plantix/size_config.dart';
import 'package:plantix/constants.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          Navigator.pushNamed(context, Dashboard.routeName);
        }
      })
      ..forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 15),
            child: Image.asset(
              'assets/img/logo.png',
              width: getProportionateScreenWidth(150),
            ),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(90, 20, 90, 20),
              child: LinearProgressIndicator(
                color: kPrimaryColor,
                backgroundColor: Colors.white10,
                value: _controller.value,
                minHeight: 3,
              ))
        ],
      ),
    ));
  }
}
