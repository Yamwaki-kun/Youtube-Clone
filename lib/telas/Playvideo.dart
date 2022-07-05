import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Playvideo extends StatefulWidget {
  final String idvideo;
  final String title;
  final String subtitle;

  const Playvideo({Key? key, required this.idvideo, required this.title,required this.subtitle}) : super(key: key);

  @override
  State<Playvideo> createState() => _PlayvideoState();
}

class _PlayvideoState extends State<Playvideo> {
  late YoutubePlayerController _controller;

  void initState(){
    super.initState();
    const url = 'https://www.youtube.com/watch?v=P4Lshbq27nw';
    _controller = YoutubePlayerController(
        initialVideoId: widget.idvideo);
  }

  @override
  Widget build(BuildContext context) =>
      YoutubePlayerBuilder(player: YoutubePlayer(
        controller: _controller,
      ), builder: (context, player)
        => Scaffold(
          appBar: AppBar(title: Text("Youtube"),backgroundColor: Colors.red,),
          body: Column(
            children: [
              player,
              ListTile(title: Text(widget.title),subtitle: Text(widget.subtitle),)
            ],
          ),
        )

        ,);
}
