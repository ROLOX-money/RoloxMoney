import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/screen/template_screen/template_controller.dart';
import 'package:roloxmoney/utils/image_resource.dart';
import 'package:roloxmoney/widget/rolox_money_widget.dart';

/*Chinnadurai Viswanathan*/
// ignore: must_be_immutable
class TemplateScreenSmall extends StatefulWidget {
  TemplateController? controller;
  GlobalKey<ScaffoldState>? scaffoldKey;

  TemplateScreenSmall(
      {Key? key, required this.controller, required this.scaffoldKey})
      : super(key: key);

  @override
  TemplateScreenSmallState createState() => TemplateScreenSmallState();
}

class TemplateScreenSmallState extends State<TemplateScreenSmall> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(TemplateController());
    return RoloxMoneyWidgetState(
      rxStatus: widget.controller!.status,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              ImageResource.splashScreen,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: const Scaffold(
          backgroundColor: Colors.transparent,
        ) /* add child content here */,
      ),
    );
  }
}
