import 'package:flutter/material.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/favourites_screen.dart';
import 'package:meals/widgets/main_drawer.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Map<String, Object>> _pages = [
    {'page': CategoriesScreen(), 'title': 'Categories'},
    {'page': FavouritesScreen(), 'title': 'Favourites'}
  ];
  int _selectedScreen = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedScreen]['title'] as String),
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white12,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex:
            _selectedScreen, //it is to ensure that the selected page icon is colored
        onTap: (pageIndex) {
          _selectPage(pageIndex);
        },
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favourites',
          )
        ],
      ),
      body: _pages[_selectedScreen]['page'] as Widget,
    );
  }
}
