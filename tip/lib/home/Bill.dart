import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:tip/helper.dart';

class Bill extends StatelessWidget {
  final int bill;
  final double size;

  Bill({
    this.bill,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: AutoSizeText(
          '\$${bill.toString()}',
          style: TextStyle(
            fontSize: size,
            color: cyan,
          ),
        ),
      ),
    );
  }
}
