import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sortingvisualizer/bloc/input_bloc/input_bloc.dart';
import 'package:sortingvisualizer/bloc/theme_bloc/theme_bloc.dart';
import 'package:sortingvisualizer/data/constants.dart';
import 'package:sortingvisualizer/pages/sorting_page.dart';
import 'package:sortingvisualizer/provider/sorting_provider.dart';
import 'package:sortingvisualizer/widgets/theme_change_icon.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    InputBloc inputBloc = BlocProvider.of<InputBloc>(context);
    ThemeBloc themeBloc = BlocProvider.of<ThemeBloc>(context);

    Widget button(
        {@required Widget child,
        @required String value,
        @required AbstractInputEvent inputEvent}) {
      return Expanded(
        child: MaterialButton(
          onPressed: () {
            inputBloc.add(inputEvent);
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

    return BlocBuilder<ThemeBloc, ThemeMode>(
        cubit: themeBloc,
        builder: (BuildContext context, ThemeMode themeMode) {
          Widget icon = ThemeChangingIcon(themeMode: themeMode);
          String themeChangerToolTip = themeMode == ThemeMode.light ? "Change to Dark Theme" : "Change to Light Theme";

          return Material(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                centerTitle: true,
                actions: [
                  IconButton(
                    icon: icon,
                    onPressed: themeBloc.changeTheme,
                    tooltip: themeChangerToolTip,
                  ),
                ],
                title: Text(
                  "Sorting Visualizer",
                  style: TextStyle(
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.grey.shade800
                        : Colors.grey.shade100,
                  ),
                ),
              ),
              body: BlocConsumer<InputBloc, AbstractInputState>(
                cubit: inputBloc,
                listener:
                    (BuildContext context, AbstractInputState inputState) {
                  if (inputState is VisualizeInputState) {
                    int bars = int.parse(inputState.bars);

                    Set<int> arr = Set();

                    /// Creating set to prevent same digit
                    for (int i = 0; arr.length < bars; ++i) {
                      int random = Random().nextInt(MAX_SIZE);
                      arr.add(random);
                    }

                    List<int> list = arr.toList();

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            ChangeNotifierProvider<SortingProvider>.value(
                          value: SortingProvider(size: bars, array: list),
                          child: SortingPage(),
                        ),
                      ),
                    );
                  }
                },
                builder: (BuildContext context, AbstractInputState inputState) {
                  String bars = inputState.bars;
                  String error = inputState.error;

                  return Flex(
                    direction: Axis.vertical,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Center(
                          child: Container(
                            width: 200,
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Enter number of bars",
                                  style: TextStyle(
                                    color: Theme.of(context).hintColor,
                                  ),
                                ),
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
                                    button(
                                      child: text("1"),
                                      value: "1",
                                      inputEvent: DigitInputEvent(digit: "1"),
                                    ),
                                    button(
                                      child: text("2"),
                                      value: "2",
                                      inputEvent: DigitInputEvent(digit: "2"),
                                    ),
                                    button(
                                      child: text("3"),
                                      value: "3",
                                      inputEvent: DigitInputEvent(digit: "3"),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    button(
                                      child: text("4"),
                                      value: "4",
                                      inputEvent: DigitInputEvent(digit: "4"),
                                    ),
                                    button(
                                      child: text("5"),
                                      value: "5",
                                      inputEvent: DigitInputEvent(digit: "5"),
                                    ),
                                    button(
                                      child: text("6"),
                                      value: "6",
                                      inputEvent: DigitInputEvent(digit: "6"),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    button(
                                      child: text("7"),
                                      value: "7",
                                      inputEvent: DigitInputEvent(digit: "7"),
                                    ),
                                    button(
                                      child: text("8"),
                                      value: "8",
                                      inputEvent: DigitInputEvent(digit: "8"),
                                    ),
                                    button(
                                      child: text("9"),
                                      value: "9",
                                      inputEvent: DigitInputEvent(digit: "9"),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    button(
                                        child: Icon(Icons.backspace),
                                        value: "b",
                                        inputEvent: BackspaceInputEvent()),
                                    button(
                                      child: text("0"),
                                      value: "0",
                                      inputEvent: DigitInputEvent(digit: "0"),
                                    ),
                                    button(
                                        child: goIcon,
                                        value: "g",
                                        inputEvent: VisualizedInputEvent()),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          );
        });
  }
}
