import 'package:flutter/material.dart';

enum FilterOptions {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});

  final Map<FilterOptions, bool> currentFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isGlutenFree = false;
  bool _isLactoseFree = false;
  bool _isVegetarian = false;
  bool _isVegan = false;

  @override
  void initState() {
    super.initState();

    _isGlutenFree = widget.currentFilters[FilterOptions.glutenFree]!;
    _isLactoseFree = widget.currentFilters[FilterOptions.lactoseFree]!;
    _isVegetarian = widget.currentFilters[FilterOptions.vegetarian]!;
    _isVegan = widget.currentFilters[FilterOptions.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filters"),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop(
            {
              FilterOptions.glutenFree: _isGlutenFree,
              FilterOptions.lactoseFree: _isLactoseFree,
              FilterOptions.vegetarian: _isVegetarian,
              FilterOptions.vegan: _isVegan,
            },
          );
          return false;
        },
        child: Column(
          children: [
            // TODO:move to single widget
            SwitchListTile(
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(
                left: 20,
              ),
              onChanged: (value) {
                setState(() {
                  _isGlutenFree = value;
                });
              },
              subtitle: Text(
                "Only include gluten-free meals",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              title: Text(
                "Gluten-Free",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              value: _isGlutenFree,
            ),
            SwitchListTile(
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(
                left: 20,
              ),
              onChanged: (value) {
                setState(() {
                  _isLactoseFree = value;
                });
              },
              subtitle: Text(
                "Only include lactose-free meals",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              title: Text(
                "Lactose-Free",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              value: _isLactoseFree,
            ),
            SwitchListTile(
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(
                left: 20,
              ),
              onChanged: (value) {
                setState(() {
                  _isVegetarian = value;
                });
              },
              subtitle: Text(
                "Only include vegetarain meals",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              title: Text(
                "Vegatarian",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              value: _isVegetarian,
            ),
            SwitchListTile(
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(
                left: 20,
              ),
              onChanged: (value) {
                setState(() {
                  _isVegan = value;
                });
              },
              subtitle: Text(
                "Only include vegan meals",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              title: Text(
                "Vegan",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              value: _isVegan,
            ),
          ],
        ),
      ),
    );
  }
}
