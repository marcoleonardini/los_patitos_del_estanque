import 'package:flutter/material.dart';
import 'package:los_patitos_del_estanque/src/ui/app_colors.dart';
import 'package:provider/provider.dart';

class MusicControlButton extends StatelessWidget {
  
  final Widget child;
  final Function onFinishPress;

  final double mHeight = 42;
  double mWidth;

  MusicControlButton.small({@required this.child, @required this.onFinishPress}) {
    mWidth = 76;
  }

  MusicControlButton.large({@required this.child, @required this.onFinishPress}) {
    mWidth = 250;
  }
  
  final double _buttonRadius = 15;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _MusicButtonModel(),
      child: Builder(
        builder: (context) {
          
          bool isDown = Provider.of<_MusicButtonModel>(context).isDown;
          
          return GestureDetector(
            child: Transform.translate(
              offset: isDown ? Offset(0, 10) : Offset(0, 0),
              child: Container(
                height: mHeight,
                width: mWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(_buttonRadius),
                  color: timerColor,
                  boxShadow: <BoxShadow> [
                    BoxShadow(color: isDown ? Colors.transparent : playerButtonShadow, offset: Offset(0, 10))
                  ]
                ),
                child: Center(child: child),
              ),
            ),
            onTapDown: (tapDetails) {

              Provider.of<_MusicButtonModel>(context, listen: false).isDown = true;

            },

            onTapUp: (tapDetails) {

              Provider.of<_MusicButtonModel>(context, listen: false).isDown = false;
              onFinishPress();

            },
          );
        }
      ),
    );
  }
}

class _MusicButtonModel with ChangeNotifier {

  bool _isDown = false;

  bool get isDown => this._isDown;

  set isDown(bool value) {
    this._isDown = value;
    notifyListeners();
  }

}