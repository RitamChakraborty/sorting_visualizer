import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:sortingvisualizer/data/constants.dart';

class SortingProvider extends ChangeNotifier {
  final int _size;
  final List<int> _arr;
  final List<int> _backupArray;
  final List<int> _indexArr;
  double _animationSpeed = 0;
  bool _stopSort = false;
  int _swapI = 0;
  int _swapJ = 0;

  SortingType _selectedSortingType = SortingType.BUBBLE_SORT;

  SortingProvider({@required int size, @required List<int> array})
      : this._size = size,
        this._arr = array,
        this._backupArray = List<int>.from(array),
        this._indexArr = List<int>.generate(size, (int index) => index),
        assert(size != null),
        assert(array != null);

  set animationSpeed(double speed) {
    _animationSpeed = speed;
    notifyListeners();
  }

  int get size => _size;

  List<int> get array => _backupArray;

  List<int> get indexArr => _indexArr;

  SortingType get selectedSortingType => _selectedSortingType;

  double get animationSpeed => _animationSpeed;

  int get swapI => _swapI;

  int get swapJ => _swapJ;

  Future<dynamic> get _delay => Future.delayed(Duration(
        milliseconds:
            _animationSpeed.toInt() == 0 ? 0 : _animationSpeed.toInt() + 100,
      ));

  void changeSortingTypeSelection({@required SortingType sortingType}) {
    this._selectedSortingType = sortingType;
    notifyListeners();
  }

  void reset() {
    /// Stop sorting
    _stopSort = true;
    _swapI = 0;
    _swapJ = 0;
    notifyListeners();

    /// Reset the main array which is being sorted
    _arr.clear();
    _arr.addAll(_backupArray);

    /// Reset the index array by which bars are placed
    _indexArr.clear();
    _indexArr.addAll(List<int>.generate(size, (int index) => index));

    notifyListeners();
  }

  Future<void> sort() {
    _stopSort = false;

    switch (_selectedSortingType) {
      case SortingType.BUBBLE_SORT:
        return _bubbleSort();
      case SortingType.INSERTION_SORT:
        return _insertionSort();
      case SortingType.SELECTION_SORT:
        return _selectionSort();
      case SortingType.MERGE_SORT:
        return _mergeSort(0, _size - 1);
      case SortingType.QUICK_SORT:
        return _quickSort();
    }

    return null;
  }

  Future<void> _bubbleSort() async {
    for (int i = 0; i < _size; ++i) {
      if (_stopSort) {
        return;
      }

      for (int j = (i + 1); j < _size; ++j) {
        if (_stopSort) {
          return;
        }

        if (_arr[i] > _arr[j]) {
          int _indexI = _backupArray.indexOf(_arr[i]);
          int _indexJ = _backupArray.indexOf(_arr[j]);
          _indexArr[_indexI] = j;
          _indexArr[_indexJ] = i;
          _swapI = _indexI;
          _swapJ = _indexJ;

          int temp = _arr[i];
          _arr[i] = _arr[j];
          _arr[j] = temp;

          notifyListeners();
          await _delay;
        }
      }

      await _delay;
    }

    _swapI = 0;
    _swapJ = 0;
    notifyListeners();
  }

  Future<void> _insertionSort() async {
    for (int i = 0; i < _size; ++i) {
      if (_stopSort) {
        return;
      }

      int temp = _arr[i];
      int indexI = _backupArray.indexOf(_arr[i]);
      int j = i - 1;

      while (j >= 0 && _arr[j] > temp) {
        if (_stopSort) {
          return;
        }

        int indexJ = _backupArray.indexOf(_arr[j]);
        _indexArr[indexJ] = j + 1;

        _arr[j + 1] = _arr[j];
        --j;

        notifyListeners();
        await _delay;
      }

      _indexArr[indexI] = j + 1;
      _arr[j + 1] = temp;

      notifyListeners();
      await _delay;
    }

    notifyListeners();
  }

  Future<void> _selectionSort() async {
    for (int i = 0; i < _size; ++i) {
      if (_stopSort) {
        return;
      }

      int smallest = _arr[i];
      int smallestIndex = i;

      for (int j = (i + 1); j < _size; ++j) {
        if (_stopSort) {
          return;
        }

        if (_arr[j] < smallest) {
          smallestIndex = j;
          smallest = _arr[j];
        }
      }

      int _indexI = _backupArray.indexOf(_arr[i]);
      int _indexJ = _backupArray.indexOf(_arr[smallestIndex]);
      _indexArr[_indexI] = smallestIndex;
      _indexArr[_indexJ] = i;
      _swapI = _indexI;
      _swapJ = _indexJ;

      int temp = _arr[i];
      _arr[i] = _arr[smallestIndex];
      _arr[smallestIndex] = temp;

      notifyListeners();
      await _delay;
    }

    _swapI = 0;
    _swapJ = 0;
    notifyListeners();
  }

  Future<void> _mergeSort(int start, int end) async {
    if (_stopSort) {
      return;
    }

    if (start < end) {
      int mid = (start + end) ~/ 2;

      await _mergeSort(start, mid);
      await _mergeSort(mid + 1, end);

      await _merge(start, mid, end);
    }

    _swapI = 0;
    _swapJ = 0;
    notifyListeners();
  }

  Future<void> _merge(int start, int mid, int end) async {
    if (_stopSort) {
      return;
    }

    int m = (mid - start) + 1;
    int n = (end - mid);

    List<int> arr1 = List(m);
    List<int> arr2 = List(n);

    int i, j, k = start;

    for (i = 0; i < m; ++i) {
      int _index = _backupArray.indexOf(_arr[k]);
      _swapI = _index;
      _indexArr[_index] = start;

      arr1[i] = _arr[k++];

      await _delay;
      notifyListeners();
    }

    for (j = 0; j < n; ++j) {
      int _index = _backupArray.indexOf(_arr[k]);
      _swapJ = _index;
      _indexArr[_index] = end;

      arr2[j] = _arr[k++];

      await _delay;
      notifyListeners();
    }

    i = j = 0;
    k = start;

    while (i != m && j != n) {
      if (_stopSort) {
        return;
      }

      int _index;

      if (arr1[i] < arr2[j]) {
        _index = _backupArray.indexOf(arr1[i]);
        _swapI = _index;
        _indexArr[_index] = k;

        _arr[k++] = arr1[i++];
      } else {
        _index = _backupArray.indexOf(arr2[j]);
        _swapJ = _index;
        _indexArr[_index] = k;

        _arr[k++] = arr2[j++];
      }

      await _delay;
      notifyListeners();
    }

    while (i != m) {
      if (_stopSort) {
        return;
      }

      int _index = _backupArray.indexOf(arr1[i]);
      _swapI = _index;
      _indexArr[_index] = k;

      _arr[k++] = arr1[i++];

      await _delay;
      notifyListeners();
    }

    while (j != n) {
      if (_stopSort) {
        return;
      }

      int _index = _backupArray.indexOf(arr2[j]);
      _swapJ = _index;
      _indexArr[_index] = k;

      _arr[k++] = arr2[j++];

      await _delay;
      notifyListeners();
    }

    _swapI = 0;
    _swapJ = 0;
  }

  Future<void> _quickSort() async {}
}
