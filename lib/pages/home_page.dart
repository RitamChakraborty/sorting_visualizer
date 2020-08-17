import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sortingvisualizer/pages/sorting_page.dart';
import 'package:sortingvisualizer/data/constants.dart';
import 'package:sortingvisualizer/provider/sorting_provider.dart';
import 'package:sortingvisualizer/widgets/rounded_button.dart';

class HomePage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  String _inputValidator(String input) {
    int value = int.parse(input);

    if (value < 2) {
      return "Number of bars have to be greater than 2";
    } else if (value > 999) {
      return "Number of bars have to be less than 999";
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    Widget form = Form(
      key: _key,
      child: TextFormField(
        validator: _inputValidator,
        controller: _controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: "Number of bars",
        ),
      ),
    );

    void visualizeButtonOnPress() {
      if (_key.currentState.validate()) {

      }
    }

    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Sorting Visualizer"),
        ),
        body: SafeArea(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              double maxWidth = constraints.maxWidth;
              double maxHeight = constraints.maxHeight;
              double padding;

              if (maxWidth > maxHeight) {
                padding = maxWidth * 0.1;
              } else {
                padding = 32.0;
              }

              return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: padding),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      form,
                      SizedBox(height: 48),
                      RoundedButton(
                        text: "Visualize",
                        onPressed: visualizeButtonOnPress,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
