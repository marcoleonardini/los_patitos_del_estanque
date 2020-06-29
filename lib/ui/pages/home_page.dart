import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:los_patitos_del_estanque/core/api/deezer_api.dart';
import 'package:los_patitos_del_estanque/models/album.dart';
import 'package:los_patitos_del_estanque/src/pages/music_player/music_player_page.dart';
import 'package:los_patitos_del_estanque/src/pages/music_player/widgets/cassette.dart';
import 'package:los_patitos_del_estanque/src/ui/app_colors.dart';

class HomePage extends StatelessWidget {
  
  final List<int> firstRowAlbumIds = [
    119606,
    81763,
    7373433,
    423368,
    6157080,
  ];
  
  final List<int> secondRowAlbumIds = [
    137217782,
    135472242,
    43159701,
    11898198,
    125500082
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(left: 50),
          decoration: BoxDecoration(
            color: backgroundColor
          ),
          constraints: BoxConstraints.expand(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FutureBuilder(
                future: DeezerApi.getListAlbumByListId(firstRowAlbumIds),
                builder: (context, snapshot) {

                  if(!snapshot.hasData) 
                    return Center(child: CircularProgressIndicator());
                    
                  List<Album> albumList = snapshot.data;

                  return SizedBox(
                    width: double.infinity,
                    height: 250,
                    child: ListView.builder(
                      itemCount: albumList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Cassette(
                          mAlbum: albumList.elementAt(index),
                        );
                      },
                    ),
                  );
                }
              ),
              FutureBuilder(
                future: DeezerApi.getListAlbumByListId(secondRowAlbumIds),
                builder: (context, snapshot) {

                  if(!snapshot.hasData) 
                    return Center(child: CircularProgressIndicator());
                    
                  List<Album> albumList = snapshot.data;
                  print("Album list tam: " + albumList.length.toString());

                  return SizedBox(
                    width: double.infinity,
                    height: 250,
                    child: ListView.builder(
                      itemCount: albumList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Cassette(
                          mAlbum: albumList.elementAt(index),
                        );
                      },
                    ),
                  );
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Cassette extends StatelessWidget {

  final Album mAlbum;

  const Cassette({Key key, this.mAlbum}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showDialog(context);
      },
      child: Container(
        width: 50,
        height: 250,
        margin: EdgeInsets.all(4),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                '180 min.',
                style: TextStyle(fontSize: 10.0),
              ),
            ),
            Divider(),
            Expanded(
              child: RotatedBox(
                quarterTurns: -1,
                child: Text(
                  mAlbum.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: 'Titles', fontSize: 18.0),
                ),
              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.black38,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 4.0, right: 4.0, bottom: 4.0),
              child: Opacity(
                opacity: 0.5,
                child: Image.asset(
                  'images/tdk.png',
                ),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.symmetric(
            vertical:
                BorderSide(color: Colors.black.withOpacity(0.75), width: 5),
            horizontal: BorderSide(color: Colors.blueGrey, width: 3),
          ),
        ),
      ),
    );
  }

  void _showDialog(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ), //this right here
          child: Container(
            // height: 280,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Center(
                      child: Stack(
                        children: <Widget>[
                          CompleteCassete(),

                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: FadeInImage.assetNetwork(
                                    fadeInDuration: Duration(seconds: 1),
                                    placeholder: 'assets/images/loading.gif',
                                    image: mAlbum.coverMedium,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          Text(
                            mAlbum.title,
                            style: TextStyle(fontSize: 24.0),
                          ),
                          SizedBox(height: 10),
                          Text(
                            mAlbum.artist.name,
                            style: TextStyle(fontSize: 16.0),
                          ),
                          Divider(),
                          Expanded(
                            child: ListView.separated(
                              separatorBuilder: (_, __) => Divider(),
                              itemCount: mAlbum.tracks.data.length,
                              itemBuilder: (context, index) {
                                return SongName(
                                  track: mAlbum.tracks.data.elementAt(index),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// Widget que son los nombre de las canciones
class SongName extends StatelessWidget {
  final TracksDatum track;
  const SongName({
    Key key,
    this.track,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Text(
        track.title,
        style: TextStyle(
          fontFamily: 'Cassettes',
          // fontWeight: FontWeight.bold,
          fontSize: 18.0,
        ),
      ),

      onTap: () {

        Navigator.push(
          context, 
          CupertinoPageRoute(
            builder: (_) => MusicPlayerPage(
              mTrack: track,
            )
          )
        );

      },
    );
  }
}
