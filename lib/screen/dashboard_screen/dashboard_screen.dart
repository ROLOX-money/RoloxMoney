import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/screen/dashboard_screen/dashboard_controller.dart';
import 'package:roloxmoney/screen/dashboard_screen/dashboard_screen_small.dart';
import 'package:roloxmoney/screen/template_screen/template_controller.dart';
import 'package:roloxmoney/screen/template_screen/template_screen_small.dart';
import 'package:roloxmoney/widget/responsive_widget.dart';

/*Chinnadurai Viswanathan*/
class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key? key}) : super(key: key);
  static const String routeName = '/dashboardScreen';
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final DashboardController controller = Get.find();

  @override
  DashboardScreenState createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(DashboardController());
    return GetBuilder<DashboardController>(
      assignId: true,
      builder: (controller) {
        return ResponsiveWidget(
          largeScreen: DashboardScreenSmall(
              controller: controller, scaffoldKey: widget.scaffoldKey),
          mediumScreen: DashboardScreenSmall(
              controller: controller, scaffoldKey: widget.scaffoldKey),
          smallScreen: DashboardScreenSmall(
              controller: controller, scaffoldKey: widget.scaffoldKey),
        );
      },
    );
  }
}
