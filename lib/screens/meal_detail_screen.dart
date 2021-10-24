import 'package:flutter/material.dart';
import 'package:meals/dummy_data.dart';

class MealDetails extends StatelessWidget {
  static String routeName = "/meal-details";

  @override
  Widget build(BuildContext context) {
    final mealArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final mealId = mealArgs['id'];
    final mealTitle = mealArgs['title'];
    final mealInstance = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    final imageUrl = mealInstance.imageUrl as String;
    return Scaffold(
      appBar: AppBar(
        title: Text('${mealTitle} Recipe'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                )),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Ingredients',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7)),
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                height: MediaQuery.of(context).size.width * 0.1,
                width: MediaQuery.of(context).size.width * 0.7,
                child: ListView.builder(
                  itemBuilder: (ctx, index) {
                    return Card(
                      color: Theme.of(context).accentColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(
                            '${index + 1}) ${mealInstance.ingredients[index]}'),
                      ),
                    );
                  },
                  itemCount: mealInstance.ingredients.length,
                )),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Steps',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7)),
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                height: MediaQuery.of(context).size.width * 0.1,
                width: MediaQuery.of(context).size.width * 0.7,
                child: ListView.builder(
                  itemBuilder: (ctx, index) => ListTile(
                    leading: CircleAvatar(
                      child: Text('# ${index + 1}'),
                    ),
                    title: Text(mealInstance.steps[index]),
                  ),
                  itemCount: mealInstance.steps.length,
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.done),
          onPressed: () {
            Navigator.of(context).pop(mealId);
          }),
    );
  }
}
