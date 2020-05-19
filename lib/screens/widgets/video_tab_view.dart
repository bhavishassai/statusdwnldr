import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statusdwnldr/logic/status_retriever.dart';
import 'package:video_player/video_player.dart';


class VideoTabView extends StatefulWidget {
  final BuildContext context;

  VideoTabView({@required this.context});

  @override
  _VideoTabViewState createState() => _VideoTabViewState();
}

class _VideoTabViewState extends State<VideoTabView> {
  BuildContext _context;
  List<VideoPlayerController> _controller;

  dynamic sr;

  @override
  void initState() {
    _context = widget.context;
    sr = Provider.of<StatusRetriever>(_context, listen: false);
    _controller = List<VideoPlayerController>(sr.fileSystemVideoEntity.length);

    for (int i = 0; i < sr.fileSystemVideoEntity.length; i++) {
      _controller[i] =
          VideoPlayerController.file(File(sr.fileSystemVideoEntity[i].path));
    }

    for (int i = 0; i < sr.fileSystemVideoEntity.length; i++) {
      _controller[i].initialize().then((value) {});
    }
    setState(() {});

    super.initState();
  }

  @override
  void dispose() {
    for (int i = 0; i < sr.fileSystemVideoEntity.length; i++) {
      _controller[i].dispose();
    }
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<StatusRetriever>(
        builder: (BuildContext context, StatusRetriever statusRetriever,
            Widget child) {
          return GridView.builder(
            padding: EdgeInsets.only(top: 2),
            itemCount: statusRetriever.fileSystemVideoEntity.length,
            itemBuilder: (c, i) {
              print(statusRetriever.fileSystemVideoEntity[i].path);

              return Stack(
                fit: StackFit.loose,
                children: <Widget>[
                  Positioned.fill(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: AspectRatio(
                        child: VideoPlayer(_controller[i]),
                        aspectRatio: 16 / 9,
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "/videoview",arguments: _controller[i]);
                        },
                      ),
                    ),
                  ),
                ],
              );
            },
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          );
        },
      ),
    );
  }
}
