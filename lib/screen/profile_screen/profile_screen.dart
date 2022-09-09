import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/screen/business_profile_screen/business_profile_controller.dart';
import 'package:roloxmoney/screen/business_profile_screen/business_profile_screen_small.dart';
import 'package:roloxmoney/screen/profile_screen/profile_controller.dart';
import 'package:roloxmoney/screen/profile_screen/profile_screen_small.dart';
import 'package:roloxmoney/widget/responsive_widget.dart';

/*Chinnadurai Viswanathan*/
class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);
  static const String routeName = '/profileScreen';

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    Get.put(ProfileController());
    return GetBuilder<ProfileController>(
      assignId: true,
      builder: (controller) {
        return ResponsiveWidget(
          largeScreen: ProfileScreenSmall(
              controller: controller, scaffoldKey: scaffoldKey),
          mediumScreen: ProfileScreenSmall(
              controller: controller, scaffoldKey: scaffoldKey),
          smallScreen: ProfileScreenSmall(
              controller: controller, scaffoldKey: scaffoldKey),
        );
      },
    );
  }
}
