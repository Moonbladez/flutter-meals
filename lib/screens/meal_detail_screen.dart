import 'package:flutter/material.dart';
import 'package:flutter_meals_app/models/models.dart';
import 'package:flutter_meals_app/providers/providers.dart';
import 'package:flutter_meals_app/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MealDetailScreen extends ConsumerWidget {
  const MealDetailScreen({Key? key, required this.meal}) : super(key: key);

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Meal> favouriteMeals = ref.watch(favouriteMealsProvider);
    final bool isFavouriteMeal = favouriteMeals.contains(meal);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              final isFavouriteMeal = ref
                  .read(favouriteMealsProvider.notifier)
                  .toggleFavouriteMealStatus(meal);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    isFavouriteMeal
                        ? "Added to favourites"
                        : "Removed from favourites",
                  ),
                ),
              );
            },
            icon: Icon(
              isFavouriteMeal ? Icons.favorite : Icons.favorite_border_outlined,
            ),
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
