import 'package:flutter/material.dart';
import 'package:to_do_app_flutter/features/todo/presentation/pages/add_todo.dart';
import 'package:to_do_app_flutter/features/todo/presentation/pages/todo_category_page.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const ToDoCategoryPage());

      case '/AddToDo':
        return _materialRoute(const AddToDo());

      default:
        return _materialRoute(const ToDoCategoryPage());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
