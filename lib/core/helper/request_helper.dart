import 'package:http/http.dart' as http;

import 'api_helper.dart';

class RequestHelper {
  static Future<http.Response> get(Uri url, Map<String, String> headers) async {
    final response = await http
        .get(
          url,
          headers: headers,
        )
        .timeout(
          Duration(seconds: 10),
          onTimeout: () => ApiHelper.timeOutException(),
        );
    return response;
  }

  static Future<http.Response> post(
      Uri url, Map<String, String> headers, Map body) async {
    final response = await http
        .post(
          url,
          headers: headers,
          body: body,
        )
        .timeout(
          Duration(seconds: 10),
          onTimeout: () => ApiHelper.timeOutException(),
        );
    return response;
  }
}
