import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/screen/clients_screen/add_client/add_client_controller.dart';
import 'package:roloxmoney/screen/clients_screen/add_client/add_client_screen_small.dart';
import 'package:roloxmoney/widget/responsive_widget.dart';

/*Chinnadurai Viswanathan*/
class AddClientScreen extends StatefulWidget {
  AddClientScreen({Key? key}) : super(key: key);
  static const String routeName = '/addClientScreen';
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final AddClientController controller = Get.find();

  @override
  AddClientScreenState createState() => AddClientScreenState();
}

class AddClientScreenState extends State<AddClientScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(AddClientController());
    return GetBuilder<AddClientController>(
      assignId: true,
      builder: (controller) {
        return ResponsiveWidget(
          largeScreen: AddClientScreenSmall(
              controller: controller, scaffoldKey: widget.scaffoldKey),
          mediumScreen: AddClientScreenSmall(
              controller: controller, scaffoldKey: widget.scaffoldKey),
          smallScreen: AddClientScreenSmall(
              controller: controller, scaffoldKey: widget.scaffoldKey),
        );
      },
    );
  }
}
