import 'package:meta/meta.dart';
import 'package:sortingvisualizer/data/constants.dart';

String getSortingTypeString({@required SortingTypes sortingTypes}) {
  switch (sortingTypes) {
    case SortingTypes.BUBBLE_SORT:
      return "Bubble Sort";
    case SortingTypes.INSERTION_SORT:
      return "Insertion Sort";
    case SortingTypes.SELECTION_SORT:
      return "Selection Sort";
    case SortingTypes.MERGE_SORT:
      return "Merge Sort";
    case SortingTypes.QUICK_SORT:
      return "Quick Sort";
  }

  return null;
}

SortingTypes getSortingType({@required String value}) {
  switch (value) {
    case 'Bubble Sort':
      return SortingTypes.BUBBLE_SORT;
    case 'Insertion Sort':
      return SortingTypes.INSERTION_SORT;
    case 'Selection Sort':
      return SortingTypes.SELECTION_SORT;
    case 'Merge Sort':
      return SortingTypes.MERGE_SORT;
    case 'Quick Sort':
      return SortingTypes.QUICK_SORT;
  }

  return null;
}
