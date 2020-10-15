import 'package:flutter/material.dart';

class MyStatefulApp extends StatefulWidget {
  @override
  _MyStatefulAppState createState() => _MyStatefulAppState();
}

class _MyStatefulAppState extends State<MyStatefulApp> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Ejm StatefulWidget'),
          ),
          body: Center(
            child: Text(
              counter.toString(),
              style: TextStyle(fontSize: 40),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.plus_one),
            onPressed: () {
              //counter++;
              //print(counter);
              setState(() {
                counter++;
                print(counter);
              });
            },
          )),
    );
  }
}
