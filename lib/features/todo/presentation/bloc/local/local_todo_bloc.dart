import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app_flutter/features/todo/domain/usecases/delete_todo_usecase.dart';
import 'package:to_do_app_flutter/features/todo/domain/usecases/edit_todo_usecase.dart';
import 'package:to_do_app_flutter/features/todo/domain/usecases/save_todo_usecase.dart';
import '../../../domain/usecases/get_todos_usecase.dart';
import 'local_todo_event.dart';
import 'local_todo_state.dart';

class LocalToDoBloc extends Bloc<LocalTodoEvent, LocalToDoState> {
  final GetToDosUseCase _getToDosUseCase;
  final SaveToDoUseCase _saveToDoUseCase;
  final DeleteToDoUseCase _deleteToDoUseCase;
  final EditToDoUseCase _editToDoUseCase;

  LocalToDoBloc(this._getToDosUseCase, this._saveToDoUseCase,
      this._deleteToDoUseCase, this._editToDoUseCase)
      : super(const LocalTodosLoading()) {
    on<GetToDos>(onGetTodos);
    on<SaveToDo>(onSaveArticle);
    on<DeleteToDo>(onDeleteArticle);
    on<EditToDo>(onEditToDo);
  }

  void onGetTodos(
      GetToDos event, Emitter<LocalToDoState> emit) async {
    final todos = await _getToDosUseCase();
    emit(LocalTodosDone(todos));
  }

  void onDeleteArticle(
      DeleteToDo deleteToDo, Emitter<LocalToDoState> emit) async {
    await _deleteToDoUseCase(param: deleteToDo.todo);
    final todos = await _getToDosUseCase();
    emit(LocalTodosDone(todos));
  }

  void onEditToDo(
      EditToDo editToDo, Emitter<LocalToDoState> emit) async {
    await _editToDoUseCase(param: editToDo.todo);
    final todos = await _getToDosUseCase();
    emit(LocalTodosDone(todos));
  }

  void onSaveArticle(
      SaveToDo saveToDo, Emitter<LocalToDoState> emit) async {
    await _saveToDoUseCase(param: saveToDo.todo);
    final todos = await _getToDosUseCase();
    emit(LocalTodosDone(todos));
  }
}
