import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                    padding: const EdgeInsets.only(top: 50, bottom: 0),
                    child: CustomText(
                      text: '${Languages.of(context)?.welcomeToMean}',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                        text: '${Languages.of(context)?.welcomeNote} ',
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(
                                color: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .color,
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
                                    fontSize: 34,
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
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        bottomLeft: Radius.circular(24))),
                // padding: EdgeInsets.only(top: 60, left: 60, right: 60),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 100, bottom: 0),
                          child: CustomText(
                            text: '${Languages.of(context)?.mobileNumber}',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    color: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .color,
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
                                  enableColor: Colors.grey,
                                  borderColor: Colors.red,
                                  validationRules: [
                                    'required',
                                    'mobile_number'
                                  ],
                                  disableColor: Colors.red,
                                  keyBoardType: TextInputType.phone,
                                  prefixIcon: Container(
                                    width: 120,
                                    padding: EdgeInsets.only(left: 8),
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
                                                    'https://think360studio-media.s3.ap-south-1.amazonaws.com/download/india-flag-2021-wallpaper-1.png',
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
                                                  fontWeight: FontWeight.w400),
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
                                          indent: 15,
                                          endIndent: 15,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                height: 50,
                              ),
                            )),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          horizontalTitleGap: 0,
                          leading: Theme(
                            data: Theme.of(context).copyWith(
                              unselectedWidgetColor:
                                  Theme.of(context).unselectedWidgetColor,
                            ),
                            child: Checkbox(
                              value: widget.controller!.acceptTermsAndCondition
                                  .obs.value.value,
                              activeColor: Theme.of(context).primaryColor,
                              checkColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              visualDensity:
                                  VisualDensity(horizontal: -4, vertical: -4),
                              onChanged: (value) {
                                widget.controller!
                                    .noAgreeTermsAndConditionCheckBox(
                                        values: value);
                              },
                            ),
                          ),
                          title: RichText(
                              overflow: TextOverflow.fade,
                              softWrap: true,
                              text: TextSpan(
                                text: '${Languages.of(context)?.agree} ',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                children: [
                                  TextSpan(
                                    text:
                                        '${Languages.of(context)?.roloxTermsAndCondition}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                            color:
                                                Theme.of(context).primaryColor,
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
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          cardShape: 1,
                          isIcon: true,
                          onTap: () {
                            if (widget.controller!.form.currentState!
                                    .validate() &&
                                widget.controller!.acceptTermsAndCondition.obs
                                    .value.value) {
                              widget.controller!
                                  .triggerLogin("largescreen", context);
                              // widget.controller!.otpAlertDialogue(
                              //     context: context,
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
}
