import 'package:flutter/material.dart';

class ShowMoneyUI extends StatefulWidget {
  double? moneyshare;

  ShowMoneyUI({
    Key? key,
    this.moneyshare,
  }) : super(key: key);

  @override
  State<ShowMoneyUI> createState() => _ShowMoneyUIState();
}

class _ShowMoneyUIState extends State<ShowMoneyUI> {
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
              SizedBox(
                height: 30.0,
              ),
              Text(
                'จ่ายค่าแท็กชี่เป็นเงิน',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                widget.moneyshare.toString(),
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
               SizedBox(
                height: 30.0,
              ),
              Text(
                'บาท',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
