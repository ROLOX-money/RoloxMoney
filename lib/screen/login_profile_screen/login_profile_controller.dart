import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/*Chinnadurai Viswanathan*/
enum TypOfBusiness { individual, business, agency }

class LoginProfileController extends GetxController with StateMixin {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailIDController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController panNumberController = TextEditingController();
  TextEditingController gstNumberController = TextEditingController();
  TextEditingController aadhaarNumberController = TextEditingController();

  TextEditingController socialId = TextEditingController();
  Rx<TypOfBusiness> typOfBusiness = TypOfBusiness.business.obs;

  final form = GlobalKey<FormState>();

  @override
  void onInit() async {
    change(null, status: RxStatus.success());
    Future.delayed(const Duration(seconds: 5), () {});
    super.onInit();
  }

  void businessToggle({TypOfBusiness? value}) {
    typOfBusiness = value!.obs;
    change(typOfBusiness);
  }
}
