import 'package:flutter/material.dart';
import 'package:newsapp/viewmodels/newsArticleViewModel.dart';
import 'package:webview_flutter/webview_flutter.dart';


class NewsArticleDetailsPage extends StatelessWidget {
  NewsArticleViewModel article;
  NewsArticleDetailsPage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {

    WebViewController controller = WebViewController()
      ..loadRequest(Uri.parse(article.url));

    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
