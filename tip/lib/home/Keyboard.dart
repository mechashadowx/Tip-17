import 'package:flutter/material.dart';
import 'package:tip/helper.dart';

class Keyboard extends StatelessWidget {
  final double height, width, size;
  final Function change;

  Keyboard({
    this.height,
    this.width,
    this.size,
    this.change,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      height: height,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(8, (i) {
            if (i % 2 == 1) {
              return Container(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: List.generate(7, (j) {
                      if (j == 0 || j == 6) {
                        return Container(
                          height: height * 0.24,
                          width: 2.0,
                        );
                      } else if (j % 2 == 0) {
                        return VSplit(
                          height: height * 0.24,
                        );
                      } else {
                        List<List<int>> cells = List();
                        for (int k = 0; k < 8; k++) {
                          cells.add(List.generate(7, (w) => 0));
                        }
                        int a = 1, b = 1;
                        for (int k = 1; k <= 9; k++) {
                          cells[a][b] = k;
                          b += 2;
                          if (b == 7) {
                            b = 1;
                            a += 2;
                          }
                        }
                        cells[7][3] = 0;
                        cells[7][1] = 10;
                        cells[7][5] = -1;
                        if (cells[i][j] == -1) {
                          return GestureDetector(
                            onTap: () {
                              change(cells[i][j]);
                            },
                            child: Container(
                              height: height * 0.24,
                              width: height * 0.24,
                              child: Center(
                                child: Image.asset(
                                  'images/delete.png',
                                  height: height * 0.1,
                                  width: height * 0.1,
                                ),
                              ),
                            ),
                          );
                        } else if (cells[i][j] == 10) {
                          return Container(
                            height: height * 0.24,
                            width: height * 0.24,
                            child: Center(
                              child: Text(
                                '.',
                                style: TextStyle(
                                  fontSize: size,
                                  color: cyan,
                                ),
                              ),
                            ),
                          );
                        }
                        return GestureDetector(
                          onTap: () {
                            change(cells[i][j]);
                          },
                          child: Container(
                            height: height * 0.24,
                            width: height * 0.24,
                            child: Center(
                              child: Text(
                                cells[i][j].toString(),
                                style: TextStyle(
                                  fontSize: size,
                                  color: cyan,
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                    }),
                  ),
                ),
              );
            } else {
              return HSplit();
            }
          }),
        ),
      ),
    );
  }
}

class HSplit extends StatelessWidget {
  final double width;

  HSplit({
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2.0,
      width: width,
      color: lightPurlpe,
    );
  }
}

class VSplit extends StatelessWidget {
  final double height;

  VSplit({
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: 2.0,
      color: lightPurlpe,
    );
  }
}
