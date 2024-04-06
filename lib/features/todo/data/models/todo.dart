import 'package:floor/floor.dart';

import '../../domain/entities/todo_entity.dart';

@Entity(tableName: 'todo', primaryKeys: ['id'])
class ToDoModel extends ToDoEntity {
  const ToDoModel({
    super.id,
    super.category,
    super.title,
    super.description,
    super.date,
    super.publishedAt,
  });

  factory ToDoModel.fromEntity(ToDoEntity entity) {
    return ToDoModel(
        id: entity.id,
        title: entity.title,
        publishedAt: entity.publishedAt,
        description: entity.description,
        date: entity.date,
        category: entity.category);
  }
}
