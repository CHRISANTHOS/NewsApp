import 'package:flutter/material.dart';
import 'package:newsapp/viewmodels/newsArticleListViewModel.dart';
import 'package:provider/provider.dart';
import 'newsList.dart';
import 'package:newsapp/viewmodels/newsArticleViewModel.dart';
import 'newsArticleDetailsPage.dart';

String? search;
class NewsListPage extends StatefulWidget {
  @override
  State<NewsListPage> createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {

  TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .populateTopHeadlines();
  }

  void _newsListDetails (BuildContext context, NewsArticleViewModel article){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> NewsArticleDetailsPage(article: article)));
  }

  Widget _builder(BuildContext context, NewsArticleListViewModel vm){
    switch (vm.loadingStatus){
      case LoadingStatus.searching:
        return Align(child: CircularProgressIndicator());
      case LoadingStatus.empty:
        return Align(child: Text('No results found'));  
      case LoadingStatus.completed:
        return NewsList(onSelected: (article){
          _newsListDetails(context, article);
        },);
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text('Latest News'),
          actions: [
            IconButton(onPressed: (){
              Provider.of<NewsArticleListViewModel>(context, listen: false).populateTopHeadlines();
              // print('done');
            }, icon: Icon(Icons.refresh))
          ],
        ),
        body: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                          icon: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Icon(Icons.search),
                          ),
                          hintText: 'Search',
                          hintStyle: TextStyle(color: Colors.grey)),
                      onChanged: (value) {
                        search = value;
                      },
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
                      ),
                      onPressed: (){
                        _controller.clear();
                        FocusScopeNode currentFocus = FocusScope.of(context);
                        currentFocus.unfocus();
                        Provider.of<NewsArticleListViewModel>(context, listen: false)
                            .populateSearchHeadlines(search!);
                      },
                      child: Text('search', style: TextStyle(color: Colors.white),),
                    ),
                  )
                ],
              ),
              Expanded(
                  child: Container(
                child: _builder(context, Provider.of<NewsArticleListViewModel>(context)),
              ))
            ],
          )
        );
  }
}
