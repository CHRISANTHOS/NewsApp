import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/models/newsArticle.dart';
import 'package:newsapp/services/webservices.dart';

import 'newsArticleViewModel.dart';

enum LoadingStatus{
  searching,
  empty,
  completed
}
class NewsArticleListViewModel extends ChangeNotifier{

  var loadingStatus = LoadingStatus.searching;

  List<NewsArticleViewModel> articles = <NewsArticleViewModel>[];


  Future<void> populateTopHeadlines()async{
    loadingStatus = LoadingStatus.searching;
    List<NewsArticle> newsArticle = await WebServices().fetchTopHeadlines();
    articles = newsArticle.map((article) => NewsArticleViewModel(article: article)).toList();
    loadingStatus = articles.isEmpty ? LoadingStatus.empty : LoadingStatus.completed;
    notifyListeners();
  }

  Future<void> populateSearchHeadlines(String search)async{
    loadingStatus = LoadingStatus.searching;
    List<NewsArticle> newsArticle = await WebServices().searchHeadlines(search);
    articles = newsArticle.map((article) => NewsArticleViewModel(article: article)).toList();
    loadingStatus = articles.isEmpty ? LoadingStatus.empty : LoadingStatus.completed;
    notifyListeners();
  }

}