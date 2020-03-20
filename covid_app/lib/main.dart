import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main(){
  runApp(Aplicacion());
}

class Aplicacion extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'CoVid App',
      home: Inicio(),
    );
  }
}

class Inicio extends StatelessWidget{

}

@override
Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(
      title: Text('CoVid-19 App'),
      backgroundColor: Colors.green,
    ),
    body: Center(

    )
  );
}