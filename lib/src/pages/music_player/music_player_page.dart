import 'package:flutter/material.dart';
import 'package:los_patitos_del_estanque/models/album.dart';
import 'package:los_patitos_del_estanque/src/pages/music_player/widgets/cassette.dart';
import 'package:los_patitos_del_estanque/src/pages/music_player/widgets/music_control_button.dart';
import 'package:los_patitos_del_estanque/src/pages/music_player/widgets/music_timer.dart';
import 'package:los_patitos_del_estanque/src/ui/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:audioplayers/audioplayers.dart';

class MusicPlayerPage extends StatelessWidget {
  
  final TracksDatum mTrack;
  AudioPlayer audioPlayer = new AudioPlayer();
  
  MusicPlayerPage({@required this.mTrack});

  final double _buttonsContainerWidth = 250;
  final double _buttonVerticalSpacing = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(width: double.infinity),

          CompleteCassete(),
          SizedBox(height: 30),

          MusicTimer(_parseSecondsToTimer(mTrack.duration)),
          SizedBox(height: 40),

          _songName(),
          SizedBox(height: 20),

          _artistName(),
          SizedBox(height: 40),

          _buttonSection()
        ],
      ),
    );
  }

  Widget _buttonSection() {
    return Container(
      width: _buttonsContainerWidth,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          MusicControlButton.large(
            child: SvgPicture.asset('assets/images/play_icon.svg'),
            onFinishPress: _play,
          ),
          SizedBox(height: _buttonVerticalSpacing),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              MusicControlButton.small(
                child: SvgPicture.asset('assets/images/back_icon.svg'),
                onFinishPress: _back,
              ),
              MusicControlButton.small(
                child: SvgPicture.asset('assets/images/forward_icon.svg'),
                onFinishPress: _forward,
              ),
              MusicControlButton.small(
                child: SvgPicture.asset('assets/images/stop_icon.svg'),
                onFinishPress: _stop,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _songName() {
    final double fontSize = 40;
    
    return Text(
      mTrack.title, 
      style: TextStyle(fontSize: fontSize, fontFamily: 'digital-7', color: Colors.white)
    );
  }

  Widget _artistName() {
    final double fontSize = 24;

    return Text(
      mTrack.artist.name, 
      style: TextStyle(fontSize: fontSize, fontFamily: 'digital-7', color: Colors.white)
    );
  }

  // TODO: Player Functions
  void _play() {
    audioPlayer.play(mTrack.preview);
  }

  void _stop() {
    audioPlayer.pause();
  }

  void _back() {

  }

  void _forward() {

  }

  String _parseSecondsToTimer(int mSeconds) {
    int minutes = mSeconds ~/ 60;
    int seconds = mSeconds % 60;

    return "$minutes:$seconds";
  }
}