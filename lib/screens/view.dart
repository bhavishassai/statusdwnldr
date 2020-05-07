import 'dart:io';

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class View extends StatefulWidget {

  final String path;
  View({this.path});


  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PhotoView(imageProvider:FileImage(File(widget.path)),
        maxScale: PhotoViewComputedScale.covered,
        minScale: PhotoViewComputedScale.contained*0.95, )
      ),
      
    );
  }
}