import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'package:http/http.dart' show Client;
import 'package:covidapp/post.dart';
import 'package:flag/flag.dart';
import 'package:covidapp/details.dart';

import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;


void main(){
  runApp(Aplicacion());
}

var debug;

class Aplicacion extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'CoVid App',
      home: Inicio(),
    );
  }
}

/*
Future<List<Post>> cargar()async{
  final respuesta = await http.get('https://thevirustracker.com/free-api?countryTotal=US');
  print('[http.get done]');
  print('respuesta: $respuesta');

  if(respuesta.statusCode == 200){
    return (json.decode(respuesta.body) as List).map((post) => Post.fromJson(post)).toList();
  }else{
    //debug = throw Exception('Error al cargar los datos');
    if(respuesta.statusCode == 200){
      debug = 'json null';
    }else{
      debug = respuesta.statusCode;
    }
  }
}*/

Future<Global> cargar()async{
  final respuesta = await http.get('https://thevirustracker.com/free-api?global=stats');

  Global post = Global.fromJson(json.decode(respuesta.body));
  return post;
}

/*
class Inicio extends StatelessWidget{
  Widget renderizar(BuildContext context,  AsyncSnapshot<List<Post>> snapshot){
    if(snapshot.hasError){
      return Text(debug.toString());
    }else if(snapshot.hasData){
      return ListView.separated(
          itemBuilder: (context, i){
            final Post post = snapshot.data[i];
            return ListTile(
              leading: Flags.getFullFlag('ES', null, null),
              title: Text(post.countrydata.info.title),
              onTap: (){
                return Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PostDetails(post)),
                );
              }
            );
          },
          separatorBuilder: (context, i){
            return Divider();
          },
          itemCount: snapshot.data.length,
      );
    }else{
      return CircularProgressIndicator();
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text('CoVid-19 App'),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: FutureBuilder<List<Post>>(
            builder: renderizar,
            future: cargar(),
          )
        )
    );
  }
}
 */

class Inicio extends StatelessWidget{
  Widget renderizar(BuildContext context,  AsyncSnapshot<Global> snapshot){
    if(snapshot.hasError){
      return Text('Error!');
    }else if(snapshot.hasData){
      final Global post = snapshot.data;
      int total_cases = post.results[0].totalCases;
      print(snapshot.toString());
      print(total_cases);
      return Column(
        children: <Widget>[
          Text('Total casos: $total_cases'),
        ],
      );
    }else{
      return CircularProgressIndicator();
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text('CoVid-19 App'),
          backgroundColor: Colors.green,
        ),
        body: Center(
            child: FutureBuilder<Global>(
              builder: renderizar,
              future: cargar(),
            )
        )
    );
  }
}
