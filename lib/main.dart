import 'package:statusdwnldr/route_generator.dart';
import './screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
    onGenerateRoute: RouteGenerator.generateRoute,
  ));
}
