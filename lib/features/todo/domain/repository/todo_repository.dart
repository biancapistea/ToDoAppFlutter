import 'package:to_do_app_flutter/features/todo/domain/entities/todo_entity.dart';

abstract class ToDoRepository {
  Future<List<ToDoEntity>> getToDos();

  Future<void> saveToDo(ToDoEntity todo);

  Future<void> editToDo(ToDoEntity todo);

  Future<void> deleteToDo(ToDoEntity todo);

  Future<List<ToDoEntity>> getToDosFilteredByCategory(String category);
}
