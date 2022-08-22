import 'package:get/get.dart';
import 'package:roloxmoney/screen/login_screen/login_screen.dart';
import 'package:roloxmoney/screen/splash_screen/splash_screen.dart';

/*Chinnadurai Viswanathan*/
class AppRoutes {
  static List<GetPage<dynamic>>? routes = [
    GetPage(name: '/', page: () => SplashScreen()),
    GetPage(name: LoginScreen.routeName, page: () => LoginScreen()),
  ];
}
