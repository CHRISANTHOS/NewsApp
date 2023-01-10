import 'package:flutter/material.dart';
import 'package:newsapp/viewmodels/newsArticleViewModel.dart';
import 'package:provider/provider.dart';
import 'package:newsapp/viewmodels/newsArticleListViewModel.dart';
import 'newsArticleDetailsPage.dart';

class NewsList extends StatelessWidget {

  final Function(NewsArticleViewModel article) onSelected;
  NewsList({required this.onSelected});


  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<NewsArticleListViewModel>(context);
    return ListView.builder(
        itemCount: vm.articles.length,
        itemBuilder: (context, index){
          return ListTile(
            onTap: (){
              onSelected(vm.articles[index]);
            },
            leading: Container(
              width: 100,
              height: 100,
              child: vm.articles[index].imageUrl == null ? Image.asset('images/news.png'):Image.network(vm.articles[index].imageUrl),
            ),
            title: Text(vm.articles[index].title),
          );
        }
    );
  }
}
