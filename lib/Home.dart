import 'package:flutter/material.dart';
import 'package:youtube/CustomSearchDelegate.dart';
import 'package:youtube/telas/Emalta.dart';
import 'package:youtube/telas/Inicio.dart';
import 'package:youtube/telas/Inscricao.dart';
import 'package:youtube/telas/biblioteca.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController texto = new TextEditingController();
  int _indiceAtual = 0;
  String _resultado = "";
  @override
  Widget build(BuildContext context) {

    List<Widget> telas = [
      Inicio(pesquisa: _resultado,),
      Emalta(),
      Inscricao(),
      biblioteca(),
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey
        ),
        backgroundColor: Colors.white,
        title: Image.asset("images/youtube.png", width: 98, height: 22,),
        actions: [
          IconButton(onPressed: (){print("Videocam");}, icon: Icon(Icons.videocam)),
          IconButton(onPressed: ()async{
            final res = await showSearch(context: context, delegate: CustomSearchDelegate(texto));
            print(texto.text);
            setState((){
              _resultado = texto.text;
            })
            ;}, icon: Icon(Icons.search)),
          IconButton(onPressed: (){print("Conta");}, icon: Icon(Icons.account_circle)),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_indiceAtual],
      ),
      bottomNavigationBar:
      BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (indice){
          setState((){
            _indiceAtual = indice;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(label:"Início",icon: Icon(Icons.home)),
          BottomNavigationBarItem(label:"Em alta",icon: Icon(Icons.whatshot)),
          BottomNavigationBarItem(label:"Insrições",icon: Icon(Icons.subscriptions)),
          BottomNavigationBarItem(label:"Biblioteca",icon: Icon(Icons.folder)),
        ],
      )
      ,
    );
  }
}
