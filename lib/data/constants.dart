import 'package:flutter/material.dart';

const int MAX_SIZE = 1000;
const int MAX_ANIMATION_SPEED = 2000;

enum SortingType {
  BUBBLE_SORT,
  INSERTION_SORT,
  SELECTION_SORT,
  MERGE_SORT,
  QUICK_SORT,
}

// ignore: non_constant_identifier_names
final ShapeBorder SHAPE = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(10.0),
);
