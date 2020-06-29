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
              SizedBox(
                width: double.infinity,
                height: 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Cassette(
                      albumName: 'Retro music',
                    );
                  },
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Cassette(
                      albumName: 'Retro music',
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Cassette extends StatelessWidget {
  final String albumName;

  const Cassette({Key key, this.albumName}) : super(key: key);
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
                  albumName,
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
                          Expanded(
                            child: ListView.separated(
                              separatorBuilder: (_, __) => Divider(),
                              itemCount: 50,
                              itemBuilder: (context, index) {
                                return SongName(
                                  name: index.toString(),
                                );
                              },
                            ),
                          ),
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

// Widget que son los nombre de las canciones
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
