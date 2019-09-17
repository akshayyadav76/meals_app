import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../model/meals.dart';
import '../screens/meals_deatils_screen.dart';


class MealItem extends StatelessWidget {

  final String id;
  final String title;
  final String imgUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;


  MealItem(
  {
    @required this.id,
    @required this.title,
    @required this.imgUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,

 }
);


  String get complextiyText{
    switch(complexity){
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
        default:
          return 'Unknown';

    }
  }


  String get affordabilityText{
    switch(affordability){
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Luxrious';
        break;
      default:
        return 'Unknown';

    }
  }

// vpod de;tet

  void itemDeatils(BuildContext context){
      Navigator.of(context).pushNamed(MealsDeatilsScreen.MealDEailsRout,
          arguments: id).then((result){
           // deleteItem(result);
      });

  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> itemDeatils(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),
       elevation: 4,
        margin: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                 borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                  child: Image.network(imgUrl,height: 200,width: double.infinity,fit: BoxFit.cover,),
                ),
                Positioned(
                  bottom: 0,
                  right: 10,
                  child: Container(
                    width: 220,
                    color: Colors.black45,
                    alignment: Alignment.bottomRight,
                    child: Text(title,style: TextStyle(fontSize: 20,color: Colors.white),softWrap: true,
                      overflow:TextOverflow.fade,
                    ),
                  ),
                ),

              ],
            ),
            Row(
              children: <Widget>[
                Padding(padding: EdgeInsets.all(6),
                  child: Row(children: <Widget>[
                    Icon(Icons.timer),
                    SizedBox(width: 5,),
                    Text("$duration min")
                  ],),
                ),
                Padding(padding: EdgeInsets.all(6),
                  child: Row(children: <Widget>[
                    Icon(Icons.work),
                    SizedBox(width: 5,),
                    Text("$complextiyText")
                  ],),
                ), Padding(padding: EdgeInsets.all(6),
                  child: Row(children: <Widget>[
                    Icon(Icons.attach_money),
                    SizedBox(width: 5,),
                     Text("$affordabilityText")
                  ],),
                )
              ],
            )

          ],
        ),
      ),

    );
  }
}
