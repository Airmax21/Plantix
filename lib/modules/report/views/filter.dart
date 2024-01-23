import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:plantix/components/CustomDateTimePicker.dart';
import 'package:plantix/components/CustomSurffixIcon.dart';
import 'package:plantix/constants.dart';
import 'package:plantix/models/Data.dart';
import 'package:plantix/size_config.dart';
import 'package:plantix/modules/report/controllers/getData.dart';
import 'package:plantix/modules/control/controllers/postData.dart';

class Filter extends StatefulWidget {
  final void Function(List<String> Post)? onSearch;

  const Filter({
    this.onSearch,
  });

  @override
  _Filter createState() => _Filter();
}

class _Filter extends State<Filter> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<Data> data = [];
  bool isLoading = false;
  DateTime? tgl_mulai;
  DateTime? tgl_akhir;
  String? sumber;

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
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      try {
                        setState(() {
                          isLoading = true;
                        });
                        List<Data> newData = await getData(
                            tgl_mulai.toString(), tgl_akhir.toString(),
                            sumber: sumber.toString());
                        List<String> post = [
                          tgl_mulai.toString(),
                          tgl_akhir.toString(),
                          sumber.toString()
                        ];
                        widget.onSearch!(post);
                        Future.delayed(Duration(seconds: 2), () {
                          setState(() {
                            data = newData;
                            isLoading = false;
                          });
                        });
                      } catch (error) {
                        setState(() {
                          isLoading = false;
                        });
                      }
                    }
                  },
                  child: Text('Cari'),
                ),
              ],
            ),
            isLoading
                ? CircularProgressIndicator()
                : SizedBox(
                    height: getProportionateScreenHeight(590),
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: ListTile(
                            title: Text(
                                'Tanggal : ${DateTime.parse(data[index].tgl_terima)}'),
                            subtitle: Text(
                                'soilhumid: ${data[index].soilhumid}\nairhumid: ${data[index].airhumid}\ntemp: ${data[index].temp}\nlightint: ${data[index].lightint}\ntanaman_status: ${data[index].tanaman_status}'),
                          ),
                        );
                      },
                    )),
          ],
        ),
      ),
    );
  }
}
