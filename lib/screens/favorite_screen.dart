import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../components/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  

  final List<Meal> favoriteMeals;

  const FavoriteScreen(this.favoriteMeals, {super.key});

  @override
  Widget build(BuildContext context) {
    if(favoriteMeals.isEmpty) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: Text('Nenhuma refeição selecionada!'),
      ),
    );
    } else {
      return Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: favoriteMeals.length,
          itemBuilder: (ctx, index) {
            return MealItem(favoriteMeals[index]);
          } ),
      );
    }
  }
}