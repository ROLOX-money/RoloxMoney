import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/screen/clients_screen/add_client/add_client_controller.dart';
import 'package:roloxmoney/screen/clients_screen/add_client/add_client_screen_small.dart';
import 'package:roloxmoney/screen/invoice_screen/add_invoice/add_invoice_controller.dart';
import 'package:roloxmoney/screen/invoice_screen/add_invoice/add_invoice_screen_small.dart';
import 'package:roloxmoney/screen/payment_screen/add_bank_account/add_bank_account_controller.dart';
import 'package:roloxmoney/screen/payment_screen/add_bank_account/add_bank_account_screen_small.dart';
import 'package:roloxmoney/screen/projects_screen/add_project/add_project_controller.dart';
import 'package:roloxmoney/screen/projects_screen/add_project/add_project_screen_small.dart';
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
          largeScreen: AddBankAccountScreenSmall(
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
