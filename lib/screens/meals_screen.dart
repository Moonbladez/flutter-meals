import 'package:flutter/material.dart';
import 'package:flutter_meals_app/models/models.dart';
import 'package:flutter_meals_app/screens/screens.dart';
import 'package:flutter_meals_app/widgets/widgets.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meal,
  });

  final String? title;
  final List<Meal> meal;

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealDetailScreen(
          meal: meal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemBuilder: (ctx, index) {
        return MealListItem(
          meal: meal[index],
          onSelectMeal: (meal) {
            selectMeal(context, meal);
          },
        );
      },
      itemCount: meal.length,
    );

    if (meal.isEmpty) {
      content = const EmptyCategories();
    }

    if (title == null) {
      return content;
    }

    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: content,
      ),
    );
  }
}
