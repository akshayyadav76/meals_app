import 'package:flutter/material.dart';

import './categorys_screen.dart';
import './favorites_screen.dart';
import '../widgtes/drawer.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {

 final List<Map<String,Object>>screenTabs=[
   {'page': CategoryScreen(),'title':"Categoyies",},
   { 'page': FavoritesScreen(),'title':'Your Favorties'}
 ];
  int index1=0;

void selcectedIndex(int index){

   setState(() {
   index1 = index;
   });
 }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(screenTabs[index1]['title']),centerTitle: true,
        ),
      drawer: Drawerz(),
      body: screenTabs[index1]['page'],
        bottomNavigationBar: BottomNavigationBar(
          onTap: selcectedIndex,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: index1,
        items:[
          BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text('Categorys')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.star,),
              title: Text('Favorties')
          ),
        ] ),


    );

  }
}
