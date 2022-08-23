import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/screen/login_screen/login_controller.dart';
import 'package:roloxmoney/screen/login_screen/login_screen_small.dart';
import 'package:roloxmoney/screen/profile_screen/profile_controller.dart';
import 'package:roloxmoney/screen/profile_screen/profile_screen_small.dart';
import 'package:roloxmoney/widget/responsive_widget.dart';

/*Chinnadurai Viswanathan*/

class ProfileScreen extends StatelessWidget {
  final _loginScaffoldKey = GlobalKey<ScaffoldState>();
  static const String routeName = '/profileScreen';
  final ProfileController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    return GetBuilder<ProfileController>(
      assignId: true,
      builder: (controller) {
        return ResponsiveWidget(
          largeScreen: ProfileScreenSmall(
              controller: loginController, scaffoldKey: _loginScaffoldKey),
          mediumScreen: ProfileScreenSmall(
              controller: loginController, scaffoldKey: _loginScaffoldKey),
          smallScreen: ProfileScreenSmall(
              controller: loginController, scaffoldKey: _loginScaffoldKey),
        );
      },
    );
  }
}
