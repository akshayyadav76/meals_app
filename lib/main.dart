import 'package:flutter/material.dart';
import 'package:meals_app/screens/filters_screen.dart';


import './screens/category_meals_screen.dart';
import './screens/meals_deatils_screen.dart';
import './screens/Tab_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
        '/':(context)=>TabScreen(),
        CategoryMealsScreen.categoryMealsScreen_Route: (context){return CategoryMealsScreen();},
        MealsDeatilsScreen.MealDEailsRout: (context)=> MealsDeatilsScreen(),
        FiltersScreen.filterRoute:(context)=>FiltersScreen(),


      },
    );
  }
}

