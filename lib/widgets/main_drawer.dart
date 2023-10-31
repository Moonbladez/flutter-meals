import 'package:flutter/material.dart';
import 'package:flutter_meals_app/widgets/widgets.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});

  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.food_bank_outlined,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  size: 50,
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  "Cooking Up!",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          DrawerListItem(
            icon: Icons.restaurant,
            text: "Meals",
            onSelect: () {
              onSelectScreen("meals");
            },
          ),
          DrawerListItem(
            icon: Icons.settings,
            text: "Filters",
            onSelect: () {
              onSelectScreen("filters");
            },
          ),
        ],
      ),
    );
  }
}
