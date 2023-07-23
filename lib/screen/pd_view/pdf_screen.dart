import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/screen/business_profile_screen/business_profile_controller.dart';
import 'package:roloxmoney/screen/business_profile_screen/business_profile_screen_small.dart';
import 'package:roloxmoney/screen/pd_view/pdf_controller.dart';
import 'package:roloxmoney/screen/pd_view/pdf_screen_small.dart';
import 'package:roloxmoney/screen/profile_screen/profile_controller.dart';
import 'package:roloxmoney/screen/profile_screen/profile_screen_small.dart';
import 'package:roloxmoney/widget/responsive_widget.dart';

/*Chinnadurai Viswanathan*/
class PDFScreen extends StatefulWidget {
  PDFScreen({Key? key}) : super(key: key);
  static const String routeName = '/pdf_view_screen';

  @override
  PDFScreenState createState() => PDFScreenState();
}

class PDFScreenState extends State<PDFScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    Get.put(PDFController());
    return GetBuilder<PDFController>(
      assignId: true,
      builder: (controller) {
        return ResponsiveWidget(
          largeScreen:
              PDFViewSmall(controller: controller, scaffoldKey: scaffoldKey),
          mediumScreen:
              PDFViewSmall(controller: controller, scaffoldKey: scaffoldKey),
          smallScreen:
              PDFViewSmall(controller: controller, scaffoldKey: scaffoldKey),
        );
      },
    );
  }
}
