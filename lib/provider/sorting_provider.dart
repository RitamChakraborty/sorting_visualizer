import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:sortingvisualizer/data/constants.dart';

class SortingProvider extends ChangeNotifier {
  final int _size;
  final List<int> _arr;
  final List<int> _backupArray;
  final List<int> _indexArr;
  double _animationSpeed = 0;
  bool _stopSort = true;
  int _swapI = -1;
  int _swapJ = -1;

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

  bool get isSorting => !_stopSort;

  Future<dynamic> get _delay => Future.delayed(Duration(
        milliseconds:
            _animationSpeed.toInt() == 0 ? 0 : _animationSpeed.toInt() + 100,
      ));

  void changeSortingTypeSelection({@required SortingType sortingType}) {
    this._selectedSortingType = sortingType;
    reset();
  }

  void reset() {
    /// Stop sorting
    _stopSort = true;
    _swapI = -1;
    _swapJ = -1;
    notifyListeners();

    /// Reset the main array which is being sorted
    _arr.clear();
    _arr.addAll(_backupArray);

    /// Reset the index array by which bars are placed
    _indexArr.clear();
    _indexArr.addAll(List<int>.generate(size, (int index) => index));

    notifyListeners();
  }

  Future<void> sort() async {
    _stopSort = false;

    switch (_selectedSortingType) {
      case SortingType.BUBBLE_SORT:
        await _bubbleSort();
        break;
      case SortingType.INSERTION_SORT:
        await _insertionSort();
        break;
      case SortingType.SELECTION_SORT:
        await _selectionSort();
        break;
      case SortingType.MERGE_SORT:
        await _mergeSort(0, _size - 1);
        break;
      case SortingType.QUICK_SORT:
        await _quickSort(0, _size - 1);
        break;
    }

    _stopSort = true;
    notifyListeners();
  }

  Future<void> _swap(int i, int j) async {
    if (_stopSort) {
      return;
    }

    int _indexI = _backupArray.indexOf(_arr[i]);
    int _indexJ = _backupArray.indexOf(_arr[j]);
    _swapI = _indexI;
    _swapJ = _indexJ;
    _indexArr[_indexI] = j;
    _indexArr[_indexJ] = i;

    int temp = _arr[i];
    _arr[i] = _arr[j];
    _arr[j] = temp;

    notifyListeners();
    await _delay;
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
          await _swap(i, j);
        }
      }

      await _delay;
    }

    _swapI = -1;
    _swapJ = -1;
    notifyListeners();
  }

  Future<void> _insertionSort() async {
    for (int i = 0; i < _size; ++i) {
      if (_stopSort) {
        return;
      }

      int temp = _arr[i];
      int indexI = _backupArray.indexOf(_arr[i]);
      _swapI = indexI;
      int j = i - 1;

      while (j >= 0 && _arr[j] > temp) {
        if (_stopSort) {
          return;
        }

        int indexJ = _backupArray.indexOf(_arr[j]);
        _swapJ = indexJ;
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

    _swapI = -1;
    _swapJ = -1;

    notifyListeners();
  }

  Future<void> _selectionSort() async {
    for (int i = 0; i < _size; ++i) {
      if (_stopSort) {
        return;
      }

      int smallest = _arr[i];
      int smallestIndex = i;
      int _indexI = _backupArray.indexOf(smallest);
      _swapI = _indexI;

      await _delay;
      notifyListeners();

      for (int j = (i + 1); j < _size; ++j) {
        if (_stopSort) {
          return;
        }

        if (_arr[j] < smallest) {
          smallestIndex = j;
          smallest = _arr[j];

          int _indexJ = _backupArray.indexOf(smallest);
          _swapJ = _indexJ;

          await _delay;
          notifyListeners();
        }
      }

      await _swap(i, smallestIndex);
    }

    _swapI = -1;
    _swapJ = -1;
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

    _swapI = -1;
    _swapJ = -1;
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
      arr1[i] = _arr[k++];
    }

    for (j = 0; j < n; ++j) {
      arr2[j] = _arr[k++];
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

    _swapI = -1;
    _swapJ = -1;
  }

  Future<void> _quickSort(int start, int end) async {
    if (_stopSort) {
      return;
    }

    if (start < end) {
      int pIndex = await _partition(start, end);

      await _quickSort(start, pIndex - 1);
      await _quickSort(pIndex + 1, end);
    }
  }

  Future<int> _partition(int start, int end) async {
    int pivot = _arr[end];
    int pIndex = start;

    for (int i = start; i < end; ++i) {
      if (_stopSort) {
        break;
      }

      if (_arr[i] <= pivot) {
        await _swap(i, pIndex);
        ++pIndex;
      }
    }

    await _swap(pIndex, end);

    _swapI = -1;
    _swapJ = -1;
    notifyListeners();

    return pIndex;
  }
}
