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
              image: AssetImage('images/fondo.png'),
            ),
          ),
          constraints: BoxConstraints.expand(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Cassette(),
                  Cassette(),
                  Cassette(),
                  Cassette(),
                  Cassette(),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Cassette(),
                  Cassette(),
                  Cassette(),
                  Cassette(),
                  Cassette(),
                ],
              ),
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
    return GestureDetector(
      onTap: () {
        _showDialog(context);
      },
      child: Container(
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
                  'Retro Gaming Music',
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
                      child: Image.asset(
                        'images/Cass.png',
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
                            'Queen',
                            style: TextStyle(fontSize: 24.0),
                          ),
                          Divider(),
                          Row(
                            children: [
                              Expanded(
                                child: SongName(name: 'Cancion 1'),
                              ),
                              Expanded(
                                child: SongName(name: 'Cancion 2'),
                              ),
                            ],
                          ),
                          Divider(),
                          Row(
                            children: [
                              Expanded(
                                child: SongName(name: 'Cancion 4'),
                              ),
                              Expanded(
                                child: SongName(name: 'Cancion 5'),
                              ),
                            ],
                          ),
                          Divider(),
                          Row(
                            children: [
                              Expanded(
                                child: SongName(name: 'Cancion 7'),
                              ),
                              Expanded(
                                child: SongName(name: 'Cancion 8'),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  FlatButton(
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        'Reproducir',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class SongName extends StatelessWidget {
  final String name;
  const SongName({
    Key key,
    this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(
        fontFamily: 'Cassettes',
        // fontWeight: FontWeight.bold,
        fontSize: 18.0,
      ),
    );
  }
}
