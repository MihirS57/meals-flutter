import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id, title, imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem(
      {required this.id,
      required this.title,
      required this.imageUrl,
      required this.duration,
      required this.complexity,
      required this.affordability});

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetails.routeName, arguments: {
      'id': id,
      'title': title
    }).then((popScreenData) => print(
        popScreenData)); //then is only called when MealDetails is popped and returns to this screen
  }

  String get complexityText {
    if (complexity == Complexity.Simple) {
      return "Simple";
    } else if (complexity == Complexity.Challenging) {
      return "Challenging";
    } else {
      return "Hard";
    }
  }

  String get affordabilityText {
    if (affordability == Affordability.Affordable) {
      return "Affordable";
    } else if (affordability == Affordability.Pricey) {
      return "Pricey";
    } else {
      return "Luxurious";
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectMeal(context);
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(children: [
          Stack(
            children: [
              //ClipRRect forces a widget to take a shape
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: Image.network(
                  imageUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              // Positioned only works in a stack
              Positioned(
                bottom: 20,
                right: 10,
                child: Container(
                  width: 200,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.black54),
                  child: Text(
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 26,
                        color: Colors.white),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(Icons.schedule),
                    SizedBox(
                      width: 5,
                    ),
                    Text('$duration mins'),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.work),
                    SizedBox(
                      width: 5,
                    ),
                    Text('$complexityText'),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.attach_money),
                    SizedBox(
                      width: 5,
                    ),
                    Text('$affordabilityText'),
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
