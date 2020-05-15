
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statusdwnldr/logic/status_retriever.dart';
import 'widgets/image_tab_view.dart';
import 'widgets/video_tab_view.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final statusRetriever = Provider.of<StatusRetriever>(context,listen: false);
    statusRetriever.retrieve();
    print("Home widget is building");
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, boolean) {
            return <Widget>[
              SliverAppBar(
                
                backgroundColor: Colors.green ,
                  forceElevated: true,
                  title: Text("Status Viewer"),
                  pinned: true,
                  floating: true,
                  bottom: TabBar(
                    indicatorColor: Colors.white,
                    tabs: <Tab>[
                    Tab(
                      text: "IMAGES",
                    ),
                    Tab(text: "VIDEOS"),
                  ]))
            ];
          },
          body: TabBarView(
            children: <Widget>[
              ImageTabView(),
              VideoTabView(context:context),
            ],
          ),
        ),
      ),
    );
  }
}

class SomeWidget extends StatefulWidget {
  @override
  _SomeWidgetState createState() => _SomeWidgetState();
}

class _SomeWidgetState extends State<SomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Radio(value: null, groupValue: null, onChanged: null);
  }
}