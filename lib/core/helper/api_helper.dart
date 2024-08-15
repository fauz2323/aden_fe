import 'package:http/http.dart';

class ApiHelper {
  static String baseUrl = "https://yxzmxd1ulo.sharedwithexpose.com";
  static String apiVer = '/api/v1';

  static Uri login = Uri.parse("$baseUrl$apiVer/login");
  static Uri register = Uri.parse("$baseUrl$apiVer/register");
  static Uri auth = Uri.parse("$baseUrl$apiVer/auth");

  static getHeaderGet(var token) {
    Map<String, String> data = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    return data;
  }

  static getHeaderPost(var token) {
    Map<String, String> data = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    return data;
  }

  static Response timeOutException() {
    return Response(
      '{"message":"Connection Timeout"}',
      408,
    );
  }
}
