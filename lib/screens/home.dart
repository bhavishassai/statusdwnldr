import 'dart:io';

import 'package:flutter/material.dart';

import 'package:statusdwnldr/eng/storage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            body: NestedScrollView(
                headerSliverBuilder: (context, boolean) {
                  return <Widget>[
                    SliverAppBar(
                      forceElevated: true,
                      title: Text("Status Viewer"),
                     pinned: true,
                     floating: true,
                      
                      bottom: TabBar(tabs: <Tab>[
                        Tab(text: "IMAGES",),
                        Tab(text:"VIDEOS"),
                      ])
                    )
                  ];
                },
                body: TabBarView(children: <Widget>[
                  ImageTabView(),
                  VideoTabView(),
                ]))));
  }
}

class ImageTabView extends StatefulWidget {
  @override
  _ImageTabViewState createState() => _ImageTabViewState();
}

class _ImageTabViewState extends State<ImageTabView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Storage().read(),
        builder: (c, s) {
          if (s.hasData) {
            return GridView.builder(
              padding: EdgeInsets.all(2),
              itemCount: s.data.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                
              ),
              itemBuilder: (BuildContext c, int i) {
                return Padding(
                  padding: const EdgeInsets.all(2.0,),
                  child: Material(
                      color: Colors.transparent,
                      child: Ink.image(
                        fit: BoxFit.cover,
                        image: FileImage(
                          File(s.data[i].path),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, "/view",
                                arguments: s.data[i].path);
                          },
                        ),
                      )),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}

class VideoTabView extends StatefulWidget {
  @override
  _VideoTabViewState createState() => _VideoTabViewState();
}

class _VideoTabViewState extends State<VideoTabView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Video Tab View"),
    );
  }
}
