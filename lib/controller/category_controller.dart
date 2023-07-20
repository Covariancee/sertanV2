// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:sertan/data/data.dart';
// import 'package:sertan/models/category.dart';
// import 'package:sertan/provider/category_provider.dart';

// import '../widgets/category_card.dart';

// class ControlCategories extends StatefulWidget {
//   const ControlCategories({super.key});

//   @override
//   State<ControlCategories> createState() => _ControlCategoriesState();
// }

// class _ControlCategoriesState extends State<ControlCategories> {
  

//   @override
//   Widget build(BuildContext context) {
//     final categoryProvider = Provider.of<CategoryController>(context);
//     return GridView.builder(
//       padding: const EdgeInsets.all(20),
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           childAspectRatio: 1,
//           crossAxisSpacing: 20,
//           mainAxisSpacing: 20),
//       itemCount: categoryProvider.itemCount,
//       itemBuilder: (BuildContext context, int index) {
//         return CategoryCard(
//           category: asd,
//           onSelectCategory: () {
//             categoryProvider.selectCategory(context, asd);
//           },
//         );
//       },
//     );
//   }
// }
