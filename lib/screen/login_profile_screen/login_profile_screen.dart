import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/screen/login_profile_screen/login_profile_controller.dart';
import 'package:roloxmoney/screen/login_profile_screen/login_profile_screen_small.dart';
import 'package:roloxmoney/widget/responsive_widget.dart';

import 'login_profile_screen_large.dart';

/*Chinnadurai Viswanathan*/

class LoginProfileScreen extends StatelessWidget {
  final _loginScaffoldKey = GlobalKey<ScaffoldState>();
  static const String routeName = '/loginProfileScreen';
  final LoginProfileController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    Get.put(LoginProfileController());
    return GetBuilder<LoginProfileController>(
      assignId: true,
      builder: (controller) {
        return ResponsiveWidget(
          largeScreen: LoginProfileScreenLarge(
              controller: loginController, scaffoldKey: _loginScaffoldKey),
          mediumScreen: LoginProfileScreenSmall(
              controller: loginController, scaffoldKey: _loginScaffoldKey),
          smallScreen: LoginProfileScreenSmall(
              controller: loginController, scaffoldKey: _loginScaffoldKey),
        );
      },
    );
  }
}
