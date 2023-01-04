import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp/models/newsArticle.dart';

class WebServices{

  String url = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=6a545aaa71104c9a951a46f4b068e41c';

  Future<List<NewsArticle>> fetchTopHeadlines()async{

    http.Response response = await http.get(Uri.parse(url));

    if(response.statusCode == 200){
      final result = jsonDecode(response.body);
      Iterable list = result['articles'];
      return list.map((article) => NewsArticle.fromJson(article)).toList();
    }else{
      throw Exception('Can\'t get news data');
    }

  }

}

