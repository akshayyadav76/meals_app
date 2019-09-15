import 'package:flutter/material.dart';

class MealsDeatilsScreen extends StatelessWidget {

  static const MealDEailsRout ='./MealsDeatilsScreen';


  @override
  Widget build(BuildContext context) {
    final arus=ModalRoute.of(context).settings.arguments as String;

    return Scaffold(
      appBar: AppBar(title: Text(arus),),


    );
  }
}
