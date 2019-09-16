import 'package:flutter/material.dart';

import '../dummy_data.dart.dart';
import '../widgtes/meal_item.dart';
import '../model/meals.dart';

class CategoryMealsScreen extends StatefulWidget {
  List ItemData;
  CategoryMealsScreen(this.ItemData);



  static const  categoryMealsScreen_Route ='/category-meals-screen';

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {

  String categoryTitle;
  List<Meal>displeyMeals;
  var _loadedIntData=false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if(!_loadedIntData) {
      final routesArgs = ModalRoute
          .of(context)
          .settings
          .arguments as Map<String, String>;
      final String categoryId = routesArgs["id"];
      categoryTitle = routesArgs['title'];

      displeyMeals = widget.ItemData.where((meals) {
        return meals.categories.contains(categoryId);
      }).toList();
      _loadedIntData =true;
    }
    super.didChangeDependencies();
  }


  void deleteMeal(String mealId){
    setState(() {
      displeyMeals.removeWhere((meals)=>meals.id ==mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle),
      ),
      body: ListView.builder(
          itemCount: displeyMeals.length,
          itemBuilder: (context,index){
        return MealItem(
          id: displeyMeals[index].id,
          title: displeyMeals[index].title,
        imgUrl: displeyMeals[index].imageUrl,
        duration: displeyMeals[index].duration,
        affordability: displeyMeals[index].affordability,
        complexity: displeyMeals[index].complexity,
        deleteItem: deleteMeal,);
      }),
    );
  }
}
