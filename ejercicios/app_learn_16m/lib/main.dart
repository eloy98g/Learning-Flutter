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
    if(contador == 1){
      return OutlineButton(
        child: Text(contador1.toString()),
        onPressed:() => setState((){
          contador1++;
        }),
      );
    }else if(contador == 2){
      return OutlineButton(
        child: Text(contador2.toString()),
        onPressed:() => setState((){
          contador2++;
        }),
      );
    }

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
            child: Container(
              color: Colors.green,
              child: buildButton(1),
            )
          ),
          Expanded(
              child: Container(
                color: Colors.yellow,
                child: buildButton(2),
              )
          ),
        ],
      )
    );
  }
}
