import 'package:flutter/material.dart';
import 'package:flutter_meals_app/providers/providers.dart';
import 'package:flutter_meals_app/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filters"),
      ),
      body: Column(
        children: [
          FilterSwitchTile(
            title: "Gluten-Free",
            subtitle: "Only include gluten-free meals",
            value: activeFilters[FilterOptions.glutenFree]!,
            onChanged: (value) {
              ref.read(filtersProvider.notifier).toggleFilter(
                    FilterOptions.glutenFree,
                    value,
                  );
            },
          ),
          FilterSwitchTile(
            title: "Lactose-Free",
            subtitle: "Only include lactose-free meals",
            value: activeFilters[FilterOptions.lactoseFree]!,
            onChanged: (value) {
              ref.read(filtersProvider.notifier).toggleFilter(
                    FilterOptions.lactoseFree,
                    value,
                  );
            },
          ),
          FilterSwitchTile(
            title: "Vegetarian",
            subtitle: "Only include vegetarain meals",
            value: activeFilters[FilterOptions.vegetarian]!,
            onChanged: (value) {
              ref.read(filtersProvider.notifier).toggleFilter(
                    FilterOptions.vegetarian,
                    value,
                  );
            },
          ),
          FilterSwitchTile(
            title: "Vegan",
            subtitle: "Only include vegan meals",
            value: activeFilters[FilterOptions.vegan]!,
            onChanged: (value) {
              ref.read(filtersProvider.notifier).toggleFilter(
                    FilterOptions.vegan,
                    value,
                  );
            },
          ),
        ],
      ),
    );
  }
}
