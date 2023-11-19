import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plantix/constants.dart';

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
    return Scaffold(
      appBar: AppBar(
          title: Text('Dashboard'),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: SvgPicture.asset(
                'assets/icons/chat.svg',
                color: kPrimaryLightColor
              ),
              onPressed: () {
                // do something
              },
            ),
          ]),
      body: Column(
        children: [],
      ),
    );
  }
}
