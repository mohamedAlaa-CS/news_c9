import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/shared/component/constants.dart';
import 'package:url_launcher/url_launcher.dart';

import '../news/widget/sourses_title.dart';

class NewDetails extends StatelessWidget {
  static const String routeName = 'news_details';

  const NewDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var arg = ModalRoute.of(context)!.settings.arguments as NewsDetails;
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/backgroung.png'),
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: mediaQuery.height / 10,
          title: const Text('News Title'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16)),
                  child: Hero(
                    tag: 'image${arg.index}',
                    child: CachedNetworkImage(
                      imageUrl: arg.articl.urlToImage ?? '',
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
                const SizedBox(height: 10),
                Text(
                  arg.articl.source!.name!,
                  style: GoogleFonts.poppins(
                      fontSize: 16, color: const Color(0xff79828B)),
                ),
                Text(
                  arg.articl.title ?? '',
                  style: GoogleFonts.poppins(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  arg.articl.publishedAt?.substring(0, 10) ?? '',
                  textAlign: TextAlign.end,
                ),
                const SizedBox(height: 8),
                Text(
                  arg.articl.description ?? '',
                  style: GoogleFonts.poppins(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Text(
                  arg.articl.content ?? '',
                  style: GoogleFonts.poppins(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          _launchUrl(arg.articl.url ?? '');
                        },
                        child: const Text(
                          'View Full Article',
                          style: TextStyle(fontSize: 18),
                        )),
                    const Icon(Icons.arrow_forward_ios_outlined)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    var url0 = Uri.parse(url);
    if (!await launchUrl(url0, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url0');
    }
  }
}
