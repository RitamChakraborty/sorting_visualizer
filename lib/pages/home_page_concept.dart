import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePageConcept extends StatefulWidget {
  @override
  _HomePageConceptState createState() => _HomePageConceptState();
}

class _HomePageConceptState extends State<HomePageConcept> {
  String bars = "100";
  String error = "";

  @override
  Widget build(BuildContext context) {
    Widget button({@required Widget child, @required String value}) {
      return Expanded(
        child: MaterialButton(
          onPressed: () {
            setState(() {
              if (value == "g") {
                if (bars.isNotEmpty) {
                  int barCount = int.parse(bars);

                  if (barCount < 2) {
                    error = "Minimum number is 2";
                  } else if (barCount >= 1000) {
                    error = "Maximum number is 999";
                  } else {
                    // Next page
                  }
                } else {
                  error = "Minimum number is 2";
                }
              } else if (value == "b") {
                error = "";

                if (bars.length > 1) {
                  bars = bars.substring(0, bars.length - 1);
                } else {
                  bars = "";
                }
              } else {
                if (bars.length < 3) {
                  error = "";
                  bars += value;
                } else {
                  error = "Maximum number is 999";
                }
              }
            });
          },
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(Radius.zero),
            side: BorderSide(
              color: Theme.of(context).dividerColor,
            ),
          ),
          child: Center(child: child),
        ),
      );
    }

    Widget text(String text) => Text(text, style: TextStyle(fontSize: 20.0));

    Widget goIcon = Text(
      "Visualize",
      style: TextStyle(
        color: Theme.of(context).accentColor,
        fontSize: 20,
        fontStyle: FontStyle.italic,
      ),
    );

    return Material(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            "Sorting Visualizer",
            style: TextStyle(
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.grey.shade800
                  : Colors.grey.shade100,
            ),
          ),
        ),
        body: Flex(
          direction: Axis.vertical,
          children: [
            Flexible(
              flex: 1,
              child: Center(
                child: Container(
                  width: 150,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Enter number of bars",
                          style: TextStyle(
                            color: Theme.of(context).hintColor,
                          )),
                      Text(
                        bars,
                        style: TextStyle(
                          letterSpacing: 5,
                          fontSize: 48.0,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8.0),
                        width: double.infinity,
                        color: Theme.of(context).accentColor,
                        height: 2,
                      ),
                      Text(
                        error,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Theme.of(context).errorColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          button(child: text("1"), value: "1"),
                          button(child: text("2"), value: "2"),
                          button(child: text("3"), value: "3"),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          button(child: text("4"), value: "4"),
                          button(child: text("5"), value: "5"),
                          button(child: text("6"), value: "6"),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          button(child: text("7"), value: "7"),
                          button(child: text("8"), value: "8"),
                          button(child: text("9"), value: "9"),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          button(child: Icon(Icons.backspace), value: "b"),
                          button(child: text("0"), value: "1"),
                          button(child: goIcon, value: "g"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
