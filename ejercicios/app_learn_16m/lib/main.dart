import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OnTap game: ejercicio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget{
  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  int contador1 = 0;
  int contador2 = 0;

  Widget buildButton(int contador){
    int _contador = contador;
    return new OutlineButton(
      child: new Text(contador.toString()),
      onPressed:() => contador++,
      //AQUI HAY QUE HACER UN SETSTATE PARA QUE SE ACTUALICE EL VALOR
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('OnTap Game'),
        centerTitle: true,
      ),
      body: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height/2,
            width: MediaQuery.of(context).size.width,
            color: Colors.red,
          ),
          Container(
            height: MediaQuery.of(context).size.height/2,
            width: MediaQuery.of(context).size.width,
            color: Colors.green,
          ),
        ]),
      ),
    );
  }
}
