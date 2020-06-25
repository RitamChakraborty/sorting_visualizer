import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class SortingPage extends StatelessWidget {
  final List<String> sortingTypes = [
    "Bubble Sort",
    "Insertion Sort",
    "Selection Sort",
    "Merge Sort",
    "Quick Sort"
  ];

  @override
  Widget build(BuildContext context) {
    String value = sortingTypes[0];

    List<int> arr = [];
    int height = MediaQuery.of(context).size.height.toInt();
    int width = MediaQuery.of(context).size.width.toInt();

    for (int i = 0; i < 10; ++i) {
      int random = Random().nextInt(height - 100) + 10;
      arr.add(random);
    }

    double division = width / arr.length;
    double barWidth = division * 0.5;
    double barMargin = division * 0.25;

    List<Widget> children = [];

    for (int i = 0; i < arr.length; ++i) {
      Widget bar = Container(
        height: arr[i].toDouble(),
        width: barWidth,
        margin: EdgeInsets.only(left: barMargin + (division * i)),
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
      );

      children.add(bar);
    }

    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: DropdownButton<String>(
            value: value,
            onChanged: (String value) {},
            items: sortingTypes
                .map(
                  (String sortingType) => DropdownMenuItem<String>(
                    value: sortingType,
                    child: Text(
                      sortingType,
                    ),
                  ),
                )
                .toList(),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                color: Theme.of(context).buttonColor,
                onPressed: () {},
                child: Text(
                  "Sort",
                ),
              ),
            )
          ],
        ),
        body: SafeArea(
          child: Container(
            alignment: Alignment.bottomLeft,
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}
