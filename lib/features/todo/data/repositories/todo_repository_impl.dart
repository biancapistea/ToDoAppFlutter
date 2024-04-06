import 'package:to_do_app_flutter/features/todo/data/data_sources/local/app_database.dart';
import 'package:to_do_app_flutter/features/todo/data/models/todo.dart';
import 'package:to_do_app_flutter/features/todo/domain/entities/todo_entity.dart';

import '../../domain/repository/todo_repository.dart';

class ToDoRepositoryImpl extends ToDoRepository {
  final AppDatabase _appDatabase;

  ToDoRepositoryImpl(this._appDatabase);

  @override
  Future<void> deleteToDo(ToDoEntity todo) {
    return _appDatabase.todoDao.deleteArticle(ToDoModel.fromEntity(todo));
  }

  @override
  Future<void> editToDo(ToDoEntity todo) {
    return _appDatabase.todoDao.editTodo(ToDoModel.fromEntity(todo));
  }

  @override
  Future<List<ToDoEntity>> getToDos() {
    return _appDatabase.todoDao.getTodos();
  }

  @override
  Future<void> saveToDo(ToDoEntity todo) {
    return _appDatabase.todoDao.insertTodo(ToDoModel.fromEntity(todo));
  }

  @override
  Future<List<ToDoEntity>> getToDosFilteredByCategory(String category) {
    return _appDatabase.todoDao.getTodosFilteredByCategory(category);
  }
}
