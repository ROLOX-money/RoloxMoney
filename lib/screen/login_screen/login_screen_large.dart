import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:roloxmoney/languages/app_languages.dart';
import 'package:roloxmoney/screen/login_screen/login_controller.dart';
import 'package:roloxmoney/utils/color_resource.dart';
import 'package:roloxmoney/utils/image_resource.dart';
import 'package:roloxmoney/widget/custom_button.dart';
import 'package:roloxmoney/widget/custom_text.dart';
import 'package:roloxmoney/widget/custom_textfield.dart';
import 'package:roloxmoney/widget/rolox_money_widget.dart';

class LoginScreenLarge extends StatefulWidget {
  LoginController? controller;
  GlobalKey<ScaffoldState>? scaffoldKey;

  LoginScreenLarge(
      {Key? key, required this.controller, required this.scaffoldKey})
      : super(key: key);

  @override
  State<LoginScreenLarge> createState() => _LoginScreenLargeState();
}

class _LoginScreenLargeState extends State<LoginScreenLarge> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RoloxMoneyWidgetState(
      rxStatus: widget.controller!.status,
      child: Scaffold(
        body: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 2,
              padding: EdgeInsets.only(top: 60, left: 30),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Image.asset(
                      ImageResource.rolox,
                      height: 30,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 100, bottom: 10),
                    child: CustomText(
                      text: '${Languages.of(context)?.welcomeToRolox}',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: ColorResource.colorE08AF4,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                        text: '${Languages.of(context)?.welcomeNote}',
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(
                                color: ColorResource.colorFFFFFF,
                                fontWeight: FontWeight.w600),
                        children: <InlineSpan>[
                          TextSpan(
                            text:
                                ' ${Languages.of(context)?.professionalInvoice}',
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                    fontWeight: FontWeight.w600,
                                    height: 1.5,
                                    foreground: Paint()
                                      ..shader = ColorResource.linearGradient),
                          )
                        ]),
                    softWrap: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Container(
                      alignment: Alignment.center,
                      child: Image.asset(ImageResource.loginImagePNG,
                          height: 350, width: 350),
                    ),
                  ),
                ],
              ),
            ),
            Container(
                color: ColorResource.color383838,
                width: MediaQuery.of(context).size.width / 2,
                // padding: EdgeInsets.only(top: 60, left: 60, right: 60),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 100, bottom: 10),
                          child: CustomText(
                            text: '${Languages.of(context)?.mobileNumber}'
                                .toUpperCase(),
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    color: ColorResource.colorE08AF4,
                                    fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 15),
                            child: Form(
                              key: widget.controller!.form,
                              child: SizedBox(
                                child: CustomTextField(
                                  widget.controller!.mobilNumberController.obs
                                      .value,
                                  focusedBorder: Colors.grey,
                                  validatorCallBack: (bool value) {},
                                  textColor: Colors.white,
                                  enableColor: Colors.grey,
                                  borderColor: Colors.red,
                                  validationRules: [
                                    'required',
                                    'mobile_number'
                                  ],
                                  disableColor: Colors.red,
                                  keyBoardType: TextInputType.phone,
                                  prefixIcon: Container(
                                    width: 150,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          ClipOval(
                                            child: Material(
                                              child: InkWell(
                                                splashColor: Colors.red,
                                                // Splash color
                                                onTap: () {},
                                                child: SizedBox(
                                                  width: 32,
                                                  height: 32,
                                                  child: Image.network(
                                                      'https://cdn.pixabay.com/photo/2020/07/04/08/24/india-5368684__340.jpg',
                                                      fit: BoxFit.cover),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 5),
                                          CustomText(
                                            text: '+91',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .copyWith(
                                                    color: Theme.of(context)
                                                        .textTheme
                                                        .titleMedium!
                                                        .color,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w400),
                                          ),
                                          Icon(
                                            Icons.keyboard_arrow_down,
                                            size: 22,
                                            color: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .color,
                                          ),
                                          VerticalDivider(
                                            thickness: 1,
                                            color: ColorResource.colorDDDDDD,
                                            indent: 15,
                                            endIndent: 15,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                height: 70,
                              ),
                            )),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          horizontalTitleGap: 0,
                          leading: Theme(
                            data: Theme.of(context).copyWith(
                              unselectedWidgetColor: ColorResource.color00E94F,
                            ),
                            child: Checkbox(
                              value: widget.controller!.acceptTermsAndCondition
                                  .obs.value.value,
                              activeColor: Colors.blue,
                              checkColor: ColorResource.color151515,
                              onChanged: (value) {
                                widget.controller!
                                    .noAgreeTermsAndConditionCheckBox(
                                        values: value);
                              },
                            ),
                          ),
                          // Checkbox(
                          //   value: widget.controller!.acceptTermsAndCondition
                          //       .obs.value.value,
                          //   activeColor: Colors.blue,
                          //   checkColor: ColorResource.color151515,
                          //   onChanged: (value) {
                          //     widget.controller!
                          //         .noAgreeTermsAndConditionCheckBox(
                          //         values: value);
                          //   },
                          // ),
                          title: RichText(
                              overflow: TextOverflow.fade,
                              softWrap: true,
                              text: TextSpan(
                                text: '${Languages.of(context)?.agree}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        color: ColorResource.colorFFFFFF,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                children: [
                                  TextSpan(
                                    text:
                                        '${Languages.of(context)?.roloxTermsAndCondition}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                            color: ColorResource.color0093FF,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            decoration:
                                                TextDecoration.underline),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        debugPrint(
                                            "onTap of Terms and condition screen");

                                        ///fixme
                                        // need to navigate the terms and condition Screen
                                      },
                                  ),
                                ],
                              )),
                        ),
                        PrimaryButton(
                          '${Languages.of(context)!.send} ${Languages.of(context)!.otp}',
                          context,
                          fontSize: 20,
                          cardShape: 1,
                          isIcon: true,
                          onTap: () {
                            if (widget.controller!.form.currentState!
                                    .validate() &&
                                widget.controller!.acceptTermsAndCondition.obs
                                    .value.value) {
                              otpAlertDialogue(
                                  controller: widget.controller!,
                                  mobileNumber:
                                      ' +91 ${widget.controller!.mobilNumberController.obs.value.value.text}');

                              // otpBottomSheet(
                              //     controller: widget.controller!,
                              //     mobileNumber:
                              //         ' +91 ${widget.controller!.mobilNumberController.obs.value.value.text}');
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                backgroundColor: Colors.red,
                                content: const Text(
                                    'Please check the Check box or Enter Valid mobile No'),
                                duration: const Duration(seconds: 2),
                              ));
                            }
                          },
                        )
                      ]),
                ))
          ],
        ),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
    );
  }

  void otpAlertDialogue({LoginController? controller, String? mobileNumber}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).backgroundColor,
          shape: RoundedRectangleBorder(
              side: BorderSide(color: ColorResource.colorFFFFFF),
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
                      '${Languages.of(context)?.enter} 4 ${Languages.of(context)?.digit} ${Languages.of(context)?.otp}',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: ColorResource.colorFFFFFF,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text:
                          '${Languages.of(context)?.sentOTPToRegisteredMobile}',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: ColorResource.colorFFFFFF,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    CustomText(
                      text: '$mobileNumber',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: ColorResource.colorE08AF4,
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
                    appContext: context,
                    length: 6,
                    cursorWidth: 1,
                    cursorColor: ColorResource.colorFFFFFF,
                    pinTheme: PinTheme(
                        disabledColor: Theme.of(context).backgroundColor,
                        shape: PinCodeFieldShape.circle,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 50,
                        fieldWidth: 50,
                        inactiveFillColor: Theme.of(context).backgroundColor,
                        activeFillColor: Theme.of(context).backgroundColor,
                        borderWidth: 6,
                        errorBorderColor: Colors.red,
                        activeColor: Theme.of(context).backgroundColor,
                        selectedColor: Theme.of(context).backgroundColor,
                        selectedFillColor: Theme.of(context).backgroundColor,
                        inactiveColor: Theme.of(context).backgroundColor),
                    enableActiveFill: true,
                    backgroundColor: Theme.of(context).backgroundColor,
                    controller: controller!.otpController,
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
                PrimaryButton(
                  '${Languages.of(context)!.signIn}',
                  context,
                  cardShape: 1,
                  isIcon: true,
                  onTap: () {
                    Get.back();
                    controller.navigateProfile();
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                CustomText(
                  text: '${Languages.of(context)?.resendIN} 0:45',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: ColorResource.colorFFFFFF,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
