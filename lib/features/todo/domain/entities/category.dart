import 'package:flutter/cupertino.dart';
import 'category_enum.dart';

class CategoryEntity {
  final Category category;
  final String img;
  final int noOfTasks;

  const CategoryEntity({required this.category, required this.img, required this.noOfTasks});
}
