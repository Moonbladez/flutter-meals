import 'package:flutter/material.dart';
import 'package:flutter_meals_app/main.dart';
import 'package:flutter_meals_app/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(12),
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                category.color.withOpacity(0.7),
                category.color,
              ],
            ),
          ),
          child: Text(
            category.title,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: kThemeData.onBackground,
                ),
          ),
        ),
      ),
    );
  }
}
