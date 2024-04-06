import 'package:equatable/equatable.dart';

import 'category_enum.dart';

class ToDoEntity extends Equatable {
  final int? id;
  final Category? category;
  final String? title;
  final String? description;
  final String? date;
  final String? publishedAt;

  const ToDoEntity(
      {this.id,
      this.title,
      this.description,
      this.publishedAt,
      this.date,
      this.category});

  @override
  List<Object?> get props {
    return [
      id,
      category,
      title,
      description,
      date,
      publishedAt,
    ];
  }
}