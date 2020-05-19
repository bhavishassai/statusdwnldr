import 'dart:io';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageView extends StatefulWidget {
  final String path;
  ImageView({this.path});

  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: PhotoView(
        imageProvider: FileImage(File(widget.path)),
        maxScale: PhotoViewComputedScale.covered,
        minScale: PhotoViewComputedScale.contained * 0.95,
      )),
    );
  }
}
