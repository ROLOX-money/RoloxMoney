import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/screen/splash_screen/splash_controller.dart';
import 'package:roloxmoney/utils/image_resource.dart';
import 'package:roloxmoney/widget/rolox_money_widget.dart';
/*Chinnadurai Viswanathan*/

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const String routeName = '/splashScreen';

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(SplashScreenController());
    return GetBuilder<SplashScreenController>(
      assignId: true,
      builder: (controller) {
        return RoloxMoneyWidgetState(
          rxStatus: controller.status,
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  ImageResource.rolox,
                ),
                fit: BoxFit.contain,
              ),
            ),
            child: Scaffold(
              body: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                    child: Container(
                      height: 30,
                      width: 30,
                      margin: const EdgeInsets.only(bottom: 20),
                      child: const CircularProgressIndicator(
                        strokeWidth: 1,
                      ),
                    ),
                  )
                ],
              ),
              backgroundColor: Colors.transparent,
            ) /* add child content here */,
          ),
        );
      },
    );
  }
}
