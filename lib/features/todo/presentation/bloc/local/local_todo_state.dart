import 'package:equatable/equatable.dart';
import 'package:to_do_app_flutter/features/todo/domain/entities/todo_entity.dart';


abstract class LocalToDoState extends Equatable {
  final List<ToDoEntity>? todos;

  const LocalToDoState({this.todos});

  @override
  List<Object> get props => [todos!];
}

class LocalTodosLoading extends LocalToDoState {
  const LocalTodosLoading();
}

class LocalTodosDone extends LocalToDoState {
  const LocalTodosDone(List<ToDoEntity> todos) : super(todos: todos);
}