import 'package:flutter/material.dart';
import 'package:sortingvisualizer/pages/home_page.dart';
import 'package:sortingvisualizer/pages/home_page_concept.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: HomePageConcept(),
    );
  }
}
