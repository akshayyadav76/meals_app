import 'package:flutter/material.dart';

import '../dummy_data.dart.dart';
import '../widgtes/category_item.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      //appBar: AppBar(title: Text("Meals App"),centerTitle: true,),
       GridView(
        padding: const EdgeInsets.all(15),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent:  MediaQuery.of(context).size.width *0.5,
          childAspectRatio: 3/2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20
          ),
        children: DUMMY_CATEGORIES.map((data){
          return CategoryItem(data.id,data.title,data.color);
        }).toList(),


    );
  }
}
