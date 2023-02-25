import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/screen/login_profile_screen/login_profile_controller.dart';
import 'package:roloxmoney/screen/login_profile_screen/login_profile_screen.dart';
import 'package:roloxmoney/utils/RoloxGetxController.dart';
import 'package:roloxmoney/utils/app_utils.dart';
/*Chinnadurai Viswanathan*/

class LoginController extends RoloxGetXController {
  TextEditingController mobilNumberController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  final form = GlobalKey<FormState>();

  RxBool isLogin = true.obs;

  @override
  void onInit() async {
    change(null, status: RxStatus.success());
    // if (kDebugMode) mobilNumberController.text = '9585313659';
    Future.delayed(const Duration(seconds: 5), () {});
    super.onInit();
  }

  void navigateProfile() {
    if (otpController.text.length == 4) {
      Get.put(LoginProfileController());
      Get.toNamed(LoginProfileScreen.routeName);
    }
  }
}
