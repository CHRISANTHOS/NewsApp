

import 'package:newsapp/models/newsArticle.dart';

class NewsArticleViewModel{

  NewsArticle _newsArticle;

  NewsArticleViewModel({required NewsArticle article}): _newsArticle = article;

  String get title{
    return _newsArticle.title;
  }
  String get description{
    return _newsArticle.description;
  }
  String get imageUrl{
    return _newsArticle.urlToImage;
  }
  String get url{
    return _newsArticle.url;
  }

}