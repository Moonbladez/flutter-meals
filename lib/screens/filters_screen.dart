import 'package:flutter/material.dart';
import 'package:flutter_meals_app/providers/providers.dart';
import 'package:flutter_meals_app/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({super.key});

  @override
  ConsumerState<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  bool _isGlutenFree = false;
  bool _isLactoseFree = false;
  bool _isVegetarian = false;
  bool _isVegan = false;

  @override
  void initState() {
    super.initState();
    final activeFilters = ref.read(filtersProvider);
    _isGlutenFree = activeFilters[FilterOptions.glutenFree]!;
    _isLactoseFree = activeFilters[FilterOptions.lactoseFree]!;
    _isVegetarian = activeFilters[FilterOptions.vegetarian]!;
    _isVegan = activeFilters[FilterOptions.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filters"),
      ),
      body: WillPopScope(
        onWillPop: () async {
          ref.read(filtersProvider.notifier).setFilters(
            {
              FilterOptions.glutenFree: _isGlutenFree,
              FilterOptions.lactoseFree: _isLactoseFree,
              FilterOptions.vegetarian: _isVegetarian,
              FilterOptions.vegan: _isVegan,
            },
          );

          return true;
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
