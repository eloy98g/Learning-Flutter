import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tutorial_api_chechu/details.dart';
import 'package:tutorial_api_chechu/post.dart';

void main(){
  runApp(Aplicacion());
}

class Aplicacion extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Api de prueba',
      home: Inicio(),
    );
  }

}

Future<List<Post>> cargar() async{
  final respuesta = await http.get('https://jsonplaceholder.typicode.com/posts/');

  if(respuesta.statusCode == 200){//200 = codigo de olrait
    return (json.decode(respuesta.body) as List).map((post) => Post.fromJson(post)).toList();//para cada (post) que es cada elemento completo, devuelve una lista de posts
  }else{
    throw Exception('Fallo al descargar');
  }
}

class Inicio extends StatelessWidget{
  Widget renderizar(BuildContext context, AsyncSnapshot<List<Post>> snapshot){
    if(snapshot.hasError){
      return Text('Error!');
    }else if(snapshot.hasData){
      return ListView.separated(
        itemCount: snapshot.data.length,
        separatorBuilder: (context, i){
          return Divider();//Se puede ponder cualquier cosa
        },
        itemBuilder: (context, i){
          final Post post = snapshot.data[i];
          return ListTile(
            leading: Text(post.id.toString()),//principio
            //trailing para el final
            title: Text(post.title),
            onTap: (){//Al pulsar
              return Navigator.push(//push empuja una nueva ventana y pop vuelve atras, dos parametros
                context,//context porque si
                //Envia a postdetails
                MaterialPageRoute(builder: (context) => PostDetails(post)),
              );
            },
          );
        },
      );
    }else{
      return CircularProgressIndicator();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Chechu'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: FutureBuilder<List<Post>>(
          builder: renderizar,
          future: cargar(),
        ),
      ),
    );
  }
}