import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/screen/clients_screen/clients_controller.dart';
import 'package:roloxmoney/screen/clients_screen/clients_screen_small.dart';
import 'package:roloxmoney/screen/invoice_screen/invoice_controller.dart';
import 'package:roloxmoney/screen/invoice_screen/invoice_screen_small.dart';
import 'package:roloxmoney/screen/payment_screen/payment_controller.dart';
import 'package:roloxmoney/screen/payment_screen/payment_screen_small.dart';
import 'package:roloxmoney/screen/projects_screen/projects_controller.dart';
import 'package:roloxmoney/screen/projects_screen/projects_screen_small.dart';
import 'package:roloxmoney/screen/template_screen/template_controller.dart';
import 'package:roloxmoney/screen/template_screen/template_screen_small.dart';
import 'package:roloxmoney/widget/responsive_widget.dart';

/*Chinnadurai Viswanathan*/
class PaymentScreen extends StatefulWidget {
  PaymentScreen({Key? key}) : super(key: key);
  static const String routeName = '/paymentScreen';
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final PaymentController controller = Get.find();

  @override
  PaymentScreenState createState() => PaymentScreenState();
}

class PaymentScreenState extends State<PaymentScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(PaymentController());
    return GetBuilder<PaymentController>(
      assignId: true,
      builder: (controller) {
        return ResponsiveWidget(
          largeScreen: PaymentScreenSmall(
              controller: controller, scaffoldKey: widget.scaffoldKey),
          mediumScreen: PaymentScreenSmall(
              controller: controller, scaffoldKey: widget.scaffoldKey),
          smallScreen: PaymentScreenSmall(
              controller: controller, scaffoldKey: widget.scaffoldKey),
        );
      },
    );
  }
}
