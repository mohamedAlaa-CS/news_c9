import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/models/Sourseresponse.dart';
import 'package:news/screens/news/widget/source_item.dart';
import 'package:news/screens/news_details/news_details.dart';
import 'package:news/shared/network/remote/api_manager.dart';

import '../../../models/NewsDataModel.dart';
import '../../../shared/component/constants.dart';

class SourseTitle extends StatefulWidget {
  SourseTitle({super.key, required this.sources, required this.index});
  final List<Sources> sources;
  int index;

  @override
  State<SourseTitle> createState() => _SourseTitleState();
}

class _SourseTitleState extends State<SourseTitle> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Expanded(
      child: Column(
        children: [
          DefaultTabController(
            length: widget.sources.length,
            child: TabBar(
              onTap: (value) {
                widget.index = value;
                setState(() {});
              },
              indicatorColor: Colors.transparent,
              isScrollable: true,
              tabs: widget.sources.map((e) {
                return SourceItem(
                    text: e.name ?? '',
                    isSelected: widget.sources.indexOf(e) == widget.index);
              }).toList(),
            ),
          ),
          FutureBuilder(
            future:
                ApiManager.getNewsData(widget.sources[widget.index].id ?? ''),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return const Text('some thing wrong');
              }
              var artical = snapshot.data?.articles ?? [];
              return Expanded(
                child: ListView.separated(
                  itemCount: artical.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(NewDetails.routeName,
                          arguments: NewsDetails(
                              articl: artical[index], index: index));
                    },
                    child: Container(
                        margin: const EdgeInsets.only(
                            top: 8, left: 8, right: 8, bottom: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                                width: 1.5, color: Colors.deepOrange)),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16)),
                              child: Hero(
                                tag: 'image$index',
                                child: CachedNetworkImage(
                                  height: mediaQuery.height * 0.25,
                                  width: double.infinity,
                                  fit: BoxFit.fill,
                                  imageUrl: artical[index].urlToImage ?? '',
                                  placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator(
                                      color: Constants.primaryColorLight,
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Center(child: Icon(Icons.error)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    widget.sources[widget.index].id ?? '',
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        color: const Color(0xff79828B)),
                                  ),
                                  Text(artical[index].title ?? '',
                                      style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis),
                                  const SizedBox(height: 5),
                                  Text(
                                    artical[index]
                                            .publishedAt
                                            ?.substring(0, 10) ??
                                        '',
                                    textAlign: TextAlign.end,
                                  )
                                ],
                              ),
                            ),
                          ],
                        )),
                  ),
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(
                    height: 0,
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class NewsDetails {
  final Articles articl;
  final int index;

  NewsDetails({required this.articl, required this.index});
}
