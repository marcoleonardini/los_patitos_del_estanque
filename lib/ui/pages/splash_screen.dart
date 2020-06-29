import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:los_patitos_del_estanque/src/ui/app_colors.dart';

import 'home_page.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(seconds: 5), () {
        Navigator.pushReplacement(
          context,
          CupertinoPageRoute(builder: (_) => HomePage())
        );
      });
    });

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: splashColor,
        child: Center(
          child: Container(
            height: 200,
            width: 200,
            child: Image.asset('assets/images/logo.png'),
          ),
        ),
      ),
    );

  }
}