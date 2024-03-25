import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/screen/business_profile_screen/business_profile_controller.dart';
import 'package:roloxmoney/screen/business_profile_screen/business_profile_screen_small.dart';
import 'package:roloxmoney/widget/responsive_widget.dart';

import 'busines_profile_large_screen.dart';

/*Chinnadurai Viswanathan*/
class BusinessProfileScreen extends StatefulWidget {
  BusinessProfileScreen({Key? key}) : super(key: key);
  static const String routeName = '/businessProfileScreen';

  @override
  BusinessProfileScreenState createState() => BusinessProfileScreenState();
}

class BusinessProfileScreenState extends State<BusinessProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    Get.put(BusinessProfileController());
    return GetBuilder<BusinessProfileController>(
      assignId: true,
      builder: (controller) {
        return ResponsiveWidget(
          largeScreen: BusinessProfileLargeScreen(
              controller: controller, scaffoldKey: scaffoldKey),
          mediumScreen: BusinessProfileScreenSmall(
              controller: controller, scaffoldKey: scaffoldKey),
          smallScreen: BusinessProfileScreenSmall(
              controller: controller, scaffoldKey: scaffoldKey),
        );
      },
    );
  }
}
