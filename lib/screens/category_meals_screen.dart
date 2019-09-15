import 'package:flutter/material.dart';

import '../dummy_data.dart.dart';
import '../widgtes/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {

  static const  categoryMealsScreen_Route ='/category-meals-screen';
//  final String categoryId ;
//  final String categoryTitle;

//  CategoryMealsScreen(this.categoryId,this.categoryTitle);



  @override
  Widget build(BuildContext context) {

    final routesArgs=ModalRoute.of(context).settings.arguments as Map<String ,String>;
    final String categoryId=routesArgs["id"];
    final String categoryTitle=routesArgs['title'];

    final categorylist =DUMMY_MEALS.where((meals){
      return meals.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle),
      ),
      body: ListView.builder(
          itemCount: categorylist.length,
          itemBuilder: (context,index){
        return MealItem(
          id: categorylist[index].id,
          title: categorylist[index].title,
        imgUrl: categorylist[index].imageUrl,
        duration: categorylist[index].duration,
        affordability: categorylist[index].affordability,
        complexity: categorylist[index].complexity,);
      }),
    );
  }
}
