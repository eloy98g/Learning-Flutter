import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_bergman/details.dart';
import 'package:project_bergman/post.dart';

void main(){
  runApp(Aplicacion());
}

class Aplicacion extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project Bergman',
      home: Inicio(),
    );
  }

}

Future<List<Post>> cargar() async{
  final respuesta = await http.get('https://kubrik-api.herokuapp.com/v1/cordoba');

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
            leading: Text(post.year.toString()),//principio
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
        title: Text('Project Bergman'),
        backgroundColor: Colors.green,
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