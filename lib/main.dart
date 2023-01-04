import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Latest News',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Latest News'),
        ),
        body: Text('Latest news will be displayed here...'),
      ),
    );
  }
}
