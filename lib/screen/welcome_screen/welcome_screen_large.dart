import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/languages/app_languages.dart';
import 'package:roloxmoney/screen/welcome_screen/welcome_screen_controller.dart';
import 'package:roloxmoney/utils/color_resource.dart';
import 'package:roloxmoney/utils/image_resource.dart';
import 'package:roloxmoney/widget/custom_button.dart';
import 'package:roloxmoney/widget/custom_text.dart';
import 'package:roloxmoney/widget/rolox_money_widget.dart';

class WelcomeScreenLarge extends StatefulWidget {
  WelcomeController? controller;
  GlobalKey<ScaffoldState>? scaffoldKey;

  WelcomeScreenLarge(
      {Key? key, required this.controller, required this.scaffoldKey})
      : super(key: key);

  @override
  WelcomeScreenLargeState createState() => WelcomeScreenLargeState();
}

class WelcomeScreenLargeState extends State<WelcomeScreenLarge> {
  @override
  Widget build(BuildContext context) {
    return RoloxMoneyWidgetState(
        rxStatus: widget.controller!.status,
        child: Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            body: Center(
                child: Container(
              padding: EdgeInsets.all(30),
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.height / 1.2,
              decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(24)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage(
                      ImageResource.welcomeScreenImage,
                    ),
                    height: 226,
                    width: 232,
                  ),
                  SizedBox(height: 40),
                  CustomText(
                    text: '${Languages.of(context)?.congratulations}',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: ColorResource.buttonColor,
                        fontSize: 30,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 15),
                  CustomText(
                    text:
                        '${Languages.of(context)?.accountCreatedSuccessfully}',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: ColorResource.textColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 150, vertical: 20),
                    child: CustomText(
                      text:
                          '${Languages.of(context)?.accountCreatedScreenContent}',
                      textAlign: TextAlign.center,
                      lineHeight: 25,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: ColorResource.textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 150),
                    child: PrimaryButton(
                      '${Languages.of(context)!.letsExplore}',
                      context,
                      cardShape: 1,
                      isIcon: true,
                      onTap: () {
                        Get.back();
                        widget.controller!.navigateProfile();
                      },
                    ),
                  ),
                ],
              ),
            ))));
  }
}
