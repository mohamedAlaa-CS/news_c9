import 'package:flutter/material.dart';

import '../../shared/network/remote/api_manager.dart';
import '../news/widget/news_item.dart';
import '../news/widget/sourses_title.dart';
import '../news_details/news_details.dart';

class Search extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return null;
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.searchData(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return const Text('some thing wrong');
        }
        var artical = snapshot.data?.articles ?? [];
        return Expanded(
          child: ListView.builder(
            itemCount: artical.length,
            itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(NewDetails.routeName,
                      arguments:
                          NewsDetails(articl: artical[index], index: index));
                },
                child: NewsItem(
                  index: index,
                  artical: artical,
                )),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.searchData(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return const Text('some thing wrong');
        }
        var artical = snapshot.data?.articles ?? [];
        return Expanded(
          child: ListView.builder(
            itemCount: artical.length,
            itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(NewDetails.routeName,
                      arguments:
                          NewsDetails(articl: artical[index], index: index));
                },
                child: NewsItem(
                  index: index,
                  artical: artical,
                )),
          ),
        );
      },
    );
  }
}
