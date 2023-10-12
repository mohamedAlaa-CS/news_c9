import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/models/NewsDataModel.dart';
import 'package:news/shared/component/constants.dart';

import '../../../models/Sourseresponse.dart';

class ApiManager {
  static Future<SourceResponse> getSources(String category) async {
    Uri url = Uri.https(Constants.BASE_URL, '/v2/top-headlines/sources',
        {'apiKey': Constants.API_KEY, 'category': category});
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    SourceResponse sourcesResponse = SourceResponse.fromJson(jsonData);
    if (response.statusCode == 200 && jsonData["status"] == "ok") {
      return sourcesResponse;
    } else {
      throw Exception('Faild to load sourse');
    }
  }

  static Future<NewsDataModel> getNewsData(String sourceId) async {
    Uri url = Uri.https(Constants.BASE_URL, '/v2/everything',
        {'apiKey': Constants.API_KEY, 'sources': sourceId});

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    NewsDataModel newsDataModel = NewsDataModel.fromJson(jsonData);
    return newsDataModel;
  }
}
