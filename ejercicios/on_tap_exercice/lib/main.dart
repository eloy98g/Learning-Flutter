import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Running taps!',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Running Taps!'),
        ),
        body: ListView(
          children: [
            TabButton(),
          ],
        ),
      ),
    );
  }
}

class TabButton extends StatefulWidget {
  @override
  _MyTabButton createState() =>_MyTabButton();
}

class _MyTabButton extends State<TabButton> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MaterialButton(
                  child: Text(
                    '+',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  color: Colors.lightBlueAccent,
                  onPressed: () => _incrementCounter()
                ),
              ],
             ),
          ],
        ),
      ),
    );
  }
}
