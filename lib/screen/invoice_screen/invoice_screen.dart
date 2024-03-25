import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/screen/clients_screen/clients_controller.dart';
import 'package:roloxmoney/screen/clients_screen/clients_screen_small.dart';
import 'package:roloxmoney/screen/invoice_screen/invoice_controller.dart';
import 'package:roloxmoney/screen/invoice_screen/invoice_screen_small.dart';
import 'package:roloxmoney/screen/projects_screen/projects_controller.dart';
import 'package:roloxmoney/screen/projects_screen/projects_screen_small.dart';
import 'package:roloxmoney/screen/template_screen/template_controller.dart';
import 'package:roloxmoney/screen/template_screen/template_screen_small.dart';
import 'package:roloxmoney/widget/responsive_widget.dart';

/*Chinnadurai Viswanathan*/
class InvoiceScreen extends StatefulWidget {
  InvoiceScreen({Key? key}) : super(key: key);
  static const String routeName = '/invoiceScreen';
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final InvoiceController controller = Get.find();

  @override
  InvoiceScreenState createState() => InvoiceScreenState();
}

class InvoiceScreenState extends State<InvoiceScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(InvoiceController());
    return GetBuilder<InvoiceController>(
      assignId: true,
      builder: (controller) {
        return ResponsiveWidget(
          largeScreen: InvoiceScreenSmall(
              controller: controller, scaffoldKey: widget.scaffoldKey),
          mediumScreen: InvoiceScreenSmall(
              controller: controller, scaffoldKey: widget.scaffoldKey),
          smallScreen: InvoiceScreenSmall(
              controller: controller, scaffoldKey: widget.scaffoldKey),
        );
      },
    );
  }
}
