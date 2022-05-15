import 'package:flutter/material.dart';
import 'package:flutter_app_moneyshared_sau/views/show_money_ui.dart';
import 'package:flutter_app_moneyshared_sau/views/taxi_ui.dart';




main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TaxiUI(),
      theme: ThemeData(
        fontFamily: 'Kanit',
      ),
    ),
  );
}