import 'package:flutter/material.dart';
import 'package:tip/helper.dart';
import 'Bill.dart';
import 'Keyboard.dart';
import 'PerPerson.dart';
import 'Persons.dart';
import 'TipPercent.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int persons, tip, bill, perPerson;

  @override
  void initState() {
    super.initState();
    persons = 1;
    tip = 10;
    bill = 0;
    perPerson = 0;
  }

  changeTip(int index) {
    setState(() {
      tip = index;
    });
    tipCalculate();
  }

  changePersons(int c) {
    setState(() {
      if (c == -1 && persons == 1) {
        return;
      } else {
        persons += c;
      }
    });
    tipCalculate();
  }

  changeBill(int x) {
    setState(() {
      if (x == -1) {
        bill = bill ~/ 10;
      } else {
        if (bill > 1000000) {
          return;
        }
        bill *= 10;
        bill += x;
      }
    });
    tipCalculate();
  }

  tipCalculate() {
    double all = bill + (bill.toDouble() * tip.toDouble() / 100);
    print(all);
    setState(() {
      perPerson = all ~/ persons;
    });
  }

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    final headerFontSize = data.size.width * 0.15;
    final bodyFontSize = data.size.width * 0.1;
    return Scaffold(
      backgroundColor: blackBlue,
      body: Center(
        child: Container(
          margin: EdgeInsets.only(
            left: data.size.width * 0.1,
            right: data.size.width * 0.1,
            top: data.size.width * 0.1,
            bottom: data.size.width * 0.05,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Bill(
                bill: bill,
                size: headerFontSize,
              ),
              Container(
                height: data.size.height * 0.2,
                width: data.size.width,
                child: TipPercent(
                  size: bodyFontSize,
                  tip: tip,
                  change: changeTip,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Persons(
                    size: bodyFontSize,
                    persons: persons,
                    change: changePersons,
                  ),
                  PerPerson(
                    perPerson: perPerson,
                    size: bodyFontSize,
                  ),
                ],
              ),
              Keyboard(
                height: data.size.height * 0.4,
                width: data.size.width * 0.8,
                size: bodyFontSize,
                change: changeBill,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
