import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/screen/invoice_screen/add_invoice/add_invoice_controller.dart';
import 'package:roloxmoney/screen/invoice_screen/add_invoice/add_invoice_screen_large.dart';
import 'package:roloxmoney/screen/invoice_screen/add_invoice/add_invoice_screen_small.dart';
import 'package:roloxmoney/widget/responsive_widget.dart';

/*Chinnadurai Viswanathan*/
class AddInvoiceScreen extends StatefulWidget {
  AddInvoiceScreen({Key? key}) : super(key: key);
  static const String routeName = '/addInvoiceScreen';
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final AddInvoiceController controller = Get.find();

  @override
  AddInvoiceScreenState createState() => AddInvoiceScreenState();
}

class AddInvoiceScreenState extends State<AddInvoiceScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(AddInvoiceController());
    return GetBuilder<AddInvoiceController>(
      assignId: true,
      builder: (controller) {
        return ResponsiveWidget(
          largeScreen: AddInvoiceScreenLarge(
              controller: controller, scaffoldKey: widget.scaffoldKey),
          mediumScreen: AddInvoiceScreenSmall(
              controller: controller, scaffoldKey: widget.scaffoldKey),
          smallScreen: AddInvoiceScreenSmall(
              controller: controller, scaffoldKey: widget.scaffoldKey),
        );
      },
    );
  }
}
