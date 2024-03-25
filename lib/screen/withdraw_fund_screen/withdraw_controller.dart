import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:roloxmoney/languages/app_languages.dart';
import 'package:roloxmoney/utils/color_resource.dart';
import 'package:roloxmoney/utils/image_resource.dart';
import 'package:roloxmoney/widget/custom_button.dart';
import 'package:roloxmoney/widget/custom_text.dart';

class WithdrawFundController extends GetxController with StateMixin {
  final form = GlobalKey<FormState>();
  TextEditingController withdrawAmountController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  @override
  void onInit() async {
    change(null, status: RxStatus.success());
    Future.delayed(const Duration(seconds: 5), () {});
    super.onInit();
  }

  void navigateProfile() {}

  void otpAlertDialogue({required BuildContext context, String? mobileNumber}) {
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
                          '${Languages.of(context)?.sentOTPToRegisteredMobile}${Languages.of(context)?.registered.toLowerCase()} ${Languages.of(context)?.mobileNumber.toLowerCase()}',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: ColorResource.textSecondaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
                  child: PinCodeTextField(
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
                    '${Languages.of(context)!.continueText}',
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
              ],
            ),
          ),
        );
      },
    );
  }
}
