import 'package:flutter/material.dart';
import '../models/category.dart';
// import '../data/data.dart';
// import '../pages/meals_screen.dart';

// class CategoryProvider extends ChangeNotifier {
//   void _selectCategory(BuildContext context, Category category) {

//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (ctx) => MealsScreen(
//           meals: meal,
//           title: category.title,
//         ),
//       ),
//     );
//   }

//    for (final category in availableCategories)
//          CategoryCard(
//            category: category,
//            onSelectCategory: () {
//              _selectCategory(context, category);
//            },
//         )
// }

class CategoryCard extends StatelessWidget {
  const CategoryCard(
      {super.key, required this.category, required this.onSelectCategory});
  final Category category;
  final void Function() onSelectCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectCategory,
      child: Container(
        padding: const EdgeInsets.all(3),
        color: const Color.fromARGB(255, 0, 255, 140),
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image(
                image: AssetImage(category.image),
                fit: BoxFit.fill,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Text(
                category.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(2.0, 2.0),
                      blurRadius: 4.0,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
