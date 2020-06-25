import 'package:flutter/widgets.dart';

class SortingProvider extends ChangeNotifier {
  int _size;

  set size(int size) {
    this._size = size;
    notifyListeners();
  }

  int get size => _size;
}
