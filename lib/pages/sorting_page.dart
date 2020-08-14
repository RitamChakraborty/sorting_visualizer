import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sortingvisualizer/data/constants.dart';
import 'package:sortingvisualizer/provider/sorting_provider.dart';
import 'package:sortingvisualizer/utils/utils.dart';

class SortingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SortingProvider sortingProvider = Provider.of<SortingProvider>(context);

    int n = sortingProvider.size;
    List<int> array = sortingProvider.array;
    List<int> indexArr = sortingProvider.indexArr;
    String value =
        getSortingTypeString(sortingTypes: sortingProvider.selectedSortingType);
    double animationSpeed = sortingProvider.animationSpeed;

    int height = MediaQuery.of(context).size.height.toInt();
    int width = MediaQuery.of(context).size.width.toInt();

    double division = width / n;
    double barWidth = division * 0.5;
    double barMargin = division * 0.25;

    List<double> heightArr = array
        .map((int value) => ((height - 150) * (value / MAX_SIZE) + 10))
        .toList();

    List<double> widthArr =
        indexArr.map((int value) => (barMargin + (division * value))).toList();

    Widget bar({@required double height, @required double width}) {
      return AnimatedContainer(
        duration: Duration(milliseconds: animationSpeed.toInt()),
        height: height,
        width: barWidth,
        margin: EdgeInsets.only(left: width),
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(barWidth / 2),
            topRight: Radius.circular(barWidth / 2),
          ),
        ),
      );
    }

    /// Generating the bars
    List<Widget> children = List<Widget>.generate(n,
        (int index) => bar(height: heightArr[index], width: widthArr[index]));

    Widget dropDownButton = OutlineButton(
      color: Colors.white,
      onPressed: null,
      disabledBorderColor: Theme.of(context).accentColor,
      child: Container(
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: value,
            onChanged: (String value) {
              sortingProvider.changeSortingTypeSelection(
                  sortingType: getSortingType(value: value));
            },
            items: SortingType.values
                .map(
                  (SortingType sortingType) => DropdownMenuItem<String>(
                value: getSortingTypeString(sortingTypes: sortingType),
                child: Text(
                  getSortingTypeString(sortingTypes: sortingType),
                ),
              ),
            )
                .toList(),
          ),
        ),
      ),
    );

    Widget button({@required String text, @required Function onPressed}) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: MaterialButton(
          color: Theme.of(context).accentColor,
          onPressed: () async {
            await onPressed();
          },
          child: Text(text, style: TextStyle(color: Colors.white),),
        ),
      );
    }

    Widget resetButton = button(
      text: "Reset",
      onPressed: sortingProvider.reset,
    );

    Widget sortButton = button(
      text: "Sort",
      onPressed: sortingProvider.sort,
    );

    Widget animationSpeedSlider = Slider(
      value: MAX_ANIMATION_SPEED - animationSpeed,
      max: MAX_ANIMATION_SPEED.toDouble(),
      min: 0,
      divisions: MAX_ANIMATION_SPEED ~/ 50,
      onChanged: (double speed) {
        sortingProvider.animationSpeed = MAX_ANIMATION_SPEED - speed;
      },
    );

    return Material(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: dropDownButton,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  resetButton,
                  Expanded(child: animationSpeedSlider),
                  sortButton,
                ],
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: children,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
