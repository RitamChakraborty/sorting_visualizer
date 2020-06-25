import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:sortingvisualizer/data/constants.dart';
import 'package:sortingvisualizer/provider/sorting_provider.dart';

class SortingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SortingProvider sortingProvider = Provider.of<SortingProvider>(context);

    int n = sortingProvider.size;
    String value = sortingProvider.selectedSortingType;

    int height = MediaQuery.of(context).size.height.toInt();
    int width = MediaQuery.of(context).size.width.toInt();

    List<double> arr = sortingProvider.arr.map((int value) {
      return (height - 100) * (value / MAX_SIZE) + 10;
    }).toList();

    double division = width / arr.length;
    double barWidth = division * 0.5;
    double barMargin = division * 0.25;

    List<Widget> children = List<Widget>.generate(
      n,
      (int index) => Container(
        height: arr[index],
        width: barWidth,
        margin: EdgeInsets.only(left: barMargin + (division * index)),
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
      ),
    );

    Widget dropDownButton = DropdownButton<String>(
      value: value,
      onChanged: (String value) {
        sortingProvider.changeSortingTypeSelection(sortingType: value);
      },
      items: SORTING_TYPES
          .map(
            (String sortingType) => DropdownMenuItem<String>(
              value: sortingType,
              child: Text(
                sortingType,
              ),
            ),
          )
          .toList(),
    );

    Widget sortButton = Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        color: Theme.of(context).buttonColor,
        onPressed: () async {
          await sortingProvider.sort();
        },
        child: Text(
          "Sort",
        ),
      ),
    );

    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: dropDownButton,
          actions: [
            sortButton,
          ],
        ),
        body: SafeArea(
          child: Container(
            alignment: Alignment.bottomLeft,
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}
