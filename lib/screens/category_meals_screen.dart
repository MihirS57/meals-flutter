import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item.dart';

import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  /* final String category;

  CategoryMealsScreen(this.category); */
  static String routeName = '/category-means';
  List<Meal> availableItems;
  CategoryMealsScreen(this.availableItems);
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final category = args['title'];
    final categoryId = args['id'];
    final filteredRecipies = availableItems.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text('${category} Recipies'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
                id: filteredRecipies[index].id,
                title: filteredRecipies[index].title,
                imageUrl: filteredRecipies[index].imageUrl,
                duration: filteredRecipies[index].duration,
                complexity: filteredRecipies[index].complexity,
                affordability: filteredRecipies[index].affordability);
          },
          itemCount: filteredRecipies.length,
        ));
  }
}
