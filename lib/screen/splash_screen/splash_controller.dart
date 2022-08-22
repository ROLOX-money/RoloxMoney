import 'dart:async';
import 'package:get/get.dart';
import 'package:roloxmoney/screen/login_screen/login_screen.dart';
/*Chinnadurai Viswanathan*/

class SplashScreenController extends GetxController with StateMixin {
  @override
  void onInit() async {
    change(null, status: RxStatus.success());
    Future.delayed(const Duration(seconds: 1), () {
      Get.offAndToNamed(LoginScreen.routeName);
    });
    super.onInit();
  }
}
