import 'package:flutter/material.dart';
import 'package:plantix/constants.dart';
import 'package:plantix/models/Data.dart';
import 'package:plantix/modules/report/controllers/getData.dart';
import 'package:plantix/modules/report/views/header.dart';
import 'package:plantix/modules/report/views/filter.dart';
import 'package:flutter/foundation.dart';
import 'package:plantix/size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<String> post = ['', '', ''];

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
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(height: getProportionateScreenHeight(40)),
          Header(),
          SizedBox(height: getProportionateScreenHeight(20)),
          Filter(
            onSearch: (Post) => post = Post,
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await downloadFile(post[0], post[1], sumber: post[2]);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('File berhasil di download pada folder Download'),
            duration: Duration(seconds: 3),
          ));
        },
        child: Icon(Icons.print),
        backgroundColor: kPrimaryColor,
      ),
    );
  }
}
