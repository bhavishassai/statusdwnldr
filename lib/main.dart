

import 'dart:io';

import 'package:mime/mime.dart';
import 'package:flutter/material.dart';
import 'package:statusdwnldr/eng/storage.dart';

void main() async {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text("Status Viewer"),
        ),
        body: FutureBuilder(
            future: Storage().read(),
            builder: (c, s) {
              if (s.hasData) {
                return GridView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: s.data.length,
                  itemBuilder: (c, i) {
                    print(lookupMimeType(s.data[i].path));
                    if(lookupMimeType(s.data[i].path)=="image/jpeg"){
                      return Image.file(File(s.data[i].path));

                    }else{
                      return Center(child: Text(s.data[i].toString()));

                    }
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }));
  }
}
