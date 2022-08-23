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
                        ImageResource.rolox,
                        height: 30,
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    CustomText(
                      text: '${Languages.of(context)?.mobileNumber}'
                          .toUpperCase(),
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: ColorResource.colorA0BCD0,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      child: CustomTextField(
                        widget.controller!.mobilNumberController.obs.value,
                        focusedBorder: Colors.grey,
                        textColor: Colors.white,
                        enableColor: Colors.grey,
                        borderColor: Colors.red,
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
                    const SizedBox(
                      height: 15,
                    ),
                    PrimaryButton(
                      '${Languages.of(context)!.send} ${Languages.of(context)!.otp}',
                      context,
                      cardShape: 1,
                      isIcon: true,
                      onTap: () {
                        otpBottomSheet(controller: widget.controller!);
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

  void otpBottomSheet({LoginController? controller}) {
    showModalBottomSheet(
        enableDrag: true,
        context: context,
        elevation: 30,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(22.0),
            topRight: Radius.circular(22.0),
          ),
        ),
        builder: (builder) {
          return Container(
            margin: EdgeInsets.only(top: 0.5),
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(22),
                topRight: Radius.circular(22),
              ),
            ),
            height: 400.0,
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                CustomText(
                  text:
                      '${Languages.of(context)?.enter} 4 ${Languages.of(context)?.digit} ${Languages.of(context)?.otp}',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: ColorResource.colorFFFFFF,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 15,
                ),
                CustomText(
                  text:
                      '${Languages.of(context)?.sentOTPToRegisteredMobile} +91 9585313659',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: ColorResource.colorFFFFFF,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
                  child: PinCodeTextField(
                    appContext: context,
                    length: 4,
                    pinTheme: PinTheme(
                        disabledColor: Theme.of(context).backgroundColor,
                        shape: PinCodeFieldShape.circle,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 50,
                        fieldWidth: 50,
                        inactiveFillColor: Theme.of(context).backgroundColor,
                        activeFillColor: Theme.of(context).backgroundColor,
                        borderWidth: 6,
                        activeColor: Theme.of(context).backgroundColor,
                        selectedColor: Theme.of(context).backgroundColor,
                        selectedFillColor: Theme.of(context).backgroundColor,
                        inactiveColor: Theme.of(context).backgroundColor),
                    enableActiveFill: true,
                    backgroundColor: Theme.of(context).backgroundColor,
                    // controller: controller!.otpController,
                    textStyle: Theme.of(context).textTheme.titleMedium,
                    keyboardType: TextInputType.number,
                    boxShadows: const [
                      BoxShadow(
                        offset: Offset(0, 0.5),
                        color: Colors.grey,
                        blurRadius: 5,
                      )
                    ],
                    onCompleted: (v) {
                      debugPrint("Completed");
                    },
                    onChanged: (value) {
                      debugPrint(value);
                      setState(() {});
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                PrimaryButton(
                  '${Languages.of(context)!.signIn}',
                  context,
                  cardShape: 1,
                  isIcon: true,
                  onTap: () {
                    controller!.navigateProfile();
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
          );
        });
  }
}
