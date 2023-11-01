import 'package:flutter_riverpod/flutter_riverpod.dart';

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
