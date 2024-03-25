import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/screen/clients_screen/add_client/add_client_controller.dart';
import 'package:roloxmoney/screen/clients_screen/add_client/add_client_screen_small.dart';
import 'package:roloxmoney/screen/projects_screen/add_project/add_project_controller.dart';
import 'package:roloxmoney/screen/projects_screen/add_project/add_project_screen_small.dart';
import 'package:roloxmoney/widget/responsive_widget.dart';

/*Chinnadurai Viswanathan*/
class AddProjectScreen extends StatefulWidget {
  AddProjectScreen({Key? key}) : super(key: key);
  static const String routeName = '/addProjectScreen';
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final AddProjectController controller = Get.find();

  @override
  AddProjectScreenState createState() => AddProjectScreenState();
}

class AddProjectScreenState extends State<AddProjectScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(AddProjectController());
    return GetBuilder<AddProjectController>(
      assignId: true,
      builder: (controller) {
        return ResponsiveWidget(
          largeScreen: AddProjectScreenSmall(
              controller: controller, scaffoldKey: widget.scaffoldKey),
          mediumScreen: AddProjectScreenSmall(
              controller: controller, scaffoldKey: widget.scaffoldKey),
          smallScreen: AddProjectScreenSmall(
              controller: controller, scaffoldKey: widget.scaffoldKey),
        );
      },
    );
  }
}
