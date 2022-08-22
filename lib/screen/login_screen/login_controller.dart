import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
/*Chinnadurai Viswanathan*/

class LoginController extends GetxController with StateMixin {
  TextEditingController mobilNumberController = TextEditingController();

  RxBool isLogin = true.obs;

  @override
  void onInit() async {
    change(null, status: RxStatus.success());
    Future.delayed(const Duration(seconds: 5), () {});
    super.onInit();
  }
}
