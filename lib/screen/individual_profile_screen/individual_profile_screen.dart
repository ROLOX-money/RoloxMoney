import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/screen/individual_profile_screen/individual_profile_controller.dart';
import 'package:roloxmoney/screen/individual_profile_screen/individual_profile_screen_small.dart';
import 'package:roloxmoney/widget/responsive_widget.dart';

/*Chinnadurai Viswanathan*/
class IndividualProfileScreen extends StatefulWidget {
  IndividualProfileScreen({Key? key}) : super(key: key);
  static const String routeName = '/individualProfileScreen';

  @override
  IndividualProfileScreenState createState() => IndividualProfileScreenState();
}

class IndividualProfileScreenState extends State<IndividualProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    Get.put(IndividualProfileController());
    return GetBuilder<IndividualProfileController>(
      assignId: true,
      builder: (controller) {
        return ResponsiveWidget(
          largeScreen: IndividualProfileScreenSmall(
              controller: controller, scaffoldKey: scaffoldKey),
          mediumScreen: IndividualProfileScreenSmall(
              controller: controller, scaffoldKey: scaffoldKey),
          smallScreen: IndividualProfileScreenSmall(
              controller: controller, scaffoldKey: scaffoldKey),
        );
      },
    );
  }
}
