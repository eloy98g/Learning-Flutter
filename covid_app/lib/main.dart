import 'package:flutter/material.dart';
import 'package:covidapp/post.dart';
import 'package:covidapp/GlobalStats.dart';
import 'package:covidapp/CountryList.dart';


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

class Inicio extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('CoVid-19 App'),
        centerTitle: true,
        backgroundColor: Colors.teal[600],

      ),
      body: Container(
        decoration: new BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.blue[900]],
            stops: [0.2, 0.9],
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: FutureBuilder<Global>(
                builder: GlobalStats().rendGlobalStats,
                future: cargarGlobal(),
              )
            ),
            Expanded(
                child: FutureBuilder<List<Country>>(
                  builder: CountryList().rendCountriesStats,
                  future: cargarCountryList(),
                )
            ),
          ],
        )
      )
    );
  }
}