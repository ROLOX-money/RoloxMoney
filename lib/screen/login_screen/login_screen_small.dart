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

/*Chinnadurai Viswanathan*/
// ignore: must_be_immutable
class LoginScreenSmall extends StatefulWidget {
  LoginController? controller;
  GlobalKey<ScaffoldState>? scaffoldKey;

  LoginScreenSmall(
      {Key? key, required this.controller, required this.scaffoldKey})
      : super(key: key);

  @override
  LoginScreenSmallState createState() => LoginScreenSmallState();
}

class LoginScreenSmallState extends State<LoginScreenSmall> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RoloxMoneyWidgetState(
      rxStatus: widget.controller!.status,
      child: Scaffold(
        body: Container(
          margin: MediaQuery.of(context).viewInsets,
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Image.asset(
                        ImageResource.login_screen_rolox,
                        height: 80,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        ImageResource.loginImagePNG,
                        height: 233,
                        width: 170,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomText(
                      text: '${Languages.of(context)?.mobileNumber}'
                          .toUpperCase(),
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: ColorResource.colorE08AF4,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Form(
                      key: widget.controller!.form,
                      child: SizedBox(
                        child: CustomTextField(
                          widget.controller!.mobilNumberController.obs.value,
                          focusedBorder: Colors.grey,
                          validatorCallBack: (bool value) {},
                          textColor: Colors.white,
                          enableColor: Colors.grey,
                          borderColor: Colors.red,
                          validationRules: ['required', 'mobile_number'],
                          disableColor: Colors.red,
                          keyBoardType: TextInputType.phone,
                          prefixIcon: Container(
                            width: 100,
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
                                          width: 22,
                                          height: 22,
                                          child: Image.network(
                                            'https://think360studio-media.s3.ap-south-1.amazonaws.com/download/india-flag-2021-wallpaper-1.png',
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  CustomText(
                                    text: '+91',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
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
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    width: 0.40,
                                    height: 20,
                                    color: ColorResource.colorDDDDDD,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        height: 70,
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      horizontalTitleGap: 0,
                      leading: Theme(
                        data: Theme.of(context).copyWith(
                          unselectedWidgetColor: ColorResource.color00E94F,
                        ),
                        child: Checkbox(
                          value: widget.controller!.acceptTermsAndCondition.obs
                              .value.value,
                          activeColor: Colors.blue,
                          checkColor: ColorResource.color151515,
                          onChanged: (value) {
                            widget.controller!.noAgreeTermsAndConditionCheckBox(
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
                                        decoration: TextDecoration.underline),
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
                      cardShape: 1,
                      isIcon: true,
                      onTap: () {
                        /// fixme
                        // if (widget.controller!.form.currentState!.validate())
                        //   widget.controller!.triggerLogin();
                        widget.controller!.otpBottomSheet(
                            mobileNumber:
                                ' +91 ${widget.controller!.mobilNumberController.obs.value.value.text}');

                        // otpBottomSheet(
                        //     controller: widget.controller!,
                        //     mobileNumber:
                        //         ' +91 ${widget.controller!.mobilNumberController.obs.value.value.text}');
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
    );
  }
}
