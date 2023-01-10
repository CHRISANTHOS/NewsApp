import 'package:flutter/material.dart';
import 'package:newsapp/viewmodels/newsArticleViewModel.dart';


class NewsArticleDetailsPage extends StatelessWidget {
  NewsArticleViewModel article;
  NewsArticleDetailsPage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
    );
  }
}
