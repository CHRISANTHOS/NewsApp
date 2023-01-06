import 'package:flutter/material.dart';
import 'package:newsapp/viewmodels/newsArticleListViewModel.dart';
import 'package:provider/provider.dart';

class NewsList extends StatefulWidget {

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<NewsArticleListViewModel>(context, listen: false).populateTopHeadlines();
  }
  @override
  Widget build(BuildContext context) {

    final vm = Provider.of<NewsArticleListViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Latest News'),
      ),
      body: ListView.builder(
        itemCount: vm.articles.length,
          itemBuilder: (context, index){
          return ListTile(
            leading: Container(
              width: 100,
              height: 100,
              child: vm.articles[index].imageUrl == null ? Image.asset('images/news.png'):Image.network(vm.articles[index].imageUrl),
            ),
            title: Text(vm.articles[index].title),
          );
          }
      ),
    );
  }
}
