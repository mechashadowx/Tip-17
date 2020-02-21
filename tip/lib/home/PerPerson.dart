import 'package:flutter/material.dart';
import 'package:tip/helper.dart';

class PerPerson extends StatelessWidget {
  final int perPerson;
  final double size;

  PerPerson({
    this.perPerson,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              '\$${perPerson.toString()}/',
              style: TextStyle(
                fontSize: size,
                color: cyan,
              ),
            ),
            Image.asset(
              'images/person.png',
              height: size * 0.75,
              width: size * 0.75,
            ),
          ],
        ),
      ),
    );
  }
}
