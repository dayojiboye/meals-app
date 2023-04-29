import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meals.dart';

// For editing the state i.e Actions in Redux
class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]); // pass initial data

  // add methods to edit/manipulate data
  // NOTE: must not mutate or edit state in memory. It has to be done in an IMMUTABLE way!!!
  bool toggleMealFavoriteStatus(Meal meal) {
    final bool mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      state = state
          .where((m) => m.id != meal.id)
          .toList(); // if meal is a favorite, remove meal from favorite meals data by filtering
      return false;
    } else {
      state = [
        ...state,
        meal
      ]; // if meal is not a favorite, add meal to existing favorite meals data
      return true;
    }
  }
}

// For retrieving the state i.e Reducers in Redux
final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});
