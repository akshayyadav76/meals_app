import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';

class Drawerz extends StatelessWidget {

  Widget buildDrowersItem(IconData icon,String title,Function handler){
    return ListTile(
      leading: Icon(icon),
      title: Text(title,style: TextStyle(
        fontFamily: 'RobotoCandensed',
        fontSize: 24,
        fontWeight: FontWeight.bold
    ),),
      onTap: handler,);
  }



  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).accentColor,
            child: Text('Cooking Up',style: TextStyle(
            fontSize: 30,
              fontWeight: FontWeight.w900,
              color: Theme.of(context).primaryColor,
            ),),
          ),

          buildDrowersItem(Icons.restaurant, "Meals",(){
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildDrowersItem(Icons.settings, 'Settings',(){
            Navigator.of(context).pushReplacementNamed(FiltersScreen.filterRoute);
          })

        ],
      ),
    );
  }
}
