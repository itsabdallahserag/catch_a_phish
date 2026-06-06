import 'dart:convert';

import 'package:catch_a_phish/api/api_constants.dart';
import 'package:catch_a_phish/api/end_points.dart';
import 'package:http/http.dart' as http;

import 'models/message/PredictResponce.dart';
class ApiManager {
  static Future<PredictResponce> spamCheck(String spamMessage) async {
  try{
    Uri url = Uri.https(
    ApiConstants.spamBaseUrl,
    EndPoints.spamApiName,
  );

  var response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode({
      'text': spamMessage,
    }),
  );
  var responceBody = response.body ;
  var json = jsonDecode(responceBody);
  return PredictResponce.fromJson(json);
  } catch (e) {
    rethrow ;
  }
}
}