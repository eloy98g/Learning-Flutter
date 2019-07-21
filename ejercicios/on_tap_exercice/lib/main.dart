import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Runnin taps!',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  Widget buildButton(String buttonText) {
    return new Expanded(
      child: new OutlineButton(
        //padding: new EdgeInsets.symmetric(),
        child: new Text(buttonText,
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Running taps!'),
        centerTitle: true,
      ),
      body: new Container(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            new Row(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buildButton("Player 1"),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                buildButton("Player 2"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/*
 @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Running taps!'),
        centerTitle: true,
      ),
      body: new Container(
        child: new Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:<Widget>[
          new Column(

            children:[
              new Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                buildButton("Player 1"),
              ]),
              new Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                buildButton("Player 2"),
              ]),
              ]),
            ],
          ),
      ),
    );
  }
*/