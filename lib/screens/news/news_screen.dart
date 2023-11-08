import 'package:flutter/material.dart';
import 'package:news/screens/news/widget/sourses_title.dart';
import 'package:news/shared/network/remote/api_manager.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key, this.CategoryId});
  final String? CategoryId;
  static const String routeName = 'news';

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  int curantSelect = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: ApiManager.getSources(widget.CategoryId!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Text('some thing wrong');
          }
          var sources = snapshot.data?.sources ?? [];

          return Column(
            children: [
              const SizedBox(height: 8),
              SourseTitle(
                sources: sources,
                index: curantSelect,
              )
            ],
          );
        },
      ),
    );
  }
}
