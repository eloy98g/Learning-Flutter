import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:covidapp/post.dart';
import 'dart:async' show Future;

Future<Global> cargarGlobal()async{
  final respuesta = await http.get('https://thevirustracker.com/free-api?global=stats');

  if(respuesta.statusCode == 200){
    Global post = Global.fromJson(json.decode(respuesta.body));
    return post;
  }else{
    throw Exception('Error al cargar los datos');
  }
}

@override
class GlobalStats extends StatelessWidget{
  Widget TextSlotGlobal(String text, Color color) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: 18.5
      ),
    );
  }

  Widget SlotGlobal(String data, String text, Color color) {
    return Column(
      children: [
        Expanded(
          child: Column(
            children: [
              TextSlotGlobal(data, color),
            ],
          ),
        ),
        Expanded(
          child:
            Column(
              children: [
                TextSlotGlobal(text, color),
              ],
            ),
        ),
      ],
    );
  }

  Widget DoubleSlotGlobal(String topData, String topText, String botData,
      String botText, Color color, bool CompleteRow) {
    if (CompleteRow == false) {
      return Container(
        //padding: new EdgeInsets.all(15.0),
        //margin: EdgeInsets.all(8.0),

        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Container(
                    color: Color.fromRGBO(253, 245, 243, 0.3),
                    padding: new EdgeInsets.all(15.0),
                    margin: EdgeInsets.all(8.0),
                    child: SlotGlobal(topData, topText, color),
                  )
              ),
              /*Divider(
                color: Colors.black,
                height: 3,
                thickness:3,
              ),*/
              Expanded(
                  child: Container(
                    color: Color.fromRGBO(253, 245, 243, 0.3),
                    padding: new EdgeInsets.all(15.0),
                    margin: EdgeInsets.all(8.0),
                    child: SlotGlobal(botData, botText, color),
                  )
              ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        color: Color.fromRGBO(253, 245, 243, 0.3),
        padding: new EdgeInsets.all(15.0),
        margin: EdgeInsets.all(8.0),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: SlotGlobal(topData, topText, color),
              ),
            ],
          ),
        ),
      );
    }
  }

  @override
  Widget rendGlobalStats(BuildContext context, AsyncSnapshot<Global> snapshot) {
    if (snapshot.hasError) {
      return Text('Error!');
    } else if (snapshot.hasData) {
      final Global post = snapshot.data;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: DoubleSlotGlobal(
              post.results[0].totalCases.toString(),
              'GLOBAL CASES',
              '+' + post.results[0].total_new_cases_today.toString(),
              'CASES TODAY',
              Colors.black,
              false,
            ),
          ),
          Expanded(
            child: DoubleSlotGlobal(
              post.results[0].total_deaths.toString(),
              'GLOBAL DEATHS',
              '+' + post.results[0].total_new_deaths_today.toString(),
              'DEATHS TODAY',
              Colors.black,
              false,
            ),
          ),
          Expanded(
            child: DoubleSlotGlobal(
              post.results[0].total_recovered.toString(),
              'TOTAL RECOVERED',
              '',
              '',
              Colors.black,
              true,
            ),
          ),
        ],
      );
    }else {
      return Center(
        child: Container(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        )
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}

