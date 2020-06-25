import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:sortingvisualizer/data/constants.dart';

class SortingProvider extends ChangeNotifier {
  final int _size;

  SortingProvider({@required int size})
      : this._size = size,
        assert(size != null);

  int get size => _size;

  List<int> get arr {
    List<int> arr = [];
    print(_size);

    for (int i = 0; i < size; ++i) {
      int random = Random().nextInt(MAX_SIZE);

      arr.add(random);
    }

    return arr;
  }
}
