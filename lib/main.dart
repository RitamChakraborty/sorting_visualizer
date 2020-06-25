import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sortingvisualizer/pages/home_page.dart';
import 'package:sortingvisualizer/provider/sorting_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SortingProvider>.value(
      value: SortingProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: TextTheme(
            button: TextStyle(color: Colors.white),
          ),
        ),
        home: HomePage(),
      ),
    );
  }
}
