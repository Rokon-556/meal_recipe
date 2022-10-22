import 'package:daily_meals/model/meal.dart';
import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeal;
  const FavoriteScreen(this.favoriteMeal, {Key? key}) : super(key: key);

 // const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   if(favoriteMeal.isEmpty){
     return const Center(
      child: Text('No Favorite Found- Try to add'),
    );
   }else{
    return ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id:favoriteMeal[index].id,
              title:favoriteMeal[index].title,
              imageUrl:favoriteMeal[index].imageUrl,
              duration:favoriteMeal[index].duration,
              complexity:favoriteMeal[index].complexity,
              affordability:favoriteMeal[index].affordability,);
        },
        itemCount:favoriteMeal.length,
      );
   }
  }
}