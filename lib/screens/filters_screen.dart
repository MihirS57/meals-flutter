import 'package:flutter/material.dart';
import 'package:meals/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static String routeName = '/filters-screen';
  final Function saveFilter;
  FiltersScreen(this.saveFilter);
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool glutenFree = false,
      veganFree = false,
      vegetarianFree = false,
      lactoseFree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filters'),
          actions: [
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                Map<String, bool> filters = {
                  'gluten': glutenFree,
                  'vegan': veganFree,
                  'vegetarian': vegetarianFree,
                  'lactose': lactoseFree,
                };
                widget.saveFilter(filters);
              },
            )
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  'Add filters',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  SwitchListTile(
                      title: Text('Only Gluten Free'),
                      subtitle: Text('Show only gluten free meals'),
                      value: glutenFree,
                      onChanged: (value) {
                        setState(() {
                          glutenFree = value;
                        });
                      }),
                  SwitchListTile(
                      title: Text('Only Vegan'),
                      subtitle: Text('Show only vegan meals'),
                      value: veganFree,
                      onChanged: (value) {
                        setState(() {
                          veganFree = value;
                        });
                      }),
                  SwitchListTile(
                      title: Text('Only lactose Free'),
                      subtitle: Text('Show only lactose free meals'),
                      value: lactoseFree,
                      onChanged: (value) {
                        setState(() {
                          lactoseFree = value;
                        });
                      }),
                  SwitchListTile(
                      title: Text('Only Vegetarian Free'),
                      subtitle: Text('Show only Vegetarian meals'),
                      value: vegetarianFree,
                      onChanged: (value) {
                        setState(() {
                          vegetarianFree = value;
                        });
                      })
                ],
              ),
            )
          ],
        ));
  }
}
