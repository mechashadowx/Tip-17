import 'package:flutter/material.dart';
import 'package:tip/helper.dart';

class TipPercent extends StatelessWidget {
  final double size;
  final Function change;
  final int tip;

  TipPercent({
    this.change,
    this.size,
    this.tip,
  });

  String getTip(int p) {
    if (p < 10) {
      return '0${p.toString()}%';
    } else {
      return '${p.toString()}%';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(101, (index) {
            return GestureDetector(
              onTap: () {
                change(index);
              },
              child: Container(
                margin: EdgeInsets.all(size * 0.5),
                child: Center(
                  child: Text(
                    getTip(index),
                    style: TextStyle(
                      fontSize: size,
                      color: (index == tip ? cyan : lightCyan),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
