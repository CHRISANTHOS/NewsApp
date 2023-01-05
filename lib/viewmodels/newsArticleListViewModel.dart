import 'package:flutter/foundation.dart';
import 'package:newsapp/models/newsArticle.dart';
import 'package:newsapp/services/webservices.dart';

import 'newsArticleViewModel.dart';

class NewsArticleListViewModel extends ChangeNotifier{

  List<NewsArticleViewModel> articles = <NewsArticleViewModel>[];

  NewsArticleListViewModel(){
    _populateTopHeadlines();
  }

  Future<void> _populateTopHeadlines()async{
    List<NewsArticle> newsArticle = await WebServices().fetchTopHeadlines();
    articles = newsArticle.map((article) => NewsArticleViewModel(article: article)).toList();
    notifyListeners();
  }

}