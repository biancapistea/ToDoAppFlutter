import 'package:floor/floor.dart';
import 'package:to_do_app_flutter/features/todo/data/models/todo.dart';

@dao
abstract class ToDoDao {
  @Insert()
  Future<void> insertTodo(ToDoModel todo);

  @delete
  Future<void> deleteArticle(ToDoModel todo);

  @update
  Future<void> editTodo(ToDoModel todo);

  @Query('SELECT * FROM todo')
  Future<List<ToDoModel>> getTodos();

  @Query('SELECT * FROM todo WHERE category = :category')
  Future<List<ToDoModel>> getTodosFilteredByCategory(String category);
}
