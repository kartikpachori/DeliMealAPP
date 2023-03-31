import 'package:flutter_complete_guide/screens/meal_details_screen.dart';
import 'package:flutter_complete_guide/screens/tab_screen.dart';

import './screens/category_meals_screen.dart';

import './screens/categories_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetailsScreen.routename: (ctx) => MealDetailsScreen(),
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
