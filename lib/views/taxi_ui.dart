import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_app_moneyshared_sau/views/show_money_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TaxiUI extends StatefulWidget {
  const TaxiUI({Key? key}) : super(key: key);

  @override
  State<TaxiUI> createState() => _TaxiUIState();
}

class _TaxiUIState extends State<TaxiUI> {
  // ignore: non_constant_identifier_names
  TextEditingController skm_ctr1 = TextEditingController();
  TextEditingController time_ctr1 = TextEditingController();

  showWarningDialog(context, msg) {
//เรียกใช้งานฟังก์ชัน showDialog
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Container(
            color: Colors.red,
            padding: EdgeInsets.only(
              top: 10.0,
              bottom: 10.0,
            ),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                ' คำเตือน',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          content: Text(
            msg,
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Ok',
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Taxi App',
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 40.0,
              ),
              Text(
                'TAXI',
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Image.asset(
                'assets/images/logo.png',
                height: 150.0,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 40.0,
                  left: 40.0,
                  top: 30.0,
                ),
                child: TextField(
                  controller: skm_ctr1,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    fillColor: Color.fromARGB(255, 157, 224, 255),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.lightBlue,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.lightBlue,
                      ),
                    ),
                    hintText: 'ระยะทาง(กิโลเมตร)',
                    hintStyle: TextStyle(
                      color: Colors.lightBlue,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 40.0,
                  right: 40.0,
                ),
                child: TextField(
                  controller: time_ctr1,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    fillColor: Color.fromARGB(255, 157, 224, 255),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.lightBlue,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.lightBlue,
                      ),
                    ),
                    hintText: 'เวลารถติด(นาที)',
                    hintStyle: TextStyle(
                      color: Colors.lightBlue,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              ElevatedButton(
                onPressed: () {
                  double? moneyshare = 0;
                  if (skm_ctr1.text.length == 0) {
                    showWarningDialog(context, 'ป้อนระยะทางด้วย.....');
                    return;
                  } else if (time_ctr1.text.length == 0) {
                    showWarningDialog(context, 'ป้อนเวลารถติดด้วย.....');
                    return;
                  } else {
                    int? skm = int.parse(skm_ctr1.text);
                    int? time = int.parse(time_ctr1.text);
                    if (skm == 1) {
                      moneyshare = (time * 2) + 35;
                    } else if (skm <= 10) {
                      moneyshare = ((skm - 1) * 5.50 + 35) + (time * 2);
                    } else if (skm <= 20) {
                      moneyshare = ((skm - 1) * 6.50 + 35) + (time * 2);
                    } else if (skm <= 40) {
                      moneyshare = ((skm - 1) * 7.50 + 35) + (time * 2);
                    } else if (skm <= 60) {
                      moneyshare = ((skm - 1) * 8.00 + 35) + (time * 2);
                    } else if (skm <= 80) {
                      moneyshare = ((skm - 1) * 9.00 + 35) + (time * 2);
                    } else {
                      moneyshare = ((skm - 1) * 10.50 + 35) + (time * 2);
                    }
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShowMoneyUI(
                        moneyshare: moneyshare,
                      ),
                    ),
                  );
                },
                child: Text(
                  'คำนวณ',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(
                    MediaQuery.of(context).size.width - 80.0,
                    50.0,
                  ),
                  primary: Colors.green,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    skm_ctr1.text = '';
                    time_ctr1.text = '';
                  });
                },
                child: Text(
                  'ยกเลิก',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(
                    MediaQuery.of(context).size.width - 80.0,
                    50.0,
                  ),
                  primary: Colors.deepOrangeAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
