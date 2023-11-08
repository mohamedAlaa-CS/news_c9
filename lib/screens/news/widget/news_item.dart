import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/NewsDataModel.dart';
import '../../../shared/component/constants.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({super.key, required this.index, required this.artical});
  final int index;
  final List<Articles> artical;
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Card(
      margin: const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 8,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16)),
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
                Text(artical[index].title ?? '',
                    style: GoogleFonts.poppins(
                        fontSize: 18, fontWeight: FontWeight.w500),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis),
                const SizedBox(height: 5),
                Text(
                  artical[index].publishedAt?.substring(0, 10) ?? '',
                  textAlign: TextAlign.end,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
