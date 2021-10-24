import 'package:flutter/material.dart';
import 'package:meals/dummy_data.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/filters_screen.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/screens/tabs_screen.dart';
import 'screens/category_meals_screen.dart';
import './models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'vegan': false,
    'vegetarian': false,
    'lactose': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals.where((meal) {
        if (!meal.isGlutenFree && _filters['gluten']!) {
          return false;
        }
        if (!meal.isVegan && _filters['vegan']!) {
          return false;
        }
        if (!meal.isVegetarian && _filters['vegetarian']!) {
          return false;
        }
        if (!meal.isLactoseFree && _filters['lactose']!) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'DeliMeals',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
        ),
        home: TabScreen(),
        routes: {
          // use route '/' for home route i.e instead of the above home property
          CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(
              _availableMeals) // or just use '/category-means',
          ,
          // go to category meals screen
          MealDetails.routeName: (ctx) => MealDetails(),
          FiltersScreen.routeName: (ctx) => FiltersScreen(_setFilters)
        },
        // used when route is not mentioned in this then you set a default route
        onGenerateRoute: (settings) {
          print(settings.arguments);
          return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
        },
        // if no routes mentioned here, this is called
        onUnknownRoute: (settings) {
          print(settings.arguments);
          return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
        });
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
