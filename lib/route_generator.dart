import 'package:flutter/material.dart';
import './screens/image_view.dart';
import 'screens/video_view.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/imageview":
        return MaterialPageRoute(
            builder: (c) => ImageView(
                  path: settings.arguments,
                ));
        break;
        case "/videoview":
          return MaterialPageRoute(builder: (c)=>VideoView(vcontroller: settings.arguments,));
      default:
        return null;
    }
  }
}
