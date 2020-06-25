import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:sortingvisualizer/data/constants.dart';

class SortingProvider extends ChangeNotifier {
  final int _size;
  final List<int> _arr = [];

  String _selectedSortingType = "Bubble Sort";

  SortingProvider(this._size) {
    for (int i = 0; i < size; ++i) {
      int random = Random().nextInt(MAX_SIZE);

      _arr.add(random);
    }
  }

  int get size => _size;

  List<int> get arr => _arr;

  String get selectedSortingType => _selectedSortingType;

  void changeSortingTypeSelection({@required String sortingType}) {
    this._selectedSortingType = sortingType;
    notifyListeners();
  }
}
