import 'package:flutter/material.dart';
import 'package:sertan/data/data.dart';

import '../models/category.dart';
import '../pages/meals_screen.dart';

void selectCategory(BuildContext context, Category category) {
  final filteredMeals = dummyMeals
      .where((meal) => meal.categories.contains(category.id))
      .toList();

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (ctx) => MealsScreen(
        meals: filteredMeals,
        title: category.title,
      ),
    ),
  );
}
