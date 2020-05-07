import './screens/view.dart';
import './screens/home.dart';
import 'package:flutter/material.dart';


void main() async {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/": (c)=>Home(),
      "/view":(c)=>View(),
    },
   
    
  ));
}
