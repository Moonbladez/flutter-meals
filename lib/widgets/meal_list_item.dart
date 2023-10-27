import 'package:flutter/material.dart';
import 'package:flutter_meals_app/models/models.dart';

class MealListItem extends StatelessWidget {
  const MealListItem({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(meal.imageUrl),
      title: Text(
        meal.title,
      ),
    );
  }
}
