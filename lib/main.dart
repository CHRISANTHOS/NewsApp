import 'package:flutter/material.dart';
import 'package:newsapp/pages/newsListPage.dart';
import 'package:newsapp/viewmodels/newsArticleListViewModel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Latest News',
      home: ChangeNotifierProvider(
          create: (BuildContext context) => NewsArticleListViewModel(),
              child: NewsListPage(),
      )
    );
  }
}
