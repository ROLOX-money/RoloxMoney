import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/screen/projects_screen/projects_controller.dart';
import 'package:roloxmoney/screen/projects_screen/projects_screen_small.dart';
import 'package:roloxmoney/widget/responsive_widget.dart';

import 'project_screen_large.dart';

/*Chinnadurai Viswanathan*/
class ProjectsScreen extends StatefulWidget {
  ProjectsScreen({Key? key}) : super(key: key);
  static const String routeName = '/projectsScreen';
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final ProjectsController controller = Get.find();

  @override
  ProjectsScreenState createState() => ProjectsScreenState();
}

class ProjectsScreenState extends State<ProjectsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(ProjectsController());
    return GetBuilder<ProjectsController>(
      assignId: true,
      builder: (controller) {
        return ResponsiveWidget(
          largeScreen: ProjectScreenLarge(
              controller: controller, scaffoldKey: widget.scaffoldKey),
          mediumScreen: ProjectScreenLarge(
              controller: controller, scaffoldKey: widget.scaffoldKey),
          smallScreen: ProjectsScreenSmall(
              controller: controller, scaffoldKey: widget.scaffoldKey),
        );
      },
    );
  }
}
