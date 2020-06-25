import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sortingvisualizer/bloc/sorting_page.dart';
import 'package:sortingvisualizer/provider/sorting_provider.dart';

class HomePage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                    Form(
                      key: _key,
                      child: TextFormField(
                        validator: (String input) {
                          int value = int.parse(input);

                          if (value < 2) {
                            return "Number of bars have to be greater than 2";
                          } else if (value > 999) {
                            return "Number of bars have to be less than 999";
                          }

                          return null;
                        },
                        controller: _controller,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Number of bars",
                        ),
                      ),
                    ),
                    SizedBox(height: 48),
                    MaterialButton(
                      onPressed: () {
                        if (_key.currentState.validate()) {
                          int size = int.parse(_controller.text);

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ChangeNotifierProvider<SortingProvider>.value(
                                value: SortingProvider(size),
                                child: SortingPage(),
                              ),
                            ),
                          );
                        }
                      },
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
          }),
        ),
      ),
    );
  }
}
