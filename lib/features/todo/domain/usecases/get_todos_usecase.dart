import 'package:to_do_app_flutter/features/todo/domain/entities/todo_entity.dart';
import 'package:to_do_app_flutter/features/todo/domain/repository/todo_repository.dart';
import 'package:to_do_app_flutter/features/todo/domain/usecases/usecase.dart';

class GetToDosUseCase implements UseCase<void, void> {
  final ToDoRepository _toDoRepository;

  GetToDosUseCase(this._toDoRepository);

  @override
  Future<List<ToDoEntity>> call({void param}) {
    return _toDoRepository.getToDos();
  }
}
