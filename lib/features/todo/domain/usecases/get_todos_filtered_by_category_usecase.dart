import 'package:to_do_app_flutter/features/todo/domain/usecases/usecase.dart';

import '../entities/todo_entity.dart';
import '../repository/todo_repository.dart';

class GetToDosBasedOnCategoryUseCase implements UseCase<void, String> {
  final ToDoRepository _toDoRepository;

  GetToDosBasedOnCategoryUseCase(this._toDoRepository);

  @override
  Future<List<ToDoEntity>> call({String? param}) {
    return _toDoRepository.getToDosFilteredByCategory(param!);
  }
}
