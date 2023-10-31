import 'package:flutter/material.dart';
import 'package:flutter_meals_app/widgets/widgets.dart';

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
            FilterSwitchTile(
              title: "Gluten-Free",
              subtitle: "Only include gluten-free meals",
              value: _isGlutenFree,
              onChanged: (value) {
                setState(
                  () {
                    _isGlutenFree = value;
                  },
                );
              },
            ),
            FilterSwitchTile(
              title: "Lactose-Free",
              subtitle: "Only include lactose-free meals",
              value: _isLactoseFree,
              onChanged: (value) {
                setState(() {
                  _isLactoseFree = value;
                });
              },
            ),
            FilterSwitchTile(
              title: "Vegetarian",
              subtitle: "Only include vegetarain meals",
              value: _isVegetarian,
              onChanged: (value) {
                setState(() {
                  _isVegetarian = value;
                });
              },
            ),
            FilterSwitchTile(
              title: "Vegan",
              subtitle: "Only include vegan meals",
              value: _isVegan,
              onChanged: (value) {
                setState(() {
                  _isVegan = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
