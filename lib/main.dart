import 'package:flutter/material.dart';
import 'package:sortingvisualizer/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
      home: HomePage(),
//      home: SortingPage(),
    );
  }
}
