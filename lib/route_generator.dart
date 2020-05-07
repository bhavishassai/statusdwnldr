import 'package:flutter/material.dart';
import './screens/view.dart';



class RouteGenerator{

  static Route<dynamic> generateRoute(RouteSettings settings){

    switch(settings.name){

      case "/view":
        return MaterialPageRoute(builder: (c)=>View(path: settings.arguments,));
        break;

      default: return null;  
      
    }


    



  }



}