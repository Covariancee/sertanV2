import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sertan/provider/meal_screen_provider.dart';
import 'package:sertan/models/meals.dart';
import 'package:sertan/widgets/meal_item.dart';

class MealsScreen extends StatefulWidget {
  const MealsScreen({
    required this.meals,
    this.title,
    super.key,
  });

  //
  final String? title;
  final List<Meal> meals;

  @override
  State<MealsScreen> createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return MealsController();
      },
      child: Consumer<MealsController>(
        builder: _buildBody,
      ),
    );
  }

  Widget _buildBody(
      BuildContext context, MealsController controller, Widget? child) {
    return Scaffold(
      body: SafeArea(
        child: _mealsList(context, controller),
      ),
    );
  }

  _mealsList(BuildContext context, MealsController controller) {
    final mealController = Provider.of<MealsController>(context);
    return Container(
      child: ListView.builder(
          itemCount: mealController.mealsList.length,
          itemBuilder: (context, index) => MealItem(
                meal: mealController.mealsList[index],
                onSelectMeal: (meal) {
                  mealController.selectedMeal(
                      context, mealController.mealsList[index]);
                },
              )),

      // TODO: aşağıyı controllerdan aldıgın mealslara göre düzenle
      //   return Container(
      // child: ListView.builder(
      // itemCount: controller.mealsList.length,
      //   itemBuilder: (context, index) =>
      //       MealItem(
      //         meal: mealsList[index],
      //         onSelectMeal: (meal) {
      //           selectMeal(context, meal);
      //         },
      //       ),
      // ),);
    );
  }
}
