import 'package:flutter/material.dart';

import 'package:mohammad_meals/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({
    super.key,
    required this.meal,
  });

  final Meal meal;

  Widget get ingredientsList {
    final List<String> ingredients = meal.ingredients;

    return Column(
      children: [
        for (final ingr in ingredients)
          Text(
            ingr,
            style: const TextStyle(
              color: Colors.white,
            ),
          )
      ],
    );
  }

  Widget get stepsList {
    final List<String> steps = meal.steps;

    return Column(
      children: [
        for (final step in steps)
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 4,
              ),
              child: Text(
                step,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: Column(
        children: [
          Image.network(
            meal.imageUrl,
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 8),
          const Text(
            "Ingredients",
            style: TextStyle(
              fontSize: 22,
              color: Color.fromARGB(255, 255, 157, 127),
            ),
          ),
          const SizedBox(height: 14),
          ingredientsList,
          const SizedBox(height: 25),
          const Text(
            "Steps",
            style: TextStyle(
              fontSize: 22,
              color: Color.fromARGB(255, 254, 175, 150),
            ),
          ),
          stepsList
        ],
      ),
    );
  }
}
