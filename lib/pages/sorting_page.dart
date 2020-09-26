import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sortingvisualizer/bloc/theme_bloc/theme_bloc.dart';
import 'package:sortingvisualizer/data/constants.dart';
import 'package:sortingvisualizer/provider/sorting_provider.dart';
import 'package:sortingvisualizer/utils/utils.dart';
import 'package:sortingvisualizer/widgets/bar.dart';
import 'package:sortingvisualizer/widgets/rounded_button.dart';
import 'package:sortingvisualizer/widgets/sorting_dropdown.dart';
import 'package:sortingvisualizer/widgets/theme_change_icon.dart';

class SortingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeBloc themeBloc = BlocProvider.of<ThemeBloc>(context);
    SortingProvider sortingProvider = Provider.of<SortingProvider>(context);

    int n = sortingProvider.size;
    bool isSorting = sortingProvider.isSorting;

    List<int> array = sortingProvider.array;
    List<int> indexArr = sortingProvider.indexArr;
    String value =
        getSortingTypeString(sortingTypes: sortingProvider.selectedSortingType);
    double animationSpeed = sortingProvider.animationSpeed;
    int swapI = sortingProvider.swapI;
    int swapJ = sortingProvider.swapJ;
    bool swapping = swapI != swapJ;

    int height = MediaQuery.of(context).size.height.toInt();
    int width = MediaQuery.of(context).size.width.toInt();

    double division = width / n;
    double barWidth = division * 0.5;
    double barMargin = division * 0.25;

    List<double> heightArr = array
        .map((int value) => ((height - 150) * (value / MAX_SIZE) + 10))
        .toList();

    List<double> marginArr =
        indexArr.map((int value) => (barMargin + (division * value))).toList();

    Widget bar({@required double height, @required double width, Color color}) {
      return Bar(
        height: height,
        margin: width,
        barWidth: barWidth,
        animationSpeed: animationSpeed.toInt(),
        color: color,
      );
    }

    /// Generating the bars
    List<Widget> children = List<Widget>.generate(
        n,
        (int index) => bar(
              height: heightArr[index],
              width: marginArr[index],
              color: swapping
                  ? index == swapI
                      ? Colors.red
                      : index == swapJ
                          ? Colors.green
                          : null
                  : null,
            ));

    Widget dropDownButton = SortingDropdown(
      value: value,
      onChanged: (String value) {
        sortingProvider.changeSortingTypeSelection(
            sortingType: getSortingType(value: value));
      },
    );

    Widget button({@required String text, @required Function onPressed}) {
      return RoundedButton(
        text: text,
        onPressed: () async {
          await onPressed();
        },
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

    return BlocBuilder<ThemeBloc, ThemeMode>(
        builder: (BuildContext context, ThemeMode themeMode) {
      Widget icon = ThemeChangingIcon(themeMode: themeMode);
      String themeChangerToolTip = themeMode == ThemeMode.light
          ? "Change to Dark Theme"
          : "Change to Light Theme";

      return Material(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: dropDownButton,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: BackButton(
              color: Theme.of(context).iconTheme.color,
            ),
            actions: [
              IconButton(
                icon: icon,
                onPressed: isSorting
                    ? null
                    : () {
                        sortingProvider.reset();
                        themeBloc.changeTheme();
                      },
                tooltip: themeChangerToolTip,
              ),
            ],
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
    });
  }
}
