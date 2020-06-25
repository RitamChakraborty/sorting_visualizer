import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

class SortingProvider extends ChangeNotifier {
  final int _size;
  final List<int> _arr;

  String _selectedSortingType = "Bubble Sort";

  SortingProvider({@required int size, @required List<int> arr})
      : this._size = size,
        this._arr = arr,
        assert(size != null),
        assert(arr != null);

  int get size => _size;

  List<int> get arr => _arr;

  String get selectedSortingType => _selectedSortingType;

  void changeSortingTypeSelection({@required String sortingType}) {
    this._selectedSortingType = sortingType;
    notifyListeners();
  }

  Future<void> sort() async {
    switch (_selectedSortingType) {
      case 'Bubble Sort':
        await _bubbleSort();
        break;
      case 'Insertion Sort':
        _insertionSort();
        break;
      case 'Selection Sort':
        _selectionSort();
        break;
      case 'Merge Sort':
        _mergeSort();
        break;
      case 'Quick Sort':
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
