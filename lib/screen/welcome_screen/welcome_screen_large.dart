import 'package:flutter/material.dart';
import 'package:roloxmoney/screen/welcome_screen/welcome_screen_controller.dart';
import 'package:roloxmoney/widget/rolox_money_widget.dart';

class WelcomeScreenLarge extends StatefulWidget {
  WelcomeController? controller;
  GlobalKey<ScaffoldState>? scaffoldKey;

  WelcomeScreenLarge(
      {Key? key, required this.controller, required this.scaffoldKey})
      : super(key: key);

  @override
  WelcomeScreenLargeState createState() => WelcomeScreenLargeState();
}

class WelcomeScreenLargeState extends State<WelcomeScreenLarge> {
  @override
  Widget build(BuildContext context) {
    return RoloxMoneyWidgetState(
        rxStatus: widget.controller!.status,
        child: Scaffold(
          body: Column(
            children: [

            ],
          ),
        ));
  }
}
