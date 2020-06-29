import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:los_patitos_del_estanque/models/album.dart';
import 'dart:io';

class DeezerApi {

  static final _albumUrl = 'https://api.deezer.com/album/';


   static Future<Album> getAlbumById(int id) async {
      final response = await http.get("$_albumUrl${id.toString()}");

      if (response.statusCode == 200) {
        return Album.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load album');
      }
   }

   static Future<List<Album>> getListAlbumByListId(List<int> listId) async {
      List<Album> albumList = new List();
   
      for(int i = 0; i < listId.length; i++) {
        Album auxiliarAlbum = await getAlbumById(listId.elementAt(i));
        albumList.add(auxiliarAlbum);
      }

      return albumList;
   }

}