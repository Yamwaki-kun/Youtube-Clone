import 'package:http/http.dart' as http;
import 'dart:convert';

import 'model/Video.dart';

const CHAVE_YOUTUBE_API = "AIzaSyCPnctKDMUind7gATm1jJ5ThXfNWRJam7g";
const ID_CANAL = "UC79y2fMphBseiVOK70I6aog";
const ID_CANAL2 = "UC_oeV58JVVXtxxs09oK1dLg";
const URL_BASE ="https://youtube.googleapis.com/youtube/v3";

class Api{
  Future<List<Video>> pesquisar(String pesquisa) async{
    List<Video> videos =[];
    http.Response response = await http.get(Uri.parse(URL_BASE+"/search"+"?part=snippet""&channelId=$ID_CANAL""&maxResults=20""&order=date""&q=$pesquisa""&videoType=videoTypeUnspecified""&key=$CHAVE_YOUTUBE_API"));
    if(response.statusCode ==200){

      Map<String, dynamic> dadosJson = jsonDecode(response.body);
      videos = dadosJson["items"].map<Video>(
          (map){return Video.fromJson(map);}).toList();
      print("A pesquisa foi: "+pesquisa);

      return videos;

      //print(dadosJson["items"][0]["id"]["videoId"].toString());
    }else{
      return videos;
    }
  }
}











