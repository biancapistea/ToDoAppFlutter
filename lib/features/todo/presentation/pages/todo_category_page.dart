import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:to_do_app_flutter/features/todo/domain/entities/category.dart';
import 'package:to_do_app_flutter/features/todo/presentation/widgets/category_widget.dart';
import '../../domain/entities/category_enum.dart';

class ToDoCategoryPage extends StatefulWidget {
  const ToDoCategoryPage({super.key});

  @override
  State<ToDoCategoryPage> createState() => _ToDoCategoryPageState();
}

class _ToDoCategoryPageState extends State<ToDoCategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        height: 80.0,
        width: 80.0,
        child: FloatingActionButton(
          onPressed: () => _onFloatingAddToDoPressed(context),
          backgroundColor: Colors.blueAccent,
          shape: const CircleBorder(),
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
      appBar: _createAppBar(),
      body: _createBody(),
    );
  }

  _createAppBar() {
    return AppBar(
      leading: const Padding(
        padding: EdgeInsets.only(left: 20.0),
        child: Icon(
          Ionicons.menu_sharp,
          size: 50,
        ),
      ),
      backgroundColor: Colors.white,
      scrolledUnderElevation: 0.0,
    );
  }

  Widget _createBody() {
    List<CategoryEntity> categories = [
      const CategoryEntity(
          category: Category.all,
          img: 'assets/images/ic_todo.png',
          noOfTasks: 10),
      const CategoryEntity(
          category: Category.home,
          img: 'assets/images/ic_home2.png',
          noOfTasks: 10),
      const CategoryEntity(
          category: Category.art,
          img: 'assets/images/ic_art.png',
          noOfTasks: 10),
      const CategoryEntity(
          category: Category.shopping,
          img: 'assets/images/ic_shopping.png',
          noOfTasks: 10),
      const CategoryEntity(
          category: Category.work,
          img: 'assets/images/ic_work.png',
          noOfTasks: 10),
      const CategoryEntity(
          category: Category.music,
          img: 'assets/images/ic_music.png',
          noOfTasks: 10),
      const CategoryEntity(
          category: Category.study,
          img: 'assets/images/ic_study.png',
          noOfTasks: 10),
      const CategoryEntity(
          category: Category.airport,
          img: 'assets/images/ic_airport.png',
          noOfTasks: 10),
    ];

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Padding(
        padding: EdgeInsets.only(left: 20.0),
        child: Text(
          'Lists',
          style: TextStyle(
              color: Colors.black, fontSize: 40, fontWeight: FontWeight.bold),
        ),
      ),
      Expanded(
          child: GridView.builder(
        itemBuilder: (context, index) {
          return CategoryWidget(
            category: categories[index],
            //onArticlePressed: (article) => _onArticlePressed(context, article));
          );
        },
        itemCount: categories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // number of items in each row
        ),
      ))
    ]);
  }

  void _onCategoryPressed(BuildContext context, String category) {
    Navigator.pushNamed(context, '/ToDoList', arguments: category);
  }

  void _onFloatingAddToDoPressed(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pushNamed("/AddToDo");
  }
}
