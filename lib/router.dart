import 'package:get/get.dart';
import 'package:roloxmoney/screen/business_profile_screen/business_profile_screen.dart';
import 'package:roloxmoney/screen/dashboard_screen/dashboard_screen.dart';
import 'package:roloxmoney/screen/individual_profile_screen/individual_profile_screen.dart';
import 'package:roloxmoney/screen/login_profile_screen/login_profile_screen.dart';
import 'package:roloxmoney/screen/login_screen/login_screen.dart';
import 'package:roloxmoney/screen/splash_screen/splash_screen.dart';

/*Chinnadurai Viswanathan*/
class AppRoutes {
  static List<GetPage<dynamic>>? routes = [
    // GetPage(name: '/', page: () => DashboardScreen()),
    GetPage(name: '/', page: () => SplashScreen()),
    GetPage(name: LoginScreen.routeName, page: () => LoginScreen()),
    GetPage(
        name: LoginProfileScreen.routeName, page: () => LoginProfileScreen()),
    GetPage(
        name: IndividualProfileScreen.routeName,
        page: () => IndividualProfileScreen()),
    GetPage(
        name: BusinessProfileScreen.routeName,
        page: () => BusinessProfileScreen()),
    GetPage(name: DashboardScreen.routeName, page: () => DashboardScreen()),
  ];
}
