import 'package:flutter/material.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routename = '/meal-detail';
  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text('$mealId'),
      ),
      body: Center(
        child: Text('THE MEAL -$mealId!'),
      ),
    );
  }
}
