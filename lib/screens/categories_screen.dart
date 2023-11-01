import 'package:flutter/material.dart';
import 'package:flutter_meals_app/data/dummy_data.dart';
import 'package:flutter_meals_app/models/models.dart';
import 'package:flutter_meals_app/screens/screens.dart';
import 'package:flutter_meals_app/widgets/widgets.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.availableMeals});

  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animateController;
  @override
  void initState() {
    super.initState();
    _animateController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );

    _animateController.forward();
  }

  @override
  void dispose() {
    _animateController.dispose();
    super.dispose();
  }

  void _selectCategory(BuildContext context, Category category) {
    final List<Meal> filteredMeals = widget.availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealsScreen(
          title: category.title,
          meal: filteredMeals,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animateController,
      builder: (BuildContext context, Widget? child) => SlideTransition(
        position: _animateController.drive(
          Tween<Offset>(
            begin: const Offset(0, 0.4),
            end: const Offset(0, 0),
          ).chain(
            CurveTween(curve: Curves.easeIn),
          ),
        ),
        child: child,
      ),
      child: GridView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: availableCategories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 3 / 2,
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (context, index) {
          return CategoryGridItem(
            category: availableCategories[index],
            onSelectCategory: () {
              _selectCategory(
                context,
                availableCategories[index],
              );
            },
          );
        },
      ),
    );
  }
}
