import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

/*Chinnadurai Viswanathan*/
class AddProjectController extends GetxController with StateMixin {
  TextEditingController projectNameController = TextEditingController();
  TextEditingController clientNameController = TextEditingController();
  TextEditingController projectValueController = TextEditingController();
  TextEditingController projectDueDateDController = TextEditingController();
  TextEditingController emailIDController = TextEditingController();

  @override
  void onInit() async {
    change(null, status: RxStatus.success());
    Future.delayed(const Duration(seconds: 5), () {});
    super.onInit();
  }
}
