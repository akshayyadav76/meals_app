import 'package:flutter/material.dart';

import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {


  final String id;
  final String titlel;
  final Color color;

  CategoryItem(this.id,this.titlel,this.color);
  
  void toNext(BuildContext context){
    Navigator.of(context).pushNamed(CategoryMealsScreen.categoryMealsScreen_Route ,arguments: {
      'id': id,
      'title':titlel
    } );
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(18),
      onTap: ()=>toNext(context),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(titlel,style: Theme.of(context).textTheme.title,)),
        decoration: BoxDecoration(
          gradient: LinearGradient(
         colors: [color.withOpacity(0.5),color],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        ),
         borderRadius: BorderRadius.circular(18),
        ),
      ),
    );
  }
}
