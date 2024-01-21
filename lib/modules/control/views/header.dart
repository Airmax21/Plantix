import 'package:flutter/material.dart';
import 'package:plantix/size_config.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(5),
            vertical: getProportionateScreenHeight(5)),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(
            width: getProportionateScreenWidth(10),
          ),
          Text(
            'Control',
            style: Theme.of(context).textTheme.headline1,
          ),
          SizedBox(
            width: getProportionateScreenWidth(160),
          ),
        ]));
  }
}
