import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sortingvisualizer/bloc/input_bloc/input_bloc.dart';
import 'package:sortingvisualizer/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: InputBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: TextTheme(
            button: TextStyle(color: Colors.white),
          ),
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          accentColor: Colors.blueAccent,
          buttonColor: Colors.blueAccent,
        ),
        themeMode: ThemeMode.dark,
        home: HomePage(),
      ),
    );
  }
}
