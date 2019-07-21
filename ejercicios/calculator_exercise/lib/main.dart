import 'package:flutter/material.dart';

/// ESTA APLICACION DE EJEMPLO CONSTRUIDA EN FLUTTER
/// MUESTRA UN EJEMPLO DE CÓMO CONSTRUIR UNA CALCULADORA SENCILLA.
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String output = "0";

  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";
  String operations = "";

  buttonPressed(String buttonText){

    if(buttonText == "CLEAR"){
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
      operations = "";

    }else if (buttonText == "+" || buttonText == "-" || buttonText == "/" || buttonText == "x"){
      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";
      operations = operations + " " + buttonText + " ";

    }else if(buttonText == "."){
      if(_output.contains(".")){
        print("Already conatains a decimals");
        return;
      }else {
        _output = _output + buttonText;
        operations = operations + buttonText;
      }
    } else if (buttonText == "="){
      num2 = double.parse(output);
      if(operand == "+"){
        _output = (num1 + num2).toString();
        operations = _output;
      }
      if(operand == "-"){
        _output = (num1 - num2).toString();
        operations = _output;
      }
      if(operand == "x"){
        _output = (num1 * num2).toString();
        operations = _output;
      }
      if(operand == "/"){
        _output = (num1 / num2).toString();
        operations = _output;
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";

    }else{
      _output = _output + buttonText;
      operations = operations + buttonText;
    }
    print(_output);
    print(operations);
    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
      operations = operations;
    });

  }

  Widget buildButton(String buttonText) {
    return new Expanded(
      child: new OutlineButton(
        padding: new EdgeInsets.all(24.0),
        child: new Text(buttonText,
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold
          ),
        ),
        onPressed: () =>
            buttonPressed(buttonText),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora'),
        centerTitle: true,
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Container(
              alignment: Alignment.centerRight,
              padding: new EdgeInsets.symmetric(
                vertical: 24.0,
                horizontal: 12.0
              ),
              child: new Text(
                output,
                style: new TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            new Expanded(child: new Divider()),
            new Container(
              alignment: Alignment.centerRight,
              padding: new EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 12.0
              ),
              child: new Text(
                operations,
                style: new TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),

            new Column(children:[
              new Row(children: [
                buildButton("7"),
                buildButton("8"),
                buildButton("9"),
                buildButton("/"),
              ]),
              new Row(children: [
                buildButton("4"),
                buildButton("5"),
                buildButton("6"),
                buildButton("x"),
              ]),
              new Row(children: [
                buildButton("1"),
                buildButton("2"),
                buildButton("3"),
                buildButton("-"),
              ]),
              new Row(children: [
                buildButton("."),
                buildButton("0"),
                buildButton("00"),
                buildButton("+"),
              ]),
              new Row(children: [
                buildButton("CLEAR"),
                buildButton("="),
              ]),
            ]),
          ],
        ),
      ),
    );
  }
}
