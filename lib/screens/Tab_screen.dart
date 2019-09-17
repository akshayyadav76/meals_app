import 'package:flutter/material.dart';

import './categorys_screen.dart';
import './favorites_screen.dart';
import '../widgtes/drawer.dart';
import '../model/meals.dart';

class TabScreen extends StatefulWidget {
  List<Meal>favorites;

  TabScreen(this.favorites);


  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {

   List<Map<String,Object>>screenTabs;
  int index1=0;




 @override
  void initState() {

   screenTabs =[
     {'page': CategoryScreen(),'title':"Categoyies",},
     { 'page': FavoritesScreen(widget.favorites),'title':'Your Favorties'}
   ];
    super.initState();

  }



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
