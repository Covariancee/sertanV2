import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sertan/controller/category_controller.dart';
import '../models/category.dart';
import '../provider/category_provider.dart';
import '../data/data.dart';
import '../widgets/category_card.dart';

class CategoryPageView extends StatefulWidget {
  const CategoryPageView({super.key});
  @override
  State<CategoryPageView> createState() => _CategoryPageViewState();
}

class _CategoryPageViewState extends State<CategoryPageView> {
  // late Category asd;
  // @override
  // void initState() {
  //   for (Category category in availableCategories) {
  //     asd = category;
  //     print(asd);
  //   }
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        var model = CategoryController();
        model.init();
        return CategoryController();
      },
      child: Consumer<CategoryController>(
        builder: (context, value, child) => Scaffold(
          body: SafeArea(
            child: _buildBody(context),
          ),
        ),
      ),
    );
  }
}

_buildBody(BuildContext context) {
  final categoryProvider = Provider.of<CategoryController>(context);
  return GridView.builder(
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
          categoryProvider.selectCategory(context, categoryProvider.asd[index]);
        },
      );
    },
  );
}
