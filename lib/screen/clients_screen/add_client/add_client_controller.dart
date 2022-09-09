import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

/*Chinnadurai Viswanathan*/
class AddClientController extends GetxController with StateMixin {
  TextEditingController brandNameController = TextEditingController();
  TextEditingController gstNumberController = TextEditingController();
  TextEditingController legalNameController = TextEditingController();
  TextEditingController emailIDController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController fullAddressController = TextEditingController();

  @override
  void onInit() async {
    change(null, status: RxStatus.success());
    Future.delayed(const Duration(seconds: 5), () {});
    super.onInit();
  }
}
