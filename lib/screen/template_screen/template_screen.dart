import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/screen/template_screen/template_controller.dart';
import 'package:roloxmoney/screen/template_screen/template_screen_small.dart';
import 'package:roloxmoney/widget/responsive_widget.dart';

/*Chinnadurai Viswanathan*/
class TemplateScreen extends StatefulWidget {
  TemplateScreen({Key? key}) : super(key: key);
  static const String routeName = '/templateScreen';
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final TemplateController controller = Get.find();

  @override
  TemplateScreenState createState() => TemplateScreenState();
}

class TemplateScreenState extends State<TemplateScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(TemplateController());
    return GetBuilder<TemplateController>(
      assignId: true,
      builder: (controller) {
        return ResponsiveWidget(
          largeScreen: TemplateScreenSmall(
              controller: controller, scaffoldKey: widget.scaffoldKey),
          mediumScreen: TemplateScreenSmall(
              controller: controller, scaffoldKey: widget.scaffoldKey),
          smallScreen: TemplateScreenSmall(
              controller: controller, scaffoldKey: widget.scaffoldKey),
        );
      },
    );
  }
}
