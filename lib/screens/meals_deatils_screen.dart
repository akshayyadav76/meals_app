import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../dummy_data.dart.dart';

class MealsDeatilsScreen extends StatelessWidget {

  static const MealDEailsRout = './MealsDeatilsScreen';

  Widget buildText(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildListview(BuildContext context, Widget child) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      height: 150,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final getDeatils = DUMMY_MEALS.firstWhere((meals) => meals.id == mealId);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: (){
          Navigator.of(context).pop(mealId);
        },
      ),
        appBar: AppBar(
          title: Text(getDeatils.title),
        ),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            Container(
              height: 230,
              width: double.infinity,
              child: Image.network(
                getDeatils.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildText(context, 'Ingredients'),
            buildListview(
                context,
                ListView.builder(
                    itemCount: getDeatils.ingredients.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                            child: Text(getDeatils.ingredients[index])),
                      );
                    })),
            SizedBox(height: 10,),

            buildText(context, "Steps"),
            buildListview(context,
                ListView.builder(
                    itemCount: getDeatils.steps.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(child: Text("${index +1}"),
                        ),
                        title: Text(getDeatils.steps[index]),

                      );
                    })
            ),
            SizedBox(height: 10,),

          ]),
        ));
  }
}
