import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/screen/home_screen/home_controller.dart';
import 'package:roloxmoney/screen/home_screen/home_screen_small.dart';
import 'package:roloxmoney/widget/responsive_widget.dart';

import 'home_screen_large.dart';

/*Chinnadurai Viswanathan*/
class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  static const String routeName = '/homeScreen';
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final HomeController controller = Get.find();

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return GetBuilder<HomeController>(
      assignId: true,
      builder: (controller) {
        return ResponsiveWidget(
          largeScreen: HomeScreenLarge(
              controller: controller, scaffoldKey: widget.scaffoldKey),
          mediumScreen: HomeScreenSmall(
              controller: controller, scaffoldKey: widget.scaffoldKey),
          smallScreen: HomeScreenSmall(
              controller: controller, scaffoldKey: widget.scaffoldKey),
        );
      },
    );
  }
}
