import 'package:flutter/material.dart';
import 'package:meals_app/screens/filters_screen.dart';


import './screens/category_meals_screen.dart';
import './screens/meals_deatils_screen.dart';
import './screens/Tab_screen.dart';
import './model/meals.dart';
import './dummy_data.dart.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String ,bool>_filters={
   "glutonFree": false,
   "vegaterin" :false,
   "vegan": false,
   "lactoseFree": false
  };

  List<Meal> FilteredList =DUMMY_MEALS;
  List<Meal> favorites =[];

  void toggleFavorits(String meaId){
   final exitingIndex =favorites.indexWhere((meal)=> meal.id ==meaId);
   if(exitingIndex >0){
     setState(() {
       favorites.removeAt(exitingIndex);
     });
   }else{
     setState(() {
       favorites.add(DUMMY_MEALS.firstWhere((meal)=>meal.id == meaId));
     });
   }
  }

  bool isMealFavorites(String id){
    return favorites.any((meal)=> meal.id== id);
  }

  void setFilters(Map<String,bool>filster){
   setState(() {
     _filters =filster;

     FilteredList =DUMMY_MEALS.where((meal){
       if(_filters['glutonFree'] && !meal.isGlutenFree){
         return false;
       }
       if(_filters['vegaterin'] && !meal.isVegetarian){
         return false;
       }
       if(_filters['vegan'] && !meal.isVegan){
         return false;
       }
       if(_filters['lactoseFree'] && !meal.isLactoseFree){
         return false;
       }
       return true;
     }).toList();
   });

  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 245, 233, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          title: TextStyle(fontSize: 20,fontFamily: 'RobotoCondensed',fontWeight: FontWeight.bold)
        )

      ),
      //home: CategoryScreen(),
      initialRoute: '/',
      routes: {
        '/':(context)=>TabScreen(favorites),
        CategoryMealsScreen.categoryMealsScreen_Route: (context){ return CategoryMealsScreen(FilteredList);},
        MealsDeatilsScreen.MealDEailsRout: (context)=> MealsDeatilsScreen(toggleFavorits,isMealFavorites),
        FiltersScreen.filterRoute:(context)=>FiltersScreen(setFilters,_filters),
      },
    );
  }
}

