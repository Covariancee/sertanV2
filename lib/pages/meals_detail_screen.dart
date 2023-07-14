import 'package:flutter/material.dart';
import '../models/meals.dart';

class MealDetailsScreen extends StatefulWidget {
  const MealDetailsScreen({
    super.key,
    required this.meal,
  });
  final Meal meal;
  @override
  State<MealDetailsScreen> createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favori'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_basket), label: 'Satın Al')
          ],
        ),
        appBar: AppBar(
          title: Text(widget.meal.title),
        ),
        body: Column(
          children: [
            Hero(
              tag: widget.meal.id,
              child: Image.asset(widget.meal.image,
                  height: 300, width: double.infinity, fit: BoxFit.cover),
            ),
            const SizedBox(
              height: 14,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.meal.title,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    widget.meal.detail,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
