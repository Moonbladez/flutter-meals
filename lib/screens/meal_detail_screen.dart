import 'package:flutter/material.dart';
import 'package:flutter_meals_app/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: Hero(
        tag: meal.id,
        child: Image.network(
          fit: BoxFit.cover,
          height: 300,
          meal.imageUrl,
          width: double.infinity,
        ),
      ),
    );
  }
}
