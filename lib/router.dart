import 'package:get/get.dart';
import 'package:roloxmoney/screen/splash_screen/splash_screen.dart';

/*Chinnadurai Viswanathan*/
class AppRoutes {
  static List<GetPage<dynamic>>? routes = [
    GetPage(name: '/', page: () => SplashScreen()),
  ];
}
