import 'dart:async';
import 'package:get/get.dart';
import 'package:roloxmoney/screen/login_profile_screen/login_profile_controller.dart';
import 'package:roloxmoney/screen/login_profile_screen/login_profile_screen.dart';

/*Chinnadurai Viswanathan*/

class WelcomeController extends GetxController with StateMixin {
  @override
  void onInit() async {
    change(null, status: RxStatus.success());
    Future.delayed(const Duration(seconds: 5), () {});
    super.onInit();
  }

  void navigateProfile() {
    Get.put(LoginProfileController());
    Get.toNamed(LoginProfileScreen.routeName);
  }
}
