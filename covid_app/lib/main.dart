import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:covidapp/post.dart';
import 'package:flag/flag.dart';
import 'package:covidapp/details.dart';


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

/*
Future<List<Post>> cargar()async{
  final respuesta = await http.get('https://thevirustracker.com/free-api?countryTotal=US');


  if(respuesta.statusCode == 200){
    return (json.decode(respuesta.body) as List).map((post) => Post.fromJson(post)).toList();
  }else{
    throw Exception('Fallo al cargar datos');
  }
}*/

Future<Post> cargar() async {
  final respuesta = await http.get('https://thevirustracker.com/free-api?countryTotal=US');

  return Post.fromJson(json.decode(respuesta.body));

}
/*
class Inicio extends StatelessWidget{
  Widget renderizar(BuildContext context,  AsyncSnapshot<List<Post>> snapshot){
    if(snapshot.hasError){
      return Text('Error!');
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
    }
  }*/

class Inicio extends StatelessWidget{
  Widget renderizar(BuildContext context,  AsyncSnapshot<Post> snapshot){
    final Post post = snapshot.data;
    if(snapshot.hasError){
      return Text('Error!');
    }else if(snapshot.hasData){
      return ListTile(
          leading: Flags.getFullFlag('ES', null, null),
          title: Text(snapshot.data.countrydata.info.title),
          onTap: (){
            return Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PostDetails(post)),
            );
          }
      );
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
            child: FutureBuilder<Post>(
              builder: renderizar,
              future: cargar(),
            )
        )
    );
  }
}
