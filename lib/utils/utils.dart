import 'package:meta/meta.dart';
import 'package:sortingvisualizer/data/constants.dart';

String getSortingTypeString({@required SortingType sortingTypes}) {
  switch (sortingTypes) {
    case SortingType.BUBBLE_SORT:
      return "Bubble Sort";
    case SortingType.INSERTION_SORT:
      return "Insertion Sort";
    case SortingType.SELECTION_SORT:
      return "Selection Sort";
    case SortingType.MERGE_SORT:
      return "Merge Sort";
    case SortingType.QUICK_SORT:
      return "Quick Sort";
  }

  return null;
}

SortingType getSortingType({@required String value}) {
  switch (value) {
    case 'Bubble Sort':
      return SortingType.BUBBLE_SORT;
    case 'Insertion Sort':
      return SortingType.INSERTION_SORT;
    case 'Selection Sort':
      return SortingType.SELECTION_SORT;
    case 'Merge Sort':
      return SortingType.MERGE_SORT;
    case 'Quick Sort':
      return SortingType.QUICK_SORT;
  }

  return null;
}
