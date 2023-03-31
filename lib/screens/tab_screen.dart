import 'package:flutter/material.dart';
import '../screens/favourite_screen.dart';
import '../screens/categories_screen.dart';

class TabScreen extends StatefulWidget {
  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Map<String, Object>> _pages = [
    {'page': CategoriesScreen(), 'title': 'Categories'},
    {'page': FavouriteScreen(), 'title': 'Your Favorite'},
  ];

  int _selctedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selctedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selctedPageIndex]['title']),
      ),
      body: _pages[_selctedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,

        currentIndex: _selctedPageIndex,
        //type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            label: ('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: ('Favourites'),
          )
        ],
      ),
    );
  }
}
