import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:roloxmoney/languages/app_languages.dart';
import 'package:roloxmoney/screen/login_screen/login_controller.dart';
import 'package:roloxmoney/utils/color_resource.dart';
import 'package:roloxmoney/utils/image_resource.dart';
import 'package:roloxmoney/utils/supa_base_control.dart';
import 'package:roloxmoney/widget/custom_button.dart';
import 'package:roloxmoney/widget/custom_text.dart';

class OtpScreen extends StatefulWidget {
  final String screenName;

  const OtpScreen({super.key, required this.screenName});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final RxInt _timer = 45.obs;

  LoginController loginController = Get.put(LoginController());

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    Future.delayed(Duration(seconds: 1), () {
      if (_timer.value > 0) {
        _timer.value--;
        _startTimer();
      } else {
        // Get.back();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.screenName.toLowerCase() == "largescreen"
        ? AlertDialog(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            shape: RoundedRectangleBorder(
                side: BorderSide(
                    color: Theme.of(context).scaffoldBackgroundColor),
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
                        text:
                            '+91 ' + loginController.mobilNumberController.text,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: ColorResource.textSecondaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 30),
                    child: PinCodeTextField(
                      autoDisposeControllers: false,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      appContext: context,
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
                      controller: loginController.otpController,
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
                      isEnabled: loginController.otpController.text.isNotEmpty,
                      onTap: () {
                        loginController.navigateProfile();
                      },
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Obx(() {
                    return CustomText(
                      text: _timer.value != 0
                          ? '${Languages.of(context)?.resendIN} 0:${_timer.value.toString()}'
                          : '${Languages.of(context)?.resend}',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: _timer.value != 0
                              ? ColorResource.textColor
                              : ColorResource.color0093FF),
                      onTap: () async {
                        if (_timer.value == 0) {
                          await SupaBaseController.sendSignInCode(
                                  mobileNumber:
                                      '+91${loginController.mobilNumberController.text}')
                              .then((value) {
                            _timer.value = 45;
                            _startTimer();
                          });
                        }
                      },
                    );
                  }),
                ],
              ),
            ),
          )
        : Container(
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
                          .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    CustomText(
                      text:
                          ' +91 ${loginController.mobilNumberController.text}',
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
                  child: PinCodeTextField(
                    autoDisposeControllers: false,
                    appContext: Get.context!,
                    length: 6,
                    cursorWidth: 0.5,
                    cursorColor: Theme.of(context).textTheme.titleMedium!.color,
                    pinTheme: PinTheme(
                        disabledColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        shape: PinCodeFieldShape.circle,
                        borderRadius: BorderRadius.circular(3),
                        fieldHeight: 40,
                        fieldWidth: 40,
                        inactiveFillColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        activeFillColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        borderWidth: 4,
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
                    controller: loginController.otpController,
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
                      loginController.navigateProfile();
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
          );
    // showModalBottomSheet(
    //         enableDrag: true,
    //         isDismissible: false,
    //         context: Get.context!,
    //         elevation: 30,
    //         isScrollControlled: true,
    //         backgroundColor: ColorResource.buttonTextColor,
    //         shape: RoundedRectangleBorder(
    //           borderRadius: BorderRadius.only(
    //             topLeft: Radius.circular(22.0),
    //             topRight: Radius.circular(22.0),
    //           ),
    //         ),
    //         builder: (builder) {
    //           return LayoutBuilder(builder: (context, constraint) {
    //             return Padding(
    //               padding: EdgeInsets.only(
    //                   bottom: MediaQuery.of(Get.context!).viewInsets.bottom),
    //               child:
    //             );
    //           });
    //         });
  }
}
