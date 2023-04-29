import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/screen/login_profile_screen/login_profile_controller.dart';
import 'package:roloxmoney/screen/login_profile_screen/login_profile_screen.dart';
import 'package:roloxmoney/screen/welcome_screen/welcome_screen.dart';
import 'package:roloxmoney/screen/welcome_screen/welcome_screen_controller.dart';


/*Chinnadurai Viswanathan*/

class LoginController extends GetxController with StateMixin {
  TextEditingController mobilNumberController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  final form = GlobalKey<FormState>();

  RxBool isLogin = true.obs;
  RxBool acceptTermsAndCondition = false.obs;

  @override
  void onInit() async {
    change(null, status: RxStatus.success());
    // if (kDebugMode) mobilNumberController.text = '9585313659';
    Future.delayed(const Duration(seconds: 5), () {});
    super.onInit();
  }

  void navigateProfile() {
    if (otpController.text.length == 4) {

      // Future.delayed(const Duration(seconds: 5), () {
      //   Get.put(WelcomeController());
      //   Get.toNamed(WelcomeScreen.routeName);
        // });

      Get.put(LoginProfileController());
      Get.toNamed(LoginProfileScreen.routeName);
    }
  }

  void noAgreeTermsAndConditionCheckBox({bool? values}) {
    acceptTermsAndCondition = values!.obs;
    change(acceptTermsAndCondition);
  }
}
