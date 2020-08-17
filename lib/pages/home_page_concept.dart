import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePageConcept extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget digitButton({@required Widget child}) {
      return Expanded(
        child: MaterialButton(
          onPressed: () {},
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.all(Radius.zero),
              side: BorderSide(
                color: Theme.of(context).dividerColor,
              )),
          child: Center(child: child),
        ),
      );
    }

    Widget text(String text) => Text(
          text,
          style:
              TextStyle(fontSize: 20.0, color: Theme.of(context).accentColor),
        );
    Widget goIcon = Text(
      "Visualize",
      style: TextStyle(
        fontSize: 24,
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
                        "",
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
                        "Number of bars has to be less than 1000",
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
                          digitButton(child: text("1")),
                          digitButton(child: text("2")),
                          digitButton(child: text("3")),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          digitButton(child: text("4")),
                          digitButton(child: text("5")),
                          digitButton(child: text("6")),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          digitButton(child: text("7")),
                          digitButton(child: text("8")),
                          digitButton(child: text("9")),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          digitButton(child: Icon(Icons.backspace)),
                          digitButton(child: text("0")),
                          digitButton(child: goIcon),
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
