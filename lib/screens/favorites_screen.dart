import 'package:flutter/material.dart';
import '../widgtes/meal_item.dart';

import '../model/meals.dart';


class FavoritesScreen extends StatelessWidget {
  List<Meal> favorites;

  FavoritesScreen(this.favorites);

  @override
  Widget build(BuildContext context) {
    if(favorites.isEmpty){
       return Text('Your have no favorites yet');
    }else{
      return ListView.builder(
          itemCount: favorites.length,
          itemBuilder: (context,index){
            return MealItem(
              id: favorites[index].id,
              title: favorites[index].title,
              imgUrl: favorites[index].imageUrl,
              duration: favorites[index].duration,
              affordability: favorites[index].affordability,
              complexity: favorites[index].complexity,
             );
          });

    }
  }
}
