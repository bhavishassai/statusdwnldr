import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statusdwnldr/logic/status_retriever.dart';
import 'widgets/image_tab_view.dart';
import 'widgets/video_tab_view.dart';

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
                  forceElevated: true,
                  title: Text("Status Viewer"),
                  pinned: true,
                  floating: true,
                  bottom: TabBar(tabs: <Tab>[
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
              VideoTabView(),
            ],
          ),
        ),
      ),
    );
  }
}
