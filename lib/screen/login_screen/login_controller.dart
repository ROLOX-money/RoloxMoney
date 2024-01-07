import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:roloxmoney/languages/app_languages.dart';
import 'package:roloxmoney/screen/dashboard_screen/dashboard_screen.dart';
import 'package:roloxmoney/screen/login_profile_screen/login_profile_screen.dart';
import 'package:roloxmoney/singleton.dart';
import 'package:roloxmoney/utils/supa_base_control.dart';
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
  RxInt seconds = 45.obs;
  late Timer timer;

  @override
  void onInit() async {
    mobilNumberController.text = '8056527428';

    if (kDebugMode) {
      acceptTermsAndCondition.value = true;
    }
    change(null, status: RxStatus.success());
    // if (kDebugMode) mobilNumberController.text = '9585313659';
    // Future.delayed(const Duration(seconds: 5), () {});
    change(mobilNumberController);
    super.onInit();
  }

  void timerCalculation() {
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      change(seconds--);
    });

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
        isDismissible: false,
        context: Get.context!,
        elevation: 30,
        isScrollControlled: true,
        backgroundColor: ColorResource.buttonTextColor,
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
                          '${Languages.of(Get.context!)?.enter} 6 ${Languages.of(Get.context!)?.digit} ${Languages.of(Get.context!)?.otp}',
                      style: Theme.of(Get.context!)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontSize: 18, fontWeight: FontWeight.w600),
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
                                  fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                        CustomText(
                          text: ' +91 $mobileNumber',
                          style: Theme.of(Get.context!)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  color: ColorResource.textSecondaryColor,
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
                        autoDisposeControllers: false,
                        appContext: Get.context!,
                        length: 6,
                        cursorWidth: 1,
                        cursorColor:
                            Theme.of(context).textTheme.titleMedium!.color,
                        pinTheme: PinTheme(
                            disabledColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            shape: PinCodeFieldShape.circle,
                            borderRadius: BorderRadius.circular(5),
                            fieldHeight: 50,
                            fieldWidth: 50,
                            inactiveFillColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            activeFillColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            borderWidth: 6,
                            errorBorderColor: Colors.red,
                            activeColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            selectedColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            selectedFillColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            inactiveColor:
                                Theme.of(context).scaffoldBackgroundColor),
                        enableActiveFill: true,
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: PrimaryButton(
                        '${Languages.of(Get.context!)!.signIn}',
                        Get.context!,
                        cardShape: 1,
                        isIcon: true,
                        onTap: () {
                          ///fixme
                          // debugPrint(
                          //     'otpController.text--> ${otpController.text}');
                          // debugPrint('otpString--> $otpString');
                          // if (otpString == otpController.text) {
                          //   Get.snackbar(
                          //       'Login Success', 'OTP verified...Thanks...',
                          //       colorText: Colors.black,
                          //       backgroundColor: Colors.white);
                          // } else {
                          //   Get.snackbar(
                          //       'Login Failed', 'Something went wrong...',
                          //       colorText: Colors.black,
                          //       backgroundColor: Colors.white);
                          // }
                          // Get.back();
                          navigateProfile();
                        },
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    CustomText(
                      text: '${Languages.of(Get.context!)?.resendIN} 0:45',
                      style: Theme.of(Get.context!)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            );
          });
        });
  }

  Future<void> triggerLogin(String screen, BuildContext context) async {
    change(null, status: RxStatus.loading());
    await SupaBaseController.sendSignInCode(
            mobileNumber: '+91${mobilNumberController.text}')
        .then((value) {
      if (value) {
        timerCalculation();
        if (screen.toLowerCase() == "smallscreen") {
          otpBottomSheet(
            mobileNumber: '${mobilNumberController.text}',
          );
        } else if (screen.toLowerCase() == "largescreen") {
          otpAlertDialogue(
            context: context,
            mobileNumber: '${mobilNumberController.text}',
          );
        }
      }
    });
    change(null, status: RxStatus.success());
  }

  void otpAlertDialogue(
      {LoginController? controller,
      String? mobileNumber,
      required BuildContext context}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          shape: RoundedRectangleBorder(
              side:
                  BorderSide(color: Theme.of(context).scaffoldBackgroundColor),
              borderRadius: BorderRadius.all(Radius.circular(32.0))),
          content: Container(
            width: 500,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 10),
                Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    ImageResource.OTPImagePNG,
                    height: 80,
                    width: 80,
                  ),
                ),
                SizedBox(height: 20),
                CustomText(
                  text:
                      '${Languages.of(context)?.enter} 6 ${Languages.of(context)?.digit} ${Languages.of(context)?.otp}',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text:
                          '${Languages.of(context)?.sentOTPToRegisteredMobile}',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: ColorResource.textSecondaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    CustomText(
                      text: '$mobileNumber',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: ColorResource.textSecondaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
                  child: PinCodeTextField(
                    autoDisposeControllers: false,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    appContext: context,
                    length: 6,
                    cursorWidth: 1,
                    cursorColor: Theme.of(context).textTheme.titleMedium!.color,
                    pinTheme: PinTheme(
                        disabledColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        shape: PinCodeFieldShape.circle,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 50,
                        fieldWidth: 50,
                        inactiveFillColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        activeFillColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        borderWidth: 6,
                        errorBorderColor: Colors.red,
                        activeColor: Theme.of(context).scaffoldBackgroundColor,
                        selectedColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        selectedFillColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        inactiveColor:
                            Theme.of(context).scaffoldBackgroundColor),
                    enableActiveFill: true,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    controller: otpController,
                    textStyle: Theme.of(context).textTheme.titleMedium,
                    keyboardType: TextInputType.number,
                    boxShadows: const [
                      BoxShadow(
                        offset: Offset(0, 0.5),
                        color: Colors.grey,
                        blurRadius: 5,
                      )
                    ],
                    onCompleted: (v) {},
                    onChanged: (value) {},
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: PrimaryButton(
                    '${Languages.of(context)!.signIn}',
                    context,
                    cardShape: 1,
                    isIcon: true,
                    onTap: () {
                      navigateProfile();
                    },
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                CustomText(
                  text:
                      '${Languages.of(context)?.resendIN} 0.$seconds',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
