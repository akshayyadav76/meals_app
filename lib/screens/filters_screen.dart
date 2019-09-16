import 'package:flutter/material.dart';



class FiltersScreen extends StatelessWidget {
  static const filterRoute ="/filters";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Filters"),),
      body: SafeArea(child: Text("todo")),
    );
  }
}
