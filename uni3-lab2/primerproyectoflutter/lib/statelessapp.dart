import 'package:flutter/material.dart';

class MyStatelessApp extends StatelessWidget {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Ejm StatelessWidget'),
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
              counter++;
              print(counter);
            },
          )),
    );
  }
}
