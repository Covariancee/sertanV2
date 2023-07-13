import 'package:provider/provider.dart';
import 'package:sertan/models/category.dart';
import 'package:sertan/models/meals.dart';
import '../data/data.dart';
import 'package:flutter/material.dart';

class ItemList extends ChangeNotifier {
  List<Meal> _items = [];

  void addItem(String categoryID) {
    for (var i = 0; i < dummyMeals.length; i++) {
      if (dummyMeals[i].categories == categoryID) {
        _items.add(dummyMeals[i]);
        print(_items);
      }
    }
    notifyListeners();
  }
}
