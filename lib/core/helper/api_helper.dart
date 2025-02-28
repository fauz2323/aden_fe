import 'package:http/http.dart';

class ApiHelper {
  static String baseUrl = "https://resto-rimbun.my.id";
  static String apiVer = '/api/v1';

  static Uri login = Uri.parse("$baseUrl$apiVer/login");
  static Uri register = Uri.parse("$baseUrl$apiVer/register");
  static Uri auth = Uri.parse("$baseUrl$apiVer/auth");
  static Uri getCategory = Uri.parse("$baseUrl$apiVer/food/category");
  static Uri getFood = Uri.parse("$baseUrl$apiVer/food");
  static Uri getFoodByCategory = Uri.parse("$baseUrl$apiVer/food/byCategory");
  static Uri getFoodUuid = Uri.parse("$baseUrl$apiVer/food/uuid");
  static Uri addToCart = Uri.parse("$baseUrl$apiVer/add/to/cart");
  static Uri getCart = Uri.parse("$baseUrl$apiVer/get/cart");
  static Uri makeOrder = Uri.parse("$baseUrl$apiVer/set/order");
  static Uri getOrder = Uri.parse("$baseUrl$apiVer/get/order");
  static Uri makePayment = Uri.parse("$baseUrl$apiVer/make/payment");
  static Uri getAllOrder = Uri.parse("$baseUrl$apiVer/all/order");

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
