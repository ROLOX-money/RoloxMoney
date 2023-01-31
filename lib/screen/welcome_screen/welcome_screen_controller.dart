import 'dart:async';
import 'package:get/get.dart';

/*Chinnadurai Viswanathan*/

class WelcomeController extends GetxController with StateMixin {
 
  

  @override
  void onInit() async {
    change(null, status: RxStatus.success());
    // if (kDebugMode) mobilNumberController.text = '9585313659';
    Future.delayed(const Duration(seconds: 5), () {
    });
    super.onInit();
  }



 
}
