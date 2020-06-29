import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:los_patitos_del_estanque/src/ui/app_colors.dart';

class CompleteCassete extends StatelessWidget {
  
  final double _cassetteHeight = 216;
  final double _cassetteWidth = 346;
  final double _cassetteRadius = 25;

  final double _stickerWidth = 305;
  final double _stickerHeight = 181;

  final double _stickerPadding = 15;

  final double _baseWidth = 217;
  final double _baseHeight = 55;

  final double _baseVoidWidth = 72;
  final double _baseVoidHeight = 25;

  final double _minStripContentRadius = 17;
  final double _maxStripContentRadius = 30;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: _cassetteHeight,
          width: _cassetteWidth,
          decoration: BoxDecoration(
            color: cassetteColor,
            borderRadius: BorderRadius.circular(_cassetteRadius)
          ),
          child: Center(
            child: Container(
              height: _stickerHeight,
              width: _stickerWidth,
              child: CustomPaint(
                painter: _StickerPainter(),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: _stickerPadding * 2,
                    vertical: _stickerPadding * 2
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            CassetteStrip(stripContentRadius: _maxStripContentRadius),
                            CassetteStrip(stripContentRadius: _minStripContentRadius)
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ),
            ),
          ),
        ),

        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Stack(
              children: <Widget>[
                Container(
                  height: _baseHeight,
                  width: _baseWidth,
                  child: CustomPaint(
                    painter: _BasePainter(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(13, (index) {
                        return Container(height: 2, color: Colors.black26);
                      }),
                    ),
                  ),
                ),
                Positioned(bottom: 10, left: 30, child: _circularHole()),
                Positioned(bottom: 15, left: 65, child: _circularHole()),
                Positioned(bottom: 10, right: 30, child: _circularHole()),
                Positioned(bottom: 15, right: 65, child: _circularHole()),
              ],
            ),
          ),
        ),

        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: _baseVoidHeight,
              width: _baseVoidWidth,
              child: CustomPaint(
                painter: _BaseVoidPainter(),
                child: Center(child: _circularHole())
              ),
            ),
          ),
        ),

        Positioned(
          top: 35,
          right: 35,
          child: SideSticker(),
        ),

        // Screws
        Positioned(
          top: 5,
          left: 5,
          child: CicrularScrew(),
        ),
        Positioned(
          top: 5,
          right: 5,
          child: CicrularScrew(),
        ),
        Positioned(
          bottom: 5,
          left: 5,
          child: CicrularScrew(),
        ),
        Positioned(
          bottom: 5,
          right: 5,
          child: CicrularScrew(),
        )
        
      ],
    );
  }

  Widget _circularHole() {
    final double radius = 5.5;

    return Container(
      height: radius * 2,
      width: radius * 2,
      decoration: BoxDecoration(
        color: holeColor,
        border: Border.all(color: Colors.black),
        shape: BoxShape.circle,
      ),
    );
  }

}

class CassetteStrip extends StatefulWidget {
  
  final double stripContentRadius;

  CassetteStrip({@required this.stripContentRadius});

  @override
  _CassetteStripState createState() => _CassetteStripState();
}

class _CassetteStripState extends State<CassetteStrip> with SingleTickerProviderStateMixin {
  
  AnimationController _controller; 
  Animation<double> _animation;

  @override
  void initState() { 
    super.initState();
    
    _controller = new AnimationController(vsync: this, duration: Duration(seconds: 5));
    _animation = new Tween(begin: 0.0, end: 2.0).animate(_controller);
  
    _controller.addListener(() {
      if(_controller.status == AnimationStatus.completed) {
        _controller.forward(from: 0.0);
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {

    _controller.forward();

    return AnimatedBuilder(
      animation: _controller,
      child: _completeStrip(),
      builder: (BuildContext context, Widget child) {
        return Transform.rotate(
          angle: _animation.value * math.pi,
          child: _completeStrip(),
        );
      },
    );

    return Transform.rotate(angle: 0.5 * math.pi, child: _completeStrip());
  }

  Widget _completeStrip() {
    final double stripBorderRadius = widget.stripContentRadius + 20;
    final double firstRingRadius   = widget.stripContentRadius + 15;
    final double firstRingFillRadius = widget.stripContentRadius + 13;
    final double secondRingRadius  = widget.stripContentRadius + 10;
    final double secondRingFillRadius = widget.stripContentRadius + 8;
    final double thirdRingRadius   = widget.stripContentRadius + 5;
    final double thirdRingFillRadius = widget.stripContentRadius + 3;

    final double internalGearRadius = 8;
    final double externalGearRadius = 20;

    return Stack(
      children: <Widget>[
        CircleAvatar(radius: stripBorderRadius, backgroundColor: stripColor),
        Positioned.fill(child: Align(alignment: Alignment.center, child: CircleAvatar(radius: firstRingRadius, backgroundColor: darkStripColor))),
        Positioned.fill(child: Align(alignment: Alignment.center, child: CircleAvatar(radius: firstRingFillRadius, backgroundColor: stripColor))),
        Positioned.fill(child: Align(alignment: Alignment.center, child: CircleAvatar(radius: secondRingRadius, backgroundColor: darkStripColor))),
        Positioned.fill(child: Align(alignment: Alignment.center, child: CircleAvatar(radius: secondRingFillRadius, backgroundColor: stripColor))),
        Positioned.fill(child: Align(alignment: Alignment.center, child: CircleAvatar(radius: thirdRingRadius, backgroundColor: darkStripColor))),
        Positioned.fill(child: Align(alignment: Alignment.center, child: CircleAvatar(radius: thirdRingFillRadius, backgroundColor: stripColor))),
        
        Positioned.fill(child: Align(alignment: Alignment.center, child: CircleAvatar(radius: externalGearRadius, backgroundColor: Colors.black45))),
        Positioned.fill(child: Align(alignment: Alignment.center, child: FaIcon(FontAwesomeIcons.cog, color: gearColor, size: 32,))),
        Positioned.fill(
          child: Align(alignment: Alignment.center, 
            child: Container(
              height: internalGearRadius * 2,
              width: internalGearRadius * 2,
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(width: 2, color: letterBackground),
                shape: BoxShape.circle
              ),
            )
          ),
        )
      ],
    );
  }
}

class SideSticker extends StatelessWidget {
  
  final double width = 22;
  final double height = 30;
  final double radius = 3;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: letterBackground,
        borderRadius: BorderRadius.circular(radius)
      ),
      child: Center(child: SvgPicture.asset('assets/images/side_a_icon.svg')),
    );
  }
}

class CicrularScrew extends StatelessWidget {
  
  final double _screwRadius = 10;
  final double _screwBorderRadius = 50;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(_screwBorderRadius),
      child: Stack(
        children: <Widget>[
          Container(
            height: _screwRadius * 2,
            width: _screwRadius * 2,
            decoration: BoxDecoration(
              color: screwColor,
              shape: BoxShape.circle,
            ),
          ),

          Positioned(
            right: -3,
            bottom: -3,
            child: Container(
              height: _screwRadius * 2,
              width: _screwRadius * 2,
              decoration: BoxDecoration(
                color: playerButtonShadow,
                shape: BoxShape.circle
              ),
            ),
          ),

          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Icon(Icons.add, color: Colors.black, size: 16,)
            ),
          )
        ],
      ),
    );
  }
}

class _StickerPainter extends CustomPainter {
  
  @override
  void paint(Canvas canvas, Size size) {
      // TODO: implement paint
      Paint paint = new Paint()
        ..color = yellowSticker
        ..style = PaintingStyle.fill;

      Paint borderPaint = new Paint()
        ..strokeWidth = 5
        ..color = lightBorderShadow
        ..style = PaintingStyle.stroke;

      Path path = new Path();
      path.moveTo(15, 0);
      path.lineTo(size.width - 15, 0);
      path.lineTo(size.width, 15);
      path.lineTo(size.width, size.height - 15);
      path.lineTo(size.width - 15, size.height);
      path.lineTo(size.width - 40, size.height);
      path.lineTo(size.width - 50, size.height - 45);
      path.lineTo(50, size.height - 45);
      path.lineTo(40, size.height);
      path.lineTo(15, size.height);
      path.lineTo(0, size.height - 15);
      path.lineTo(0, 15);
      path.lineTo(15, 0);

      canvas.drawPath(path, paint);
      canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
  
}

class _BasePainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
      
      Paint paint = new Paint()
        ..color = baseColor
        ..style = PaintingStyle.fill;

      Paint borderPaint = new Paint()
        ..strokeWidth = 3
        ..color = gearExternalColor
        ..style = PaintingStyle.stroke;

      Path path = new Path();
      path.moveTo(15, 0);
      path.lineTo(size.width - 15, 0);
      path.lineTo(size.width, size.height);
      path.lineTo(0, size.height);
      path.lineTo(15, 0);

      canvas.drawPath(path, paint);
      canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}

class _BaseVoidPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
      
      Paint paint = new Paint()
        ..color = cassetteColor
        ..style = PaintingStyle.fill;

      Paint borderPaint = new Paint()
        ..strokeWidth = 3
        ..color = lightBorderShadow
        ..style = PaintingStyle.stroke;

      Path path = new Path();
      path.moveTo(10, 0);
      path.lineTo(size.width - 10, 0);
      path.lineTo(size.width, size.height);
      path.lineTo(0, size.height);
      path.lineTo(10, 0);

      canvas.drawPath(path, paint);
      canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}
