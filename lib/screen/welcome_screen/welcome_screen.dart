import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/screen/welcome_screen/welcome_screen_controller.dart';
import 'package:roloxmoney/screen/welcome_screen/welcome_screen_large.dart';
import 'package:roloxmoney/screen/welcome_screen/welcome_screen_small.dart';
import 'package:roloxmoney/widget/responsive_widget.dart';

/*Chinnadurai Viswanathan*/

class WelcomeScreen extends StatelessWidget {
  final welcomeScaffoldKey = GlobalKey<ScaffoldState>();
  static const String routeName = '/welcomeScreen';
  final WelcomeController welcomeController = Get.find();

  @override
  Widget build(BuildContext context) {
    Get.put(WelcomeController());
    return GetBuilder<WelcomeController>(
      assignId: true,
      builder: (controller) {
        return ResponsiveWidget(
          largeScreen: WelcomeScreenLarge(
              controller: welcomeController, scaffoldKey: welcomeScaffoldKey),
          mediumScreen: WelcomeScreenSmall(
              controller: welcomeController, scaffoldKey: welcomeScaffoldKey),
          smallScreen: WelcomeScreenSmall(
              controller: welcomeController, scaffoldKey: welcomeScaffoldKey),
        );
      },
    );
  }
}
