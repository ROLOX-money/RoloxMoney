import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/screen/payment_screen/add_bank_account/add_bank_account_controller.dart';
import 'package:roloxmoney/screen/payment_screen/add_bank_account/add_bank_account_screen_large.dart';
import 'package:roloxmoney/screen/payment_screen/add_bank_account/add_bank_account_screen_small.dart';
import 'package:roloxmoney/widget/responsive_widget.dart';

/*Chinnadurai Viswanathan*/
class AddBankAccountScreen extends StatefulWidget {
  AddBankAccountScreen({Key? key}) : super(key: key);
  static const String routeName = '/addBankAccountScreen';
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final AddBankAccountController controller = Get.find();

  @override
  AddBankAccountScreenState createState() => AddBankAccountScreenState();
}

class AddBankAccountScreenState extends State<AddBankAccountScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(AddBankAccountController());
    return GetBuilder<AddBankAccountController>(
      assignId: true,
      builder: (controller) {
        return ResponsiveWidget(
          largeScreen: AddBankAccountScreenLarge(
              controller: controller, scaffoldKey: widget.scaffoldKey),
          mediumScreen: AddBankAccountScreenSmall(
              controller: controller, scaffoldKey: widget.scaffoldKey),
          smallScreen: AddBankAccountScreenSmall(
              controller: controller, scaffoldKey: widget.scaffoldKey),
        );
      },
    );
  }
}
