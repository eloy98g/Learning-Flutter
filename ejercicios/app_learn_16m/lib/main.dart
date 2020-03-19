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

  Widget buildButton(int contador, Color player){
    return new OutlineButton(
      child: new Text(contador.toString()),
      color: player,
      onPressed:() =>setState((){
        contador = contador++;
      }),
    );
  }

  /*Widget buttonPressed(int contador){
    int _contador = contador;

    setState((){
      contador = _contador++;
    });
  }*/

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('OnTap Game'),
        centerTitle: true,
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(

            child: buildButton(contador1, Colors.green),
          ),
          Expanded(
            child: buildButton(contador2, Colors.yellow),
          ),
        ],
      )
    );
  }
}
