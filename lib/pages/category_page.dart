import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/category_provider.dart';
import '../widgets/category_card.dart';

class CategoryPageView extends StatefulWidget {
  const CategoryPageView({super.key});
  @override
  State<CategoryPageView> createState() => _CategoryPageViewState();
}

class _CategoryPageViewState extends State<CategoryPageView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        var model = CategoryController();
        model.init();
        return CategoryController();
      },
      child: Consumer<CategoryController>(builder: _buildBody),
    );
  }
}

Widget _buildBody(
    BuildContext context, CategoryController value, Widget? child) {
  final categoryProvider = Provider.of<CategoryController>(context);
  return Scaffold(
    body: SafeArea(
      child: GridView.builder(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemCount: categoryProvider.itemCount,
        itemBuilder: (BuildContext context, int index) {
          return CategoryCard(
            category: categoryProvider.asd[index],
            onSelectCategory: () {
              categoryProvider.selectCategory(
                  context, categoryProvider.asd[index]);
            },
          );
        },
      ),
    ),
  );
}
