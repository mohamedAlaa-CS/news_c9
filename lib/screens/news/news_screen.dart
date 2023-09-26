import 'package:flutter/material.dart';
import 'package:news/screens/news/widget/source_item.dart';
import 'package:news/shared/network/remote/api_manager.dart';

class NewsScreen extends StatefulWidget {
   const NewsScreen({super.key, });
 static const String routeName = 'news';
  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
 bool select = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      FutureBuilder(
        future: ApiManager.getSources(),
        builder: ( context, snapshot) {
          if(snapshot.connectionState ==  ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
               }
          if(snapshot.hasError){
            return const Text('some thing wrong');
          }
          var sources = snapshot.data?.sources ??[];

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 40,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder:(context, index)=> const SizedBox(width: 5,),
                      itemBuilder: (context, index){
                        return InkWell(
                            onTap: (){
                             select = !select;
                             setState(() {

                             });
                            },
                            child: SourceItem(text: sources[index].name ?? '',isSelected: select,));
                      },
                  itemCount: sources.length ,
                  ),
                ),
              ),
            ],
          );
        },
  ),
    );
  }
}
