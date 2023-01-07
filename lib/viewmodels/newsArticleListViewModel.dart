import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/models/newsArticle.dart';
import 'package:newsapp/services/webservices.dart';

import 'newsArticleViewModel.dart';

class NewsArticleListViewModel extends ChangeNotifier{

  List<NewsArticleViewModel> articles = <NewsArticleViewModel>[];


  Future<void> populateTopHeadlines()async{
    List<NewsArticle> newsArticle = await WebServices().fetchTopHeadlines();
    articles = newsArticle.map((article) => NewsArticleViewModel(article: article)).toList();
    notifyListeners();
  }

  Future<void> populateSearchHeadlines(String search)async{
    List<NewsArticle> newsArticle = await WebServices().searchHeadlines(search);
    articles = newsArticle.map((article) => NewsArticleViewModel(article: article)).toList();
    notifyListeners();
  }

}