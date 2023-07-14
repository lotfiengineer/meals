import 'package:flutter/material.dart';

// import 'package:riverpod/riverpod.dart';

import 'package:mohammad_meals/widgets/category_grid_item.dart';
import 'package:mohammad_meals/data/dummy_data.dart';
import 'package:mohammad_meals/screens/meals.dart';
import 'package:mohammad_meals/models/category.dart';
import 'package:mohammad_meals/models/meal.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
    required this.availableMeals,
  });

  final List<Meal> availableMeals;

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2.8 / 2, // ???
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ), // main axis is from top to bottom (It is like a column)
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelectCategory: () => _selectCategory(context, category),
          )

        // ...availableCategories
        //     .map((category) => CategoryGridItem(category: category))
        //     .toList()
      ],
    );
  }
}
