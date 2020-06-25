import 'package:flutter/material.dart';

class SortingPage extends StatelessWidget {
  final List<String> sortingTypes = [
    "Bubble Sort",
    "Insertion Sort",
    "Selection Sort",
    "Merge Sort",
    "Quick Sort"
  ];

  @override
  Widget build(BuildContext context) {
    String value = sortingTypes[0];

    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: DropdownButton<String>(
            value: value,
            onChanged: (String value) {},
            items: sortingTypes
                .map(
                  (String sortingType) => DropdownMenuItem<String>(
                    value: sortingType,
                    child: Text(
                      sortingType,
                    ),
                  ),
                )
                .toList(),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                color: Theme.of(context).buttonColor,
                onPressed: () {},
                child: Text(
                  "Sort",
                ),
              ),
            )
          ],
        ),
        body: SafeArea(
          child: Container(),
        ),
      ),
    );
  }
}
