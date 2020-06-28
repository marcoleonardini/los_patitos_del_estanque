import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('images/wood.jpg'),
            ),
          ),
          constraints: BoxConstraints.expand(),
          child: Row(
            children: <Widget>[
              Cassette(),
              Cassette(),
              Cassette(),
              Cassette(),
            ],
          ),
        ),
      ),
    );
  }
}

class Cassette extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 200,
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
                'Retro Gaming Music Leonardini Gutierrez',
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Divider(
            thickness: 1,
            color: Colors.black38,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 4.0, right: 4.0, bottom: 4.0),
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
          vertical: BorderSide(color: Colors.black.withOpacity(0.75), width: 5),
          horizontal: BorderSide(color: Colors.blueGrey, width: 3),
        ),
      ),
    );
  }
}
