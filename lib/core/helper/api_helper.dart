import 'package:http/http.dart';

class ApiHelper {
  static String baseUrl = "http://3m3aqx6vaf.sharedwithexpose.com";
  static String apiVer = '/api/v1';

  static Uri login = Uri.parse("$baseUrl$apiVer/login");
  static Uri register = Uri.parse("$baseUrl$apiVer/register");
  static Uri auth = Uri.parse("$baseUrl$apiVer/auth");
  static Uri getCategory = Uri.parse("$baseUrl$apiVer/food/category");
  static Uri getFood = Uri.parse("$baseUrl$apiVer/food");
  static Uri getFoodUuid = Uri.parse("$baseUrl$apiVer/food/uuid");
  static Uri addToCart = Uri.parse("$baseUrl$apiVer/add/to/cart");
  static Uri getCart = Uri.parse("$baseUrl$apiVer/get/cart");

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
