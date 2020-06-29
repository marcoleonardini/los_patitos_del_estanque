import 'package:flutter/material.dart';
import 'package:los_patitos_del_estanque/src/ui/app_colors.dart';

class MusicTimer extends StatelessWidget {
  
  final String duration;

  MusicTimer(this.duration);

  final double _timerHeight = 115;
  final double _timerWidth = 255; 
  final double _timerPadding = 10;
  
  final double _timerRadius = 35;
  final double _spacingHeight = 3;
  final double _buttonIconSize = 16;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(_timerPadding),
          height: _timerHeight,
          width: _timerWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_timerRadius),
            color: timerColor
          ),
          child: Row(            
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  _SimpleButton(label: 'LIST', onPressed: () {} ),
                  SizedBox(height: _spacingHeight),
                  _SimpleButton(label: 'BAND', onPressed: () {} )
                ],
              ),
              Column(
                children: <Widget>[
                  SizedBox(height: _spacingHeight * 3),
                  _TimerScreen(timerValue: this.duration.toString()),
                ],
              ),
              Column(
                children: <Widget>[
                  _SimpleButton(label: 'HOUR', onPressed: () {} ),
                  SizedBox(height: _spacingHeight),
                  _SimpleButton(
                    label: '', 
                    bottomLabel: 'TUNNING',
                    onPressed: () {}, 
                    child: Icon(Icons.add, color: Colors.white, size: _buttonIconSize)
                   )
                ],
              ),
            ],
          ),
        ),

        Positioned(
          right: 45,
          bottom: 15,
          child:  _circleButton(Icon(Icons.remove, color: Colors.white, size: _buttonIconSize)),
        ),
         
        Positioned (
          left: 60,
          bottom: 20,
          child: _MuteButton(onPressed: () {}),
        )
      ],
    );
  }

  Widget _circleButton(Widget child) {
    final double radius = 9.5;

    return GestureDetector(
      child: Container(
        height: radius * 2,
        width: radius * 2,
        decoration: BoxDecoration(
          color: buttonTimerColor,
          shape: BoxShape.circle
        ),
        child: Center(child: child),
      ),
    );
  }
}

class _TimerScreen extends StatelessWidget {
  
  final String timerValue;

  _TimerScreen({@required this.timerValue});

  final double _screenHeight = 42;
  final double _screenWidth = 170;
  final double _screenradius = 70;

  final double _borderWidth = 2;
  
  final double _fontSize = 40;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _screenHeight,
      width: _screenWidth,
      decoration: BoxDecoration(
        color: screenColor,
        borderRadius: BorderRadius.circular(_screenradius),
        border: Border.all(
          color: screenBorderColor, 
          width: _borderWidth)
      ),
      child: Center(
        child: Text(
          timerValue, 
          style: TextStyle(fontSize: _fontSize, fontFamily: 'digital-7')
        ),
      ),
    );
  }
}

class _SimpleButton extends StatelessWidget {
  
  final String label;
  final Function onPressed;
  final Widget child;
  final String bottomLabel;

  _SimpleButton({
    @required this.label, 
    @required this.onPressed,
    this.child,
    this.bottomLabel
  });

  final double _spacingSize = 3;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _timerLabel(label: label),
          SizedBox(height: _spacingSize),
          GestureDetector(
            child: _circleButton(child),
            onTap: onPressed,
          ),
          if(bottomLabel != null) _timerLabel(label: bottomLabel, fontSize: 6)
        ],
      ),      
    );
  }

  Widget _timerLabel({String label, double fontSize = 8}) {
    return Text(
      label,
      style: TextStyle(fontSize: fontSize),
    );
  }

  Widget _circleButton(Widget child) {
    final double radius = 9.5;

    return GestureDetector(
      child: Container(
        height: radius * 2,
        width: radius * 2,
        decoration: BoxDecoration(
          color: buttonTimerColor,
          shape: BoxShape.circle
        ),
        child: Center(child: child),
      ),
    );
  }
}

class _MuteButton extends StatelessWidget {
  
  final Function onPressed;

  _MuteButton({@required this.onPressed});

  final double _buttonHeight = 8;
  final double _buttonWidth = 64;
  final double _buttonRadius = 5;

  final String _label = 'MUTE';

  final double _fontSize = 8;
  final double _verticalSpacing = 5;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          height: _buttonHeight,
          width: _buttonWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_buttonRadius),
            color: buttonTimerColor
          ),
        ),
        SizedBox(height: _verticalSpacing),
        Text(_label, style: TextStyle(fontSize: _fontSize))
      ],
    );
  }
}

