import 'package:flutter/material.dart';
import 'package:flutter_meals_app/main.dart';
import 'package:flutter_meals_app/models/meal.dart';
import 'package:flutter_meals_app/screens/meal_detail_screen.dart';
import 'package:flutter_meals_app/widgets/meal_list_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meal});

  final String title;
  final List<Meal> meal;

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealDetailScreen(meal: meal),
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
      content = Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.warning,
              size: 50,
              color: kThemeData.error,
            ),
            Text(
              'No meals found, please add some!',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
          ],
        ),
      );
    }

    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: content,
      ),
    );
  }
}
