import 'package:flutter/material.dart';

import 'package:mohammad_meals/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({
    super.key,
    required this.meal,
    required this.onToggleFavorite,
  });

  final Meal meal;
  final void Function(Meal meal) onToggleFavorite;

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

    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (final step in steps)
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Text(
                  step,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              onToggleFavorite(meal);
            },
            icon: Icon(Icons.star),
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                meal.imageUrl,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            pinned: true,
            expandedHeight: MediaQuery.of(context).size.height * 0.305,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const SizedBox(height: 8),
                const Text(
                  "Ingredients",
                  textAlign: TextAlign.center,
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
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    color: Color.fromARGB(255, 254, 175, 150),
                  ),
                ),
                stepsList
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Column(
  //       children: [
  // Image.network(
  //   meal.imageUrl,
  //   height: 300,
  //   width: double.infinity,
  //   fit: BoxFit.cover,
  // ),
  // const SizedBox(height: 8),
  // const Text(
  //   "Ingredients",
  //   style: TextStyle(
  //     fontSize: 22,
  //     color: Color.fromARGB(255, 255, 157, 127),
  //   ),
  // ),
  // const SizedBox(height: 14),
  // ingredientsList,
  // const SizedBox(height: 25),
  // const Text(
  //   "Steps",
  //   style: TextStyle(
  //     fontSize: 22,
  //     color: Color.fromARGB(255, 254, 175, 150),
  //   ),
  // ),
  // stepsList
  //       ],
  //     ),
}
