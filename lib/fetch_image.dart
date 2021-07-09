import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class HelloFetchImages1 extends StatefulWidget {
  HelloFetchImages1({Key key, this.imageNums}) : super(key: key);
  final int imageNums;
  @override
  createState() => _HelloFetchImages1();
}

class _HelloFetchImages1 extends State<HelloFetchImages1> {
  List<String> _imageUrls = [];
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    final url = 'https://dog.ceo/api/breeds/image/random/${widget.imageNums}';
    final uri = Uri.parse(url);
    setState(() {
      _loading = true;
    });
    final res = await http.get(uri);
    final message = jsonDecode(res.body)['message'];
    setState(() {
      _imageUrls = message.cast<String>() as List<String>;
      _loading = false;
    });
  }

  void _clear() {
    setState(() {
      _imageUrls = [];
    });
  }

  @override
  Widget build(ctx) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextButton(child: Text('fetch'), onPressed: _fetchData),
          TextButton(child: Text('clear'), onPressed: _clear),
          Flexible(
            child: _loading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView(
                    children: _imageUrls.map((x) => Image.network(x)).toList()),
          )
        ],
      ),
    );
  }
}

class HelloFetchImages2 extends StatelessWidget {
  HelloFetchImages2({this.imageNums});
  final int imageNums;

  Future<List<String>> _fetchData() async {
    final url = 'https://dog.ceo/api/breeds/image/random/$imageNums';
    final uri = Uri.parse(url);
    final res = await http.get(uri);
    final message = jsonDecode(res.body)['message'];
    return message.cast<String>() as List<String>;
  }

  @override
  Widget build(ctx) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
              child: FutureBuilder<List<String>>(
                  future: _fetchData(),
                  builder: (ctx, dataSnapshot) {
                    return dataSnapshot.connectionState ==
                            ConnectionState.waiting
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView(
                            children: dataSnapshot.data
                                .map((x) => Image.network(x))
                                .toList());
                  }))
        ],
      ),
    );
  }
}
