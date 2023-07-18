import 'package:flutter/material.dart';
import '../controller/category_controller.dart';
import '../data/data.dart';
import '../provider/category_provider.dart';

class CategoryPageView extends StatefulWidget {
  const CategoryPageView({super.key});
  @override
  State<CategoryPageView> createState() => _CategoryPageViewState();
}

class _CategoryPageViewState extends State<CategoryPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _buildBody(context),
      ),
    );
  }
}

_buildBody(BuildContext context) {
  return GridView.builder(
    padding: const EdgeInsets.all(20),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20),
    itemCount: availableCategories.length,
    itemBuilder: (BuildContext context, int index) {
      return CategoryCard(
        category: availableCategories[index],
        onSelectCategory: () {
          selectCategory(context, availableCategories[index]);
        },
      );
    },
  );
}
