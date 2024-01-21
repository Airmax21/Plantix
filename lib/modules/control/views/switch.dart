import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:plantix/constants.dart';
import 'package:plantix/models/Pompa.dart';
import 'package:plantix/modules/control/controllers/getData.dart';
import 'package:plantix/size_config.dart';
import 'package:plantix/modules/control/controllers/postData.dart';

class SwitchB extends StatefulWidget {
  @override
  _Switch createState() => _Switch();
}

class _Switch extends State<SwitchB> {
  Pompa data = Pompa();

  bool _switchValue = false;
  @override
  void initState() {
    super.initState();
    data = getData();
    if (data.pompa == 'on')
      _switchValue = true;
    else
      _switchValue = false;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: getProportionateScreenHeight(130),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          color: Colors.blue,
        ),
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(10),
            vertical: getProportionateScreenHeight(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: getProportionateScreenWidth(10),
            ),
            SvgPicture.asset(
              "assets/icons/pompa.svg",
              color: Colors.white,
              width: getProportionateScreenWidth(30),
            ),
            SizedBox(
              width: getProportionateScreenWidth(10),
            ),
            Text(
              'Pompa Air',
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
            SizedBox(
              width: getProportionateScreenWidth(100),
            ),
            Transform.scale(
              scale: 2,
              child: Switch(
                value: _switchValue,
                onChanged: (value) {
                  setState(() {
                    _switchValue = value;
                    postData((value) ? 'on' : 'off');
                  });
                },
                activeColor: kPrimaryColor,
                activeTrackColor: HexColor('#00FF00'),
                inactiveThumbColor: Colors.grey,
                inactiveTrackColor: Colors.grey[300],
              ),
            ),
          ],
        ));
  }
}
