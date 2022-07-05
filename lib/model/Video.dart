class Video{
  String? id;
  String? titulo;
  String? descricao;
  String? thumbv;
  String? canal;

  Video({this.id, this.titulo, this.descricao, this.thumbv, this.canal});
/*static converterJson(Map<String, dynamic> json){

    return Video(
    id: json["id"]["videoId"],
      titulo: json["snippet"]["title"],
      thumbv: json["snippet"]["thumbnails"]["high"]["url"],
      canal: json["snippet"]["channelId"],
    );

  }
  static Video.fromJson(){
        return Video();
  }*/
  factory Video.fromJson(Map<String, dynamic> json){
    return Video(
      id: json["id"]["videoId"],
      titulo: json["snippet"]["title"],
      descricao: json["snippet"]["description"],
      thumbv: json["snippet"]["thumbnails"]["high"]["url"],
      canal: json["snippet"]["channelId"],
    );

  }



}