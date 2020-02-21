import 'package:flutter/material.dart';
import '../helper.dart';

class Persons extends StatelessWidget {
  final double size;
  final Function change;
  final int persons;

  Persons({
    this.size,
    this.change,
    this.persons,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                change(1);
              },
              child: Container(
                child: Center(
                  child: Image.asset(
                    'images/plus.png',
                    height: size * 0.75,
                    width: size * 0.75,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  persons.toString(),
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
            GestureDetector(
              onTap: () {
                change(-1);
              },
              child: Container(
                child: Center(
                  child: Image.asset(
                    'images/minus.png',
                    height: size * 0.75,
                    width: size * 0.75,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
