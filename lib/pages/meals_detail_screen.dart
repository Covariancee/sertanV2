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
  DateTime date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.meal.title),
      ),
      body: Stack(children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(
            widget.meal.image,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(color: Color.fromARGB(180, 0, 0, 0)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(widget.meal.image),
                const SizedBox(
                  height: 16,
                ),
                Column(
                  children: [
                    Text(
                      widget.meal.title,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      widget.meal.detail,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: Icon(
                    Icons.favorite,
                    size: 50,
                  ),
                ),
                
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
