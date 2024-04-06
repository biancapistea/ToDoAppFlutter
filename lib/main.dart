import 'package:flutter/material.dart';
import 'package:to_do_app_flutter/features/todo/presentation/pages/todo_category_page.dart';

import 'config/routes/routes.dart';
import 'config/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const ToDoCategoryPage(),
      onGenerateRoute: AppRoutes.onGenerateRoutes,
      theme: theme(),
    );
  }
}
