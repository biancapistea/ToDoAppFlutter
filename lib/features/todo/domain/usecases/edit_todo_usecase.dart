import 'package:to_do_app_flutter/features/todo/domain/usecases/usecase.dart';

import '../entities/todo_entity.dart';
import '../repository/todo_repository.dart';

class EditToDoUseCase implements UseCase<void, ToDoEntity> {
  final ToDoRepository _toDoRepository;

  EditToDoUseCase(this._toDoRepository);

  @override
  Future<void> call({ToDoEntity? param}) {
    return _toDoRepository.editToDo(param!);
  }
}
