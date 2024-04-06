import 'package:to_do_app_flutter/features/todo/domain/entities/todo_entity.dart';
import 'package:to_do_app_flutter/features/todo/domain/repository/todo_repository.dart';
import 'package:to_do_app_flutter/features/todo/domain/usecases/usecase.dart';

class SaveToDoUseCase implements UseCase<void, ToDoEntity> {
  final ToDoRepository _toDoRepository;

  SaveToDoUseCase(this._toDoRepository);

  @override
  Future<void> call({ToDoEntity? param}) {
    return _toDoRepository.saveToDo(param!);
  }
}
