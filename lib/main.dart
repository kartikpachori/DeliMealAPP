import 'package:flutter_complete_guide/dummy_data.dart';
import 'package:flutter_complete_guide/screens/filters_screen.dart';
import 'package:flutter_complete_guide/screens/meal_details_screen.dart';
import 'package:flutter_complete_guide/screens/tab_screen.dart';
import './screens/filters_screen.dart';
import './models/meal.dart';

import './screens/category_meals_screen.dart';

import './screens/categories_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _fliters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _fliters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_fliters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_fliters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_fliters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_fliters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromARGB(255, 195, 247, 244),
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ))),
      //home: CategoriesScreen(),
      routes: {
        '/': (ctx) => TabScreen(),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailsScreen.routename: (ctx) => MealDetailsScreen(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_fliters, _setFilters),
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
      },

      onUnknownRoute: ((settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      }),
    );
  }
}
