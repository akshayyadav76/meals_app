import 'package:flutter/material.dart';

import '../widgtes/drawer.dart';


class FiltersScreen extends StatefulWidget {
  static const filterRoute ="/filters";
  final Function saveFilters;
  FiltersScreen(this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutonFree =false;
  bool _vegaterin = false;
  bool _vegan = false;
  bool _lactoseFree=false;
  
  Widget _buildSwitchTile(String title,String description,bool newValue,Function hundler){
    return  SwitchListTile(
        value: newValue,
        title: Text(title),
        subtitle: Text(description),
      onChanged: hundler,
       );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawerz(),
      appBar: AppBar(title: Text("Filters"),
      actions: <Widget>[IconButton(
       icon: Icon(Icons.save),
        onPressed: (){

         final getBackToMain={
           "glutonFree": _glutonFree,
           "vegaterin" :_vegaterin,
           "vegan": _vegan,
           "lactoseFree": _lactoseFree
         };
         widget.saveFilters(getBackToMain);})],),
      body: Column(
        children: <Widget>[
          
          Padding(padding: EdgeInsets.all(20),
            child: Text('Adjust Your Meals',style: Theme.of(context).textTheme.title,
            ),
          ),
         _buildSwitchTile("Gluton Free", "only include Gluton Free Meals", _glutonFree,
             (newValue){
               setState(() {
                 _glutonFree =newValue;
               });
             }),
          _buildSwitchTile("Vegiterin", "only include Vegiterin Meals", _vegaterin,
                  (newValue){
                setState(() {
                  _vegaterin =newValue;
                });
              }),
          _buildSwitchTile("Vagan", "only include Vagan Meals", _vegan,
                  (newValue){
                setState(() {
                  _vegan =newValue;
                });
              }),
          _buildSwitchTile("Lactous Free", "only include Lactous Free Meals", _lactoseFree,
                  (newValue){
                setState(() {
                  _lactoseFree =newValue;
                });
              }),
        ],
      ),
    );
  }
}
