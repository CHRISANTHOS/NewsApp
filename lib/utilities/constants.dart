
class Constants{

  static String TOP_HEADLINES_URL = 'https://newsapi.org/v2/top-headlines?country=ng&apiKey=6a545aaa71104c9a951a46f4b068e41c';

  static String SEARCH_HEADLINES (String search){
    return 'https://newsapi.org/v2/everything?q=$search&apiKey=6a545aaa71104c9a951a46f4b068e41c';
  }

}