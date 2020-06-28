import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:los_patitos_del_estanque/Widgets/ListaCanciones/album.dart';

class ListaCanciones extends StatefulWidget {
  @override
  _ListaCancionesState createState() => _ListaCancionesState();
}

class _ListaCancionesState extends State<ListaCanciones> {
  @override
  void initState() {
    super.initState();
    getAlbum();
  }

  Future<Album> getAlbum() async {
    const url = 'https://api.deezer.com/album/54933542';
    var response = await http.get(url);

    var jsonResponse = convert.jsonDecode(response.body);
    Album album = Album.fromJson(jsonResponse);
    return album;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getAlbum(),
        builder: (BuildContext context, AsyncSnapshot<Album> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            children = [Text('Ok')];
          } else if (snapshot.hasError) {
            children = [Text('error')];
          } else {
            children = [CircularProgressIndicator()];
          }

          return Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: children
                // ..add(FlatButton(
                //     onPressed: () {
                //       RecordMp3.instance.start(
                //           'https://cdns-preview-c.dzcdn.net/stream/c-cfbbb509379d49cef7c1c20f324fef68-3.mp3',
                //           (type) {
                //         // record fail callback
                //       });
                //     },
                //     child: Text("reproducir"))),
                ),
          );
        },
      ),
    );
  }
}
