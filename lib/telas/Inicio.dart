import 'package:flutter/material.dart';
import 'package:youtube/telas/Playvideo.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../Api.dart';
import '../model/Video.dart';


class Inicio extends StatefulWidget {
  final String pesquisa;
  const Inicio({Key? key, required this.pesquisa}) : super(key: key);

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  _listarVideos(String p) {
    Future<List<Video>> videos;
    Api api = Api();
    return api.pesquisar(p);
  }






  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Video>>(
      future: _listarVideos(widget.pesquisa),
      builder: (contex, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.hasData) {
              return ListView.separated(itemBuilder: (context,int index){
                List<Video> videos = snapshot.data!;
                Video video = videos[index];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,MaterialPageRoute(builder: (Context)=> Playvideo(
                      idvideo:video.id.toString(), title: video.titulo.toString(),
                    subtitle: video.descricao.toString(),)));

                  },
                  child:
                  Column(
                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(video.thumbv.toString())
                            )
                        ),
                      ),
                      ListTile(
                        title: Text(video.titulo.toString()),
                        subtitle: Text(video.descricao.toString()),
                      )
                    ],
                  ),
                );
              },
                  separatorBuilder: (context,index)=>Divider(
                    height: 2,
                    color: Colors.red,
                  ),
                  itemCount: snapshot.data!.length);
            } else {
              return Center(
                child: Text("Tem nada não"),
              );
            }
            break;
        }
      },
    );
  }
}
