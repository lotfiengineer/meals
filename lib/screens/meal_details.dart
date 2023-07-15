import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mohammad_meals/models/meal.dart';
import 'package:mohammad_meals/Providers/favorites_provider.dart';

class MealDetailsScreen extends ConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMeals = ref.watch(favoriteMealsProvider);

    final isFavorite = favoriteMeals.contains(meal);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              final wasAdded = ref
                  .read(favoriteMealsProvider.notifier)
                  .toggleMealFavoriteStatus(meal);

              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: const Duration(seconds: 3),
                  content: Text(
                    wasAdded ? "Meal added as a favorite." : "Meal removed.",
                  ),
                ),
              );
            },
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return RotationTransition(
                  turns: Tween<double>(
                    begin: 0.75,
                    end: 1.0,
                  ).animate(animation),
                  child: child,
                );
              },
              child: Icon(
                isFavorite ? Icons.star : Icons.star_border,
                key: ValueKey(isFavorite),
              ),
            ),
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: meal.id,
                child: Image.network(
                  meal.imageUrl,
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
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
