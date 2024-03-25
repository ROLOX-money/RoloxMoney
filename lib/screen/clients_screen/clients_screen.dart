import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/screen/clients_screen/client_screen_large.dart';
import 'package:roloxmoney/screen/clients_screen/clients_controller.dart';
import 'package:roloxmoney/screen/clients_screen/clients_screen_small.dart';
import 'package:roloxmoney/widget/responsive_widget.dart';

/*Chinnadurai Viswanathan*/
class ClientsScreen extends StatefulWidget {
  ClientsScreen({Key? key}) : super(key: key);
  static const String routeName = '/clientsScreen';
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final ClientsController controller = Get.find();

  @override
  ClientsScreenState createState() => ClientsScreenState();
}

class ClientsScreenState extends State<ClientsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(ClientsController());
    return GetBuilder<ClientsController>(
      assignId: true,
      builder: (controller) {
        return ResponsiveWidget(
          largeScreen: ClientScreenLarge(
              controller: controller, scaffoldKey: widget.scaffoldKey),
          mediumScreen: ClientScreenLarge(
              controller: controller, scaffoldKey: widget.scaffoldKey),
          smallScreen: ClientsScreenSmall(
              controller: controller, scaffoldKey: widget.scaffoldKey),
        );
      },
    );
  }
}
