import 'package:flutter/material.dart';
import 'package:flutter_meals_app/models/models.dart';
import 'package:flutter_meals_app/widgets/widgets.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen(
      {Key? key, required this.meal, required this.onToggleFavourite})
      : super(key: key);

  final Meal meal;
  final void Function(Meal meal) onToggleFavourite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              onToggleFavourite(meal);
            },
            icon: const Icon(Icons.star_border),
          ),
        ],
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
