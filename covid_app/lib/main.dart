import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:covidapp/post.dart';

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

Future<List<Post>> cargar()async{
  final respuesta = await http.get('https://jsonplaceholder.typicode.com/posts/');

  if(respuesta.statusCode == 200){
    return (json.decode(respuesta.body) as List).map((post) => Post.fromJson(post)).toList();
  }else{
    throw Exception('Fallo al cargar datos');
  }
}

class Inicio extends StatelessWidget{
  Widget renderizar(BuildContext context,  AsyncSnapshot<List<Post>> snapshot){
    if(snapshot.hasError){
      return Text('Error!');
    }else if(snapshot.hasData){
      return ListView.separated(
          itemBuilder: (context, i){
            final Post post = snapshot.data[i];
            return ListTile(
              leading: Text(post.id.toString()),
              title: Text(post.title),
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
