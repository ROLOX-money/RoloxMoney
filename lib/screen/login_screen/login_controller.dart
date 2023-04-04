import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/screen/login_profile_screen/login_profile_controller.dart';
import 'package:roloxmoney/screen/login_profile_screen/login_profile_screen.dart';
import 'package:roloxmoney/utils/app_utils.dart';
import 'package:roloxmoney/utils/http_url.dart';
import 'package:roloxmoney/utils/rolox_getx_controller.dart';
/*Chinnadurai Viswanathan*/

class LoginController extends RoloxGetXController {
  //65.2.137.244:8080/login/9820557101 => for OTP
  //65.2.137.244:8080/user/9820557101 => to check if user exist
  //65.2.137.244:8080/user/api/registration
  TextEditingController mobilNumberController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  final form = GlobalKey<FormState>();

  RxBool isLogin = true.obs;

  @override
  void onInit() async {
    mobilNumberController.text = '9585313659';
    change(null, status: RxStatus.success());
    // if (kDebugMode) mobilNumberController.text = '9585313659';
    // Future.delayed(const Duration(seconds: 5), () {});
    change(mobilNumberController);
    super.onInit();
  }

  void navigateProfile() {
    if (otpController.text.length == 4) {
      Get.put(LoginProfileController());
      Get.toNamed(LoginProfileScreen.routeName);
    }
  }

  Future<void> triggerLogin() async {
    // change(null, status: RxStatus.loading());
    await apiRequest(
            requestType: APIRequestType.get,
            urlString:
                HTTPUrl.loginURL(mobileNumber: mobilNumberController.text))
        .then((value) {
      debugPrint('values--> $value');
    });
    // change(null, status: RxStatus.success());
  }
}
