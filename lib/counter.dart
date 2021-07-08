import 'package:flutter/material.dart';

class HelloCounter extends StatefulWidget {
  HelloCounter({Key key}) : super(key: key);
  @override
  createState() => _HelloCounter();
}

class _HelloCounter extends State<HelloCounter> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$_counter'),
            TextButton(child: Text('+'), onPressed: _incrementCounter),
            TextButton(child: Text('-'), onPressed: _decrementCounter)
          ],
        ),
      ),
    );
  }
}
