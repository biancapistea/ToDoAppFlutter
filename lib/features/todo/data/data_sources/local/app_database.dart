
import 'package:floor/floor.dart';
import 'package:to_do_app_flutter/features/todo/data/data_sources/local/todo_dao.dart';
import 'package:to_do_app_flutter/features/todo/data/models/todo.dart';
part 'app_database.g.dart';

@Database(version: 1, entities: [ToDoModel])
abstract class AppDatabase extends FloorDatabase {
  ToDoDao get todoDao;
}