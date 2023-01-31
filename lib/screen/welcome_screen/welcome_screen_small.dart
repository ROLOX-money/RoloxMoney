import 'package:flutter/material.dart';
import 'package:roloxmoney/screen/welcome_screen/welcome_screen_controller.dart';
import 'package:roloxmoney/utils/image_resource.dart';
import 'package:roloxmoney/widget/rolox_money_widget.dart';

class WelcomeScreenSmall extends StatefulWidget {
  WelcomeController? controller;
  GlobalKey<ScaffoldState>? scaffoldKey;

  WelcomeScreenSmall(
      {Key? key, required this.controller, required this.scaffoldKey})
      : super(key: key);

  @override
  WelcomeScreenSmallState createState() => WelcomeScreenSmallState();
}

class WelcomeScreenSmallState extends State<WelcomeScreenSmall> {
  @override
  Widget build(BuildContext context) {
    return RoloxMoneyWidgetState(
        rxStatus: widget.controller!.status,
        child: Scaffold(
          body: Image(image:
          AssetImage(
            ImageResource.welcomeScreenImage,
          )),
        ));
  }
}
