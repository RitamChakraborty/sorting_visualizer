import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sortingvisualizer/pages/sorting_page.dart';
import 'package:sortingvisualizer/data/constants.dart';
import 'package:sortingvisualizer/provider/sorting_provider.dart';

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
        int size = int.parse(_controller.text);
        List<int> arr = [];

        /// Creating array
        for (int i = 0; i < size; ++i) {
          int random = Random().nextInt(MAX_SIZE);
          arr.add(random);
        }

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) =>
                ChangeNotifierProvider<SortingProvider>.value(
              value: SortingProvider(size: size, array: arr),
              child: SortingPage(),
            ),
          ),
        );
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
                      MaterialButton(
                        onPressed: visualizeButtonOnPress,
                        color: Theme.of(context).accentColor,
                        child: Text(
                          "Visualize",
                          style: Theme.of(context).textTheme.button,
                        ),
                      )
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
