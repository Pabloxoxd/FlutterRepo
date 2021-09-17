import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: "Contador de Pessoas",
      home: Home()));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _people = 0;
  String _infoText = "Pode Entrar!";

  void _ChangedPeople(int delta){
    setState(() {
      _people +=delta;

      if(_people < 0){
        _infoText = "Mundo Invertido de ponta cabeça pra baixo";
      }
      else if(_people > 15){
        _infoText = "Lotado!";
      }
      else {
        _infoText = "Pode Entrar!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/restaurant.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Pessoas: $_people",
              style:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextButton(
                    child: Text(
                      "+1",
                      style: TextStyle(fontSize: 40.0, color: Colors.yellow),
                    ),
                    onPressed: () {
                      _ChangedPeople(1);
                      },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextButton(
                    child: Text(
                      "-1",
                      style: TextStyle(fontSize: 40.0, color: Colors.yellow),
                    ),
                    onPressed: () {
                      _ChangedPeople(-1);
                      },
                  ),
                ),
              ],
            ),
            Text(
              "$_infoText",
              style: TextStyle(
                  color: Colors.green,
                  fontStyle: FontStyle.italic,
                  fontSize: 30.0),
            )
          ],
        )
      ],
    );
  }
}
