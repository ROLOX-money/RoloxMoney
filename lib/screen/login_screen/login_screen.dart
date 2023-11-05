import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/screen/login_screen/login_controller.dart';
import 'package:roloxmoney/screen/login_screen/login_screen_large.dart';
import 'package:roloxmoney/screen/login_screen/login_screen_small.dart';
import 'package:roloxmoney/widget/responsive_widget.dart';

/*Chinnadurai Viswanathan*/

class LoginScreen extends StatelessWidget {
  final _loginScaffoldKey = GlobalKey<ScaffoldState>();
  static const String routeName = '/loginScreen';
  final LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return GetBuilder<LoginController>(
      assignId: true,
      builder: (controller) {
        return ResponsiveWidget(
          largeScreen: LoginScreenLarge(
              controller: loginController, scaffoldKey: _loginScaffoldKey),
          mediumScreen: LoginScreenSmall(
              controller: loginController, scaffoldKey: _loginScaffoldKey),
          smallScreen: LoginScreenSmall(
              controller: loginController, scaffoldKey: _loginScaffoldKey),
        );
      },
    );
  }
}
