import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:roloxmoney/languages/app_languages.dart';
import 'package:roloxmoney/screen/dashboard_screen/dashboard_screen.dart';
import 'package:roloxmoney/screen/login_profile_screen/login_profile_controller.dart';
import 'package:roloxmoney/screen/login_profile_screen/login_profile_screen.dart';
import 'package:roloxmoney/screen/welcome_screen/welcome_screen.dart';
import 'package:roloxmoney/screen/welcome_screen/welcome_screen_controller.dart';
import 'package:roloxmoney/singleton.dart';
import 'package:roloxmoney/utils/supa_base_control.dart';
import 'package:roloxmoney/utils/app_utils.dart';
import 'package:roloxmoney/utils/color_resource.dart';
import 'package:roloxmoney/utils/image_resource.dart';
import 'package:roloxmoney/utils/rolox_getx_controller.dart';
import 'package:roloxmoney/widget/custom_button.dart';
import 'package:roloxmoney/widget/custom_text.dart';
/*Chinnadurai Viswanathan*/

class LoginController extends RoloxGetXController with SupaBaseController {
  //65.2.137.244:8080/login/9820557101 => for OTP
  //65.2.137.244:8080/user/9820557101 => to check if user exist
  //65.2.137.244:8080/user/api/registration
  TextEditingController mobilNumberController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  final form = GlobalKey<FormState>();

  RxBool isLogin = true.obs;
  RxBool acceptTermsAndCondition = false.obs;

  @override
  void onInit() async {
    mobilNumberController.text = '9585313659';

    if (kDebugMode) {
      acceptTermsAndCondition.value = true;
    }
    change(null, status: RxStatus.success());
    // if (kDebugMode) mobilNumberController.text = '9585313659';
    // Future.delayed(const Duration(seconds: 5), () {});
    change(mobilNumberController);
    super.onInit();
  }

  void navigateProfile() {
    if (otpController.text.length == 6) {
      otpVerification(context: Get.context);
      // // Future.delayed(const Duration(seconds: 5), () {
      // // Get.put(WelcomeController());
      // // Get.toNamed(WelcomeScreen.routeName);
      // // });
      // Get.put(LoginProfileController());
      // Get.offAndToNamed(LoginProfileScreen.routeName);
    }
  }

  // Get.put(LoginProfileController());
  // Get.offAndToNamed(LoginProfileScreen.routeName);
  // Get.toNamed(LoginProfileScreen.routeName);
  Future<void> otpVerification({BuildContext? context}) async {
    if (otpController.text.length == 6) {
      await SupaBaseController.verifyThroughOTP(
              mobileNumber: mobilNumberController.text,
              otpNumber: otpController.text,
              context: context)
          .then((value) {
        if (value) {
          SupaBaseController.toGetTheSelectedUser(
                  mobileNumber:
                      Singleton.supabaseInstance.client.auth.currentUser?.phone)
              .then((value) {
            if (value is List && value.length == 0) {
              Get.offAndToNamed(LoginProfileScreen.routeName,
                  arguments: mobilNumberController.text);
            } else {

              Get.offAndToNamed(DashboardScreen.routeName,
                  arguments: mobilNumberController.text);
              // toInsertFCM(userID: value[0]['id']).then((fcmTokenValue) {
              //   if (fcmTokenValue) {
              //     Get.offAndToNamed(DashboardScreen.routeName,
              //         arguments: mobilNumberController.text);
              //   } else {
              //     AppUtils.showErrorSnackBar(Get.context!,
              //         'Something went wrong..Please Please try again latter',
              //         durations: 2000);
              //   }
              // });
            }
          });
        } else {
          Get.offAndToNamed(LoginProfileScreen.routeName,
              arguments: mobilNumberController.text);
        }
      });
    }
  }

  void noAgreeTermsAndConditionCheckBox({bool? values}) {
    acceptTermsAndCondition = values!.obs;
    change(acceptTermsAndCondition);
  }

  void otpBottomSheet({String? mobileNumber, String? otpString}) {
    showModalBottomSheet(
        enableDrag: true,
        context: Get.context!,
        elevation: 30,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(22.0),
            topRight: Radius.circular(22.0),
          ),
        ),
        builder: (builder) {
          return LayoutBuilder(builder: (context, constraint) {
            return Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(Get.context!).viewInsets.bottom),
              child: Container(
                margin: EdgeInsets.only(top: 0.5),
                decoration: BoxDecoration(
                  color: Theme.of(Get.context!).backgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(22),
                    topRight: Radius.circular(22),
                  ),
                ),
                height: 500.0,
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        ImageResource.OTPImagePNG,
                        height: 80,
                        width: 80,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomText(
                      text:
                          '${Languages.of(Get.context!)?.enter} 4 ${Languages.of(Get.context!)?.digit} ${Languages.of(Get.context!)?.otp}',
                      style: Theme.of(Get.context!)
                          .textTheme
                          .titleSmall!
                          .copyWith(
                              color: ColorResource.colorFFFFFF,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text:
                              '${Languages.of(Get.context!)?.sentOTPToRegisteredMobile}',
                          style: Theme.of(Get.context!)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  color: ColorResource.colorFFFFFF,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                        ),
                        CustomText(
                          text: ' +91 $mobileNumber',
                          style: Theme.of(Get.context!)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  color: ColorResource.colorE08AF4,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 30),
                      child: PinCodeTextField(
                        appContext: Get.context!,
                        length: 6,
                        cursorWidth: 1,
                        cursorColor: ColorResource.colorFFFFFF,
                        pinTheme: PinTheme(
                            disabledColor:
                                Theme.of(Get.context!).backgroundColor,
                            shape: PinCodeFieldShape.circle,
                            borderRadius: BorderRadius.circular(5),
                            fieldHeight: 50,
                            fieldWidth: 50,
                            inactiveFillColor:
                                Theme.of(Get.context!).backgroundColor,
                            activeFillColor:
                                Theme.of(Get.context!).backgroundColor,
                            borderWidth: 6,
                            errorBorderColor: Colors.red,
                            activeColor: Theme.of(Get.context!).backgroundColor,
                            selectedColor:
                                Theme.of(Get.context!).backgroundColor,
                            selectedFillColor:
                                Theme.of(Get.context!).backgroundColor,
                            inactiveColor:
                                Theme.of(Get.context!).backgroundColor),
                        enableActiveFill: true,
                        backgroundColor: Theme.of(Get.context!).backgroundColor,
                        controller: otpController,
                        textStyle: Theme.of(Get.context!).textTheme.titleMedium,
                        keyboardType: TextInputType.number,
                        boxShadows: const [
                          BoxShadow(
                            offset: Offset(0, 0.5),
                            color: Colors.grey,
                            blurRadius: 5,
                          )
                        ],
                        onChanged: (value) {},
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    PrimaryButton(
                      '${Languages.of(Get.context!)!.signIn}',
                      Get.context!,
                      cardShape: 1,
                      isIcon: true,
                      onTap: () {
                        ///fixme
                        // debugPrint('otpController.text--> ${otpController.text}');
                        // debugPrint('otpString--> $otpString');
                        // if (otpString == otpController.text) {
                        //   Get.snackbar(
                        //       'Login Success', 'OTP verified...Thanks...',
                        //       colorText: Colors.black,
                        //       backgroundColor: Colors.white);
                        // } else {
                        //   Get.snackbar('Login Failed', 'Something went wrong...',
                        //       colorText: Colors.black,
                        //       backgroundColor: Colors.white);
                        // }
                        // Get.back();
                        navigateProfile();
                      },
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    CustomText(
                      text: '${Languages.of(Get.context!)?.resendIN} 0:45',
                      style: Theme.of(Get.context!)
                          .textTheme
                          .titleSmall!
                          .copyWith(
                              color: ColorResource.colorFFFFFF,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            );
          });
        });
  }

  Future<void> triggerLogin() async {
    change(null, status: RxStatus.loading());
    await SupaBaseController.sendSignInCode(
            mobileNumber: '+91${mobilNumberController.text}')
        .then((value) {
      if (value) {
        otpBottomSheet(mobileNumber: '${mobilNumberController.text}');
      }
    });
    // otpBottomSheet(mobileNumber: '${mobilNumberController.text}');
    change(null, status: RxStatus.success());
  }
}
