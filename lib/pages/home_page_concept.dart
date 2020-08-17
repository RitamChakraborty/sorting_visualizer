import 'dart:math';

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
              child: Container(),
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
                          digitButton(child: Icon(Icons.forward)),
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
