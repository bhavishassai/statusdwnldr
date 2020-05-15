import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statusdwnldr/logic/status_retriever.dart';


class ImageTabView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   
    return Consumer<StatusRetriever>(
          builder: (BuildContext context, StatusRetriever statusRetriever, Widget child) { 
            return GridView.builder(
        padding: EdgeInsets.all(2),
        itemCount: statusRetriever.fileSystemImageEntity.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (BuildContext c, int i) {
          return Padding(
            padding: const EdgeInsets.all(
              2.0,
            ),
            child: Material(
                color: Colors.transparent,
                child: Ink.image(
                  fit: BoxFit.cover,
                  image: FileImage(
                    File(statusRetriever.fileSystemImageEntity[i].path),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "/view",
                          arguments: statusRetriever.fileSystemImageEntity[i].path);
                    },
                  ),
                )),
          );
        },
      );
           },
          child: Center(
            child: FlatButton(onPressed: (){

            }, child: Text("Load Status")),
          )
    );
  }
}