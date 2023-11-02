import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/screen/withdraw_fund_screen/withdraw_controller.dart';
import 'package:roloxmoney/screen/withdraw_fund_screen/withdraw_screen_large.dart';
import 'package:roloxmoney/widget/responsive_widget.dart';

class WithdrawFundScreen extends StatelessWidget {
  final withdrawFundScaffoldKey = GlobalKey<ScaffoldState>();
  static const String routeName = '/withdrawFundScreen';
  final WithdrawFundController withdrawFundController = Get.find();

  @override
  Widget build(BuildContext context) {
    Get.put(WithdrawFundController());
    return GetBuilder<WithdrawFundController>(
      assignId: true,
      builder: (controller) {
        return ResponsiveWidget(
          largeScreen: WithdrawFundScreenLarge(
              controller: withdrawFundController,
              scaffoldKey: withdrawFundScaffoldKey),
          mediumScreen: WithdrawFundScreenLarge(
              controller: withdrawFundController,
              scaffoldKey: withdrawFundScaffoldKey),
          smallScreen: WithdrawFundScreenLarge(
              controller: withdrawFundController,
              scaffoldKey: withdrawFundScaffoldKey),
        );
      },
    );
  }
}
