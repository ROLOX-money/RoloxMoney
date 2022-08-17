import 'dart:async';
import 'package:get/get.dart';
/*Chinnadurai Viswanathan*/

class LoginController extends GetxController with StateMixin {
  @override
  void onInit() async {
    change(null, status: RxStatus.success());
    Future.delayed(const Duration(seconds: 5), () {});
    super.onInit();
  }
}
