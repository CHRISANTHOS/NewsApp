import 'dart:convert';
import 'package:newsapp/utilities/constants.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/models/newsArticle.dart';

class WebServices{

  Future<List<NewsArticle>> fetchTopHeadlines()async{

    http.Response response = await http.get(Uri.parse(Constants.TOP_HEADLINES_URL));

    if(response.statusCode == 200){
      final result = jsonDecode(response.body);
      Iterable list = result['articles'];
      print('done');
      return list.map((article) => NewsArticle.fromJson(article)).toList();
    }else{
      throw Exception('Can\'t get news data');
    }

  }
  Future<List<NewsArticle>> searchHeadlines(String search)async{

    http.Response response = await http.get(Uri.parse(Constants.SEARCH_HEADLINES(search)));

    if(response.statusCode == 200){
      final result = jsonDecode(response.body);
      Iterable list = result['articles'];
      print('done');
      return list.map((article) => NewsArticle.fromJson(article)).toList();
    }else{
      throw Exception('Can\'t get news data');
    }

  }

}

