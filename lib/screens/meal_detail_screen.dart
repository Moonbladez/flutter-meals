import 'package:flutter/material.dart';
import 'package:flutter_meals_app/models/meal.dart';
import 'package:flutter_meals_app/widgets/meal_detail_list.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({Key? key, required this.meal}) : super(key: key);

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: meal.id,
              child: SizedBox(
                height: 300,
                width: double.infinity,
                child: Image.network(meal.imageUrl, fit: BoxFit.cover),
              ),
            ),
            MealDetailList(items: meal.ingredients, title: "Ingredients"),
            Divider(
              color: Theme.of(context).colorScheme.secondaryContainer,
              indent: 32,
              endIndent: 32,
            ),
            MealDetailList(items: meal.steps, title: "Recipe Steps"),
          ],
        ),
      ),
    );
  }
}
