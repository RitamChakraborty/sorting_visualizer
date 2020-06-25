import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:sortingvisualizer/data/constants.dart';

class SortingProvider extends ChangeNotifier {
  final int _size;
  final List<int> _arr;
  final List<int> _backUp;

  SortingType _selectedSortingType = SortingType.BUBBLE_SORT;

  SortingProvider({@required int size, @required List<int> arr})
      : this._size = size,
        this._arr = arr,
        this._backUp = new List<int>.from(arr),
        assert(size != null),
        assert(arr != null);

  int get size => _size;

  List<int> get arr => _arr;

  SortingType get selectedSortingType => _selectedSortingType;

  void changeSortingTypeSelection({@required SortingType sortingType}) {
    this._selectedSortingType = sortingType;
    notifyListeners();
  }

  void reset() {
    _arr.clear();
    _arr.addAll(_backUp);
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
        if (arr[i] > arr[j]) {
          int temp = arr[i];
          arr[i] = arr[j];
          arr[j] = temp;

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
