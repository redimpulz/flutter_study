import 'package:flutter/material.dart';

// import 'package:sample_app/fetch_image.dart';
// import 'package:sample_app/counter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(ctx) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TopPage(),
    );
  }
}

class HelloMessage extends StatelessWidget {
  HelloMessage({@required this.name});
  final String name;

  @override
  Widget build(ctx) {
    return Container(child: Text(name));
  }
}

class TopPage extends StatelessWidget {
  @override
  Widget build(ctx) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sample_app'),
      ),
      body: HelloMessage(name: 'redimpulz'),
      // body: HelloCounter(),
      // body: HelloFetchImages1(
      //   imageNums: 10,
      // ),
      // body: HelloFetchImages2(
      //   imageNums: 10,
      // ),
    );
  }
}
