import 'dart:io';

import 'package:flutter/material.dart';
import 'package:statusdwnldr/eng/storage.dart';

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
                    return Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Material(
                          color: Colors.transparent,
                          child: Ink.image(
                            fit: BoxFit.cover,
                              image: FileImage(
                                
                            File(s.data[i].path),
                          ),
                          child: InkWell(
                           
                            onTap: (){
                              Navigator.pushNamed(context, "/view",arguments: s.data[i].path);
                            },
                          ),
                          )
                          ),
                    );
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
