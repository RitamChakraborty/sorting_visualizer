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
        this._backupArray = new List<int>.from(array),
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

  void sort() {
    switch (_selectedSortingType) {
      case SortingType.BUBBLE_SORT:
        _bubbleSort();
        break;
      case SortingType.INSERTION_SORT:
        _insertionSort();
        break;
      case SortingType.SELECTION_SORT:
        _selectionSort();
        break;
      case SortingType.MERGE_SORT:
        _mergeSort();
        break;
      case SortingType.QUICK_SORT:
        _quickSort();
        break;
    }
  }

  void _bubbleSort() {
    for (int i = 0; i < _size; ++i) {
      for (int j = (i + 1); j < _size; ++j) {
        if (_arr[i] > _arr[j]) {
          int temp = _arr[i];
          _arr[i] = _arr[j];
          _arr[j] = temp;

          temp = _indexArr[i];
          _indexArr[i] = _indexArr[j];
          _indexArr[j] = temp;

          notifyListeners();
        }
      }
    }
  }

  void _insertionSort() {}

  void _selectionSort() {}

  void _mergeSort() {}

  void _quickSort() {}
}
