import 'package:flutter/material.dart';
import 'package:tutorial_api_chechu/post.dart';

class PostDetails extends StatelessWidget{
  final Post post;

  PostDetails(this.post);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Card(//Te pone las cosas dentro de una carta
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(post.id.toString()),
                  ],
                ),
                Text(post.title),
                Text(post.body),
              ]
            ),
        ),
      ),
    );
  }
}