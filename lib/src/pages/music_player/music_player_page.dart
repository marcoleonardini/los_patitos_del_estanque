import 'package:flutter/material.dart';
import 'package:los_patitos_del_estanque/src/pages/music_player/widgets/cassette.dart';
import 'package:los_patitos_del_estanque/src/pages/music_player/widgets/music_control_button.dart';
import 'package:los_patitos_del_estanque/src/pages/music_player/widgets/music_timer.dart';
import 'package:los_patitos_del_estanque/src/ui/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MusicPlayerPage extends StatelessWidget {
  
  final String songName;
  final String artistName;
  
  MusicPlayerPage({@required this.songName, @required this.artistName});

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

          Cassette(),
          SizedBox(height: 30),

          MusicTimer(),
          SizedBox(height: 40),

          _songName(),
          SizedBox(height: 20),

          _artistName(),
          SizedBox(height: 40),

          _buttonSection()




        ],
        // child: MusicTimer(),
        
        // child: Container(
          // width: _buttonsContainerWidth,
          // child: Column(
            // mainAxisSize: MainAxisSize.min,
            // children: <Widget>[
              // MusicControlButton.large(
                // child: SvgPicture.asset('assets/images/play_icon.svg')
              // ),
              // SizedBox(height: _buttonVerticalSpacing),
              // Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // children: <Widget>[
                  // MusicControlButton.small(
                    // child: SvgPicture.asset('assets/images/back_icon.svg')
                  // ),
                  // MusicControlButton.small(
                    // child: SvgPicture.asset('assets/images/forward_icon.svg')
                  // ),
                  // MusicControlButton.small(
                    // child: SvgPicture.asset('assets/images/stop_icon.svg')
                  // ),
                // ],
              // )
            // ],
          // ),
        // )

        // child: Cassette(),

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
            child: SvgPicture.asset('assets/images/play_icon.svg')
          ),
          SizedBox(height: _buttonVerticalSpacing),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              MusicControlButton.small(
                child: SvgPicture.asset('assets/images/back_icon.svg')
              ),
              MusicControlButton.small(
                child: SvgPicture.asset('assets/images/forward_icon.svg')
              ),
              MusicControlButton.small(
                child: SvgPicture.asset('assets/images/stop_icon.svg')
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
      songName, 
      style: TextStyle(fontSize: fontSize, fontFamily: 'digital-7', color: Colors.white)
    );
  }

  Widget _artistName() {
    final double fontSize = 24;

    return Text(
      artistName, 
      style: TextStyle(fontSize: fontSize, fontFamily: 'digital-7', color: Colors.white)
    );
  }
}