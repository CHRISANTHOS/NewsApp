import 'package:flutter/material.dart';
import 'package:newsapp/viewmodels/newsArticleListViewModel.dart';
import 'package:provider/provider.dart';
import 'newsList.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

String? search;
class NewsListPage extends StatefulWidget {
  @override
  State<NewsListPage> createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .populateTopHeadlines();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text('Latest News'),
        ),
        body: ProgressHUD(
          child: Builder(builder: (context) {
            return Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                            icon: Icon(Icons.search),
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
                          final progress = ProgressHUD.of(context);
                          progress?.show();
                          FocusScopeNode currentFocus = FocusScope.of(context);
                          currentFocus.unfocus();
                          Provider.of<NewsArticleListViewModel>(context, listen: false)
                              .populateSearchHeadlines(search!);
                          progress?.dismiss();
                        },
                        child: Text('search', style: TextStyle(color: Colors.white),),
                      ),
                    )
                  ],
                ),
                Expanded(
                    child: Container(
                  child: NewsList(),
                ))
              ],
            );
          }),
        ));
  }
}
