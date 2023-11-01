import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'meals_provider.dart';

const kIntialFilters = {
  FilterOptions.vegan: false,
  FilterOptions.vegetarian: false,
  FilterOptions.glutenFree: false,
  FilterOptions.lactoseFree: false,
};

enum FilterOptions {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersNotifier extends StateNotifier<Map<FilterOptions, bool>> {
  FiltersNotifier() : super(kIntialFilters);

  void setFilters(Map<FilterOptions, bool> filters) {
    state = filters;
  }

  void toggleFilter(FilterOptions filter, bool isActive) {
    state = {
      ...state,
      filter: isActive,
    };
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<FilterOptions, bool>>(
  (ref) => FiltersNotifier(),
);

final filteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final activeFilters = ref.watch(filtersProvider);
  return meals.where(
    (meal) {
      if (activeFilters[FilterOptions.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }

      if (activeFilters[FilterOptions.vegetarian]! && !meal.isVegetarian) {
        return false;
      }

      if (activeFilters[FilterOptions.vegan]! && !meal.isVegan) {
        return false;
      }

      if (activeFilters[FilterOptions.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }

      return true;
    },
  ).toList();
});
