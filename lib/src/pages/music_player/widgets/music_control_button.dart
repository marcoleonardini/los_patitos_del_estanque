import 'package:flutter/material.dart';
import 'package:los_patitos_del_estanque/src/ui/app_colors.dart';

class MusicControlButton extends StatelessWidget {
  
  final Widget child;

  final double mHeight = 42;
  double mWidth;

  MusicControlButton.small({@required this.child}) {
    mWidth = 76;
  }

  MusicControlButton.large({@required this.child}) {
    mWidth = 250;
  }
  
  final double _buttonRadius = 15;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mHeight,
      width: mWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_buttonRadius),
        color: timerColor,
        boxShadow: <BoxShadow> [
          BoxShadow(color: playerButtonShadow, offset: Offset(0, 10))
        ]
      ),
      child: Center(child: child),
    );
  }
}