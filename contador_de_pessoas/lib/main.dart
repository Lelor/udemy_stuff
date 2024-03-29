import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: "Contador de Pessoas", home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _people = 0;

  String _infoText = "Pode Entrar!";

  void _updatePeople(int delta) {
    setState(() {
      _people += delta;

      if (_people < 0) {
        _infoText = "Q doidera irmao!";
      } else if (_people <= 10) {
        _infoText = "Pode Entrar!";
      } else {
        _infoText = "Lotado!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset('images/restaurant.jpg', fit: BoxFit.cover, height: 1000),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Pessoas: $_people",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
                padding: EdgeInsets.all(10),
                child: FlatButton(
                  onPressed: () {
                    _updatePeople(-1);
                  },
                  child: Text("-1",
                      style: TextStyle(fontSize: 40, color: Colors.white)),
                )),
            Padding(
                padding: EdgeInsets.all(10),
                child: FlatButton(
                  onPressed: () {
                    _updatePeople(1);
                  },
                  child: Text("+1",
                      style: TextStyle(fontSize: 40, color: Colors.white)),
                )),
          ]),
          Text(_infoText,
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 30))
        ],
      )
    ]);
  }
}
