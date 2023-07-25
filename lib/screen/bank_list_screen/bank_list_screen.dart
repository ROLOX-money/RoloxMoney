import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/screen/bank_list_screen/bank_list_controller.dart';
import 'package:roloxmoney/screen/bank_list_screen/bank_list_screen_large.dart';
import 'package:roloxmoney/screen/bank_list_screen/bank_list_screen_small.dart';
import 'package:roloxmoney/widget/responsive_widget.dart';

/*Chinnadurai Viswanathan*/
class BankListScreen extends StatefulWidget {
  BankListScreen({Key? key}) : super(key: key);
  static const String routeName = '/bankListScreen';
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final BankListController controller = Get.find();

  @override
  BankListScreenState createState() => BankListScreenState();
}

class BankListScreenState extends State<BankListScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(BankListController());
    return GetBuilder<BankListController>(
      assignId: true,
      builder: (controller) {
        return ResponsiveWidget(
          largeScreen: BankListLargeScreen(
              controller: controller, scaffoldKey: widget.scaffoldKey),
          mediumScreen: BankListScreenSmall(
              controller: controller, scaffoldKey: widget.scaffoldKey),
          smallScreen: BankListScreenSmall(
              controller: controller, scaffoldKey: widget.scaffoldKey),
        );
      },
    );
  }
}
