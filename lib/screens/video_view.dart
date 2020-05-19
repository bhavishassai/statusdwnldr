import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoView extends StatefulWidget {

 final VideoPlayerController vcontroller;

VideoView({@required this.vcontroller});

  @override
  _VideoViewState createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {


@override
  void dispose() {
    
    widget.vcontroller.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
      
        widget.vcontroller.play();
      },
          child: Center(
        child: AspectRatio(
          aspectRatio: 16/9,
          child: VideoPlayer(widget.vcontroller),
          
        ),
      ),
    );
  }
}