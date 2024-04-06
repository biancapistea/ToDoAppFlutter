import 'package:equatable/equatable.dart';
import 'package:to_do_app_flutter/features/todo/domain/entities/todo_entity.dart';

abstract class LocalTodoEvent extends Equatable {
  final ToDoEntity? todo;

  const LocalTodoEvent({this.todo});

  @override
  List<Object> get props => [todo!];
}

class GetToDos extends LocalTodoEvent {
  const GetToDos();
}

class DeleteToDo extends LocalTodoEvent {
  const DeleteToDo(ToDoEntity todo) : super(todo: todo);
}

class SaveToDo extends LocalTodoEvent {
  const SaveToDo(ToDoEntity todo) : super(todo: todo);
}

class EditToDo extends LocalTodoEvent {
  const EditToDo(ToDoEntity todo) : super(todo: todo);
}
