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
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String routeName = '/loginScreen';

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return GetBuilder<LoginController>(
      assignId: true,
      builder: (controller) {
        return RoloxMoneyWidgetState(
          rxStatus: controller.status,
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
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  color: ColorResource.colorA0BCD0,
                                  fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          child: CustomTextField(
                            controller.mobilNumberController,
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
                            otpBottomSheet();
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
      },
    );
  }

  void otpBottomSheet() {
    showModalBottomSheet(
        // backgroundColor: Theme.of(context).backgroundColor,
        // backgroundColor: Colors.white,
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
            height: 450.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(22),
                topRight: Radius.circular(22),
              ),
              border: Border(
                top: BorderSide(color: Colors.white, width: 1),
              ),
              color: Theme.of(context).backgroundColor,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 70,
                ),
                CustomText(
                  text: '${Languages.of(context)?.mobileNumber}'.toUpperCase(),
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: ColorResource.colorFFFFFF,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          );
        });
  }
}
