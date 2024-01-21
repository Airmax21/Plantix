import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:plantix/components/CustomDateTimePicker.dart';
import 'package:plantix/components/CustomSurffixIcon.dart';
import 'package:plantix/constants.dart';
import 'package:plantix/models/Pompa.dart';
import 'package:plantix/modules/control/controllers/getData.dart';
import 'package:plantix/size_config.dart';
import 'package:plantix/modules/control/controllers/postData.dart';

class Filter extends StatefulWidget {
  @override
  _Filter createState() => _Filter();
}

class _Filter extends State<Filter> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DateTime? tgl_mulai;
  DateTime? tgl_akhir;
  String? sumber;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            ExpansionTile(
              title: Text('Filter'),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DateTimeTextField(
                    label: 'Tanggal Mulai',
                    onDateTimeSelected: (selectedDateTime) =>
                        tgl_mulai = selectedDateTime,
                    suffix: 'assets/icons/calendar.svg',
                    hint: 'Masukkan Tanggal Mulai Pencarian',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DateTimeTextField(
                    label: 'Tanggal Akhir',
                    onDateTimeSelected: (selectedDateTime) =>
                        tgl_akhir = selectedDateTime,
                    suffix: 'assets/icons/calendar.svg',
                    hint: 'Masukkan Tanggal Akhir Pencarian',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    onSaved: (newValue) => sumber = newValue,
                    decoration: InputDecoration(
                      labelText: "Sumber",
                      hintText: "Masukkan Sumber dari IoT",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      suffixIcon:
                          CustomSurffixIcon(svgIcon: "assets/icons/iot.svg"),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                    }
                  },
                  child: Text('Cari'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
