import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:sortingvisualizer/data/constants.dart';

class SortingProvider extends ChangeNotifier {
  final int _size;
  final List<int> _arr;
  final List<int> _backupArray;
  final List<int> _indexArr;

  SortingType _selectedSortingType = SortingType.BUBBLE_SORT;

  SortingProvider({@required int size, @required List<int> array})
      : this._size = size,
        this._arr = array,
        this._backupArray = List<int>.from(array),
        this._indexArr = List<int>.generate(size, (int index) => index),
        assert(size != null),
        assert(array != null);

  int get size => _size;

  List<int> get array => _backupArray;

  List<int> get indexArr => _indexArr;

  SortingType get selectedSortingType => _selectedSortingType;

  void changeSortingTypeSelection({@required SortingType sortingType}) {
    this._selectedSortingType = sortingType;
    notifyListeners();
  }

  void reset() {
    /// Reset the main array which is being sorted
    _arr.clear();
    _arr.addAll(_backupArray);

    /// Reset the index array by which bars are placed
    _indexArr.clear();
    _indexArr.addAll(List<int>.generate(size, (int index) => index));

    notifyListeners();
  }

  Future<void> sort() {
    switch (_selectedSortingType) {
      case SortingType.BUBBLE_SORT:
        return _bubbleSort();
      case SortingType.INSERTION_SORT:
        return _insertionSort();
      case SortingType.SELECTION_SORT:
        return _selectionSort();
      case SortingType.MERGE_SORT:
        return _mergeSort();
        break;
      case SortingType.QUICK_SORT:
        return _quickSort();
    }

    return null;
  }

  Future<void> _bubbleSort() async {
    for (int i = 0; i < _size; ++i) {
      for (int j = (i + 1); j < _size; ++j) {
        if (_arr[i] > _arr[j]) {
          int temp = _arr[i];
          _arr[i] = _arr[j];
          _arr[j] = temp;

          int _indexI = _backupArray.indexOf(_arr[i]);
          int _indexJ = _backupArray.indexOf(_arr[j]);
          _indexArr[_indexI] = i;
          _indexArr[_indexJ] = j;
          notifyListeners();

          await Future.delayed(Duration(milliseconds: 600));
        }
      }

      await Future.delayed(Duration(milliseconds: 100));
    }
  }

  Future<void> _insertionSort() async {}

  Future<void> _selectionSort() async {}

  Future<void> _mergeSort() async {}

  Future<void> _quickSort() async {}
}
