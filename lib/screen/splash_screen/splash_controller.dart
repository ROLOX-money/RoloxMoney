import 'dart:async';
import 'package:get/get.dart';
import 'package:roloxmoney/screen/login_screen/login_screen.dart';
import 'package:roloxmoney/utils/RoloxKey.dart';
/*Chinnadurai Viswanathan*/

class SplashScreenController extends GetxController with StateMixin {
  @override
  void onInit() async {
    RoloxKey.baseUrl = 'http://65.2.137.244:8080/';

    change(null, status: RxStatus.success());
    Future.delayed(const Duration(seconds: 1), () {
      Get.offAndToNamed(LoginScreen.routeName);
    });
    super.onInit();
  }
}
