import 'package:provider/provider.dart';
import 'package:statusdwnldr/logic/status_retriever.dart';
import 'package:statusdwnldr/route_generator.dart';
import './screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ChangeNotifierProvider<StatusRetriever>(create: (BuildContext c){
      return StatusRetriever();
    },child: Home()),
    onGenerateRoute: RouteGenerator.generateRoute,
  ));
}
