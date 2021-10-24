import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*
    SliverGridDelegateWithMaxCrossAxisExtent is used to adjust characteristics of a grid
    */
    return /* Scaffold(
      appBar: AppBar(
        title: const Text('DeliMeal'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: 
      
      Getting rid of scaffold here because TabBar already provides one scaffold with an app bar
      */
        GridView(
      padding: EdgeInsets.all(10),
      children: DUMMY_CATEGORIES.map((category) {
        return CategoryItem(category.id, category.title, category.color);
      }).toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent:
              200, //width of each item, so if windows size=300, then one grid item and if 500 then 2
          childAspectRatio: 1.5, //length to breath ration
          mainAxisSpacing: 20, // both means spacing in rows and columns
          crossAxisSpacing: 20),
    );
  }
}
