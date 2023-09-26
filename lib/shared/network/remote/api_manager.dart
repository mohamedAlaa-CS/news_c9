
import 'dart:convert';

import 'package:http/http.dart' as http ;
import 'package:news/shared/component/constants.dart';

import '../../../models/Sourseresponse.dart';


class ApiManager
{
static Future<SourceResponse> getSources()async{
   Uri url = Uri.https(Constants.BASE_URL,'/v2/top-headlines/sources',
   {'apiKey' : Constants.API_KEY}
   );
  var response = await  http.get(url);
  var jsonData = jsonDecode(response.body);
   SourceResponse sourcesResponse = SourceResponse.fromJson(jsonData);
  return sourcesResponse;
 }
}