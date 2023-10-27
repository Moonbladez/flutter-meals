import 'package:flutter/material.dart';
import 'package:flutter_meals_app/main.dart';
import 'package:flutter_meals_app/models/models.dart';
import 'package:flutter_meals_app/widgets/widgets.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meal});

  final String title;
  final List<Meal> meal;

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemBuilder: (ctx, index) {
        return MealListItem(meal: meal[index]);
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
