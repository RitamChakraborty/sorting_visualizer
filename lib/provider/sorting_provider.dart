import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:sortingvisualizer/data/constants.dart';

class SortingProvider extends ChangeNotifier {
  final int _size;
  final List<int> _arr;

  SortingTypes _selectedSortingType = SortingTypes.BUBBLE_SORT;

  SortingProvider({@required int size, @required List<int> arr})
      : this._size = size,
        this._arr = arr,
        assert(size != null),
        assert(arr != null);

  int get size => _size;

  List<int> get arr => _arr;

  SortingTypes get selectedSortingType => _selectedSortingType;

  void changeSortingTypeSelection({@required SortingTypes sortingType}) {
    this._selectedSortingType = sortingType;
    notifyListeners();
  }

  Future<void> sort() async {
    switch (_selectedSortingType) {
      case SortingTypes.BUBBLE_SORT:
        _bubbleSort();
        break;
      case SortingTypes.INSERTION_SORT:
        _insertionSort();
        break;
      case SortingTypes.SELECTION_SORT:
        _selectionSort();
        break;
      case SortingTypes.MERGE_SORT:
        _mergeSort();
        break;
      case SortingTypes.QUICK_SORT:
        _quickSort();
        break;
    }
  }

  void _bubbleSort() async {
    for (int i = 0; i < _size; ++i) {
      for (int j = (i + 1); j < _size; ++j) {
        if (arr[i] > arr[j]) {
          int temp = arr[i];
          arr[i] = arr[j];
          arr[j] = temp;

          await Future.delayed((Duration(seconds: 1)));
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
