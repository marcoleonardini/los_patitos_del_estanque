import 'package:flutter/material.dart';
import 'package:los_patitos_del_estanque/src/pages/music_player/music_player_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: MusicPlayerPage()
    );
  }
}