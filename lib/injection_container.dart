import 'package:get_it/get_it.dart';
import 'package:to_do_app_flutter/features/todo/data/repositories/todo_repository_impl.dart';
import 'package:to_do_app_flutter/features/todo/domain/repository/todo_repository.dart';
import 'package:to_do_app_flutter/features/todo/domain/usecases/delete_todo_usecase.dart';
import 'package:to_do_app_flutter/features/todo/domain/usecases/edit_todo_usecase.dart';
import 'package:to_do_app_flutter/features/todo/domain/usecases/get_todos_usecase.dart';
import 'package:dio/dio.dart';
import 'package:to_do_app_flutter/features/todo/domain/usecases/save_todo_usecase.dart';
import 'package:to_do_app_flutter/features/todo/presentation/bloc/local/local_todo_bloc.dart';

import 'features/todo/data/data_sources/local/app_database.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDatabase>(database);

  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies

  sl.registerSingleton<ToDoRepository>(ToDoRepositoryImpl(sl()));

  //UseCases
  sl.registerSingleton<GetToDosUseCase>(GetToDosUseCase(sl()));

  sl.registerSingleton<EditToDoUseCase>(EditToDoUseCase(sl()));

  sl.registerSingleton<SaveToDoUseCase>(SaveToDoUseCase(sl()));

  sl.registerSingleton<DeleteToDoUseCase>(DeleteToDoUseCase(sl()));

  //Blocs
  sl.registerFactory<LocalToDoBloc>(
      () => LocalToDoBloc(sl(), sl(), sl(), sl()));
}
