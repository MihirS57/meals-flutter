import 'package:flutter/material.dart';
import 'package:meals/screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  CategoryItem(this.id, this.title, this.color);

  void selectCategory(BuildContext context) {
    /* Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return CategoryMealsScreen(title);
    })); */
    Navigator.of(context)
        .pushNamed(CategoryMealsScreen.routeName, //or use '/category-means'
            arguments: {'id': id, 'title': title}); // go to routes in main.dart
  }

  @override
  Widget build(BuildContext context) {
    //Inkwell is GestureDetector Widget plus ripple effect
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(7),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Text(
          title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color.withOpacity(0.8), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(7)),
      ),
    );
  }
}
