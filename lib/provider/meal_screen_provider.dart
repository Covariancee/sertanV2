import 'package:flutter/material.dart';
import 'package:sertan/data/data.dart';
import 'package:sertan/models/meals.dart';
import 'package:sertan/pages/meals_detail_screen.dart';

class MealsController extends ChangeNotifier {
  MealsController() {
    init();
  }

  List<Meal> _mealsList = [];

  List<Meal> get mealsList => _mealsList;

  set mealsList(List<Meal> value) {
    _mealsList = value;
  }

  void selectedMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(meal: meal),
      ),
    );
  }

  void init() {
    _mealsList =
        dummyMeals.where((meal) => meal.categories.contains(meal.id)).toList();
    // for (Meal meal in dummyMeals) {
    //   dummyMeals.add(meal);
  }
//TODO: category list sayfasından buraya id gönder
// TODO: bu id ile meals datasını dön ve sadece bu id leri gelen mealsları al
// TODO: bu mealsları mealsList e ekle.

// mealsList = filteredMeals;
}