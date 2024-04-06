import 'package:flutter/material.dart';
import 'package:to_do_app_flutter/core/constants/constants.dart';
import 'package:to_do_app_flutter/features/todo/domain/entities/category.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryEntity? category;
  final void Function(CategoryEntity category)? onCategoryPressed;

  const CategoryWidget({
    super.key,
    this.category,
    this.onCategoryPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _onTap,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          // padding: const EdgeInsetsDirectional.only(end: 14, bottom: 7, top: 7),
          height: MediaQuery.of(context).size.width / 2.2,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ]),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(category!.img),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child: Text(category!.category.name.capitalize(), style:const TextStyle(fontSize: 16)  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text("${category!.noOfTasks} tasks"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTap() {
    if (onCategoryPressed != null) {
      onCategoryPressed!(category!);
    }
  }
}
