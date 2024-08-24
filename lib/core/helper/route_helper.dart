import 'package:aden_fe/module/presentation/view/food_detail/food_detail_view.dart';
import 'package:aden_fe/module/presentation/view/home/home_view.dart';
import 'package:aden_fe/module/presentation/view/register/register_view.dart';
import 'package:flutter/widgets.dart';

import '../../module/presentation/view/login/login_view.dart';
import '../../module/presentation/view/payment/payment_view.dart';
import '../../module/presentation/view/splash/splash_view.dart';

class RouteHelper {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => const SplashView(),
    '/login': (context) => LoginView(),
    '/register': (context) => RegisterView(),
    '/home': (context) => HomeView(),
    '/food-detail': (context) => const FoodDetailView(),
    '/payment': (context) => PaymenView(),
  };
}
