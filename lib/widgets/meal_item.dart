import 'package:flutter/material.dart';
import '../models/meals.dart';
import 'meal_trait.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.onSelectMeal});
  final Meal meal;
  final void Function(Meal meal) onSelectMeal;


  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          onSelectMeal(meal);
        },
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              child: FadeInImage(
                  placeholder: const AssetImage("assets/kTransparen.png"),
                  fit: BoxFit.fill,
                  image: AssetImage(meal.image)),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black54,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 44, vertical: 6),
                  child: Column(children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealTrait(
                            icon: Icons.schedule,
                            label: ' ${meal.duration} min'),
                        const SizedBox(
                          width: 15,
                        ),
                        MealTrait(
                            icon: Icons.attach_money, label: meal.price + "₺"),
                      ],
                    )
                  ]),
                ))
          ],
        ),
      ),
    );
  }
}
