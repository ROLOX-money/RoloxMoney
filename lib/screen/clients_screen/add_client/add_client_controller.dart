import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

/*Chinnadurai Viswanathan*/
enum TypOfBusiness { individual, business }

class AddClientController extends GetxController with StateMixin {
  TextEditingController brandNameController = TextEditingController();
  TextEditingController gstNumberController = TextEditingController();
  TextEditingController legalNameController = TextEditingController();
  TextEditingController emailIDController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController fullAddressController = TextEditingController();
  TextEditingController panNoController = TextEditingController();
  TextEditingController aadhaarNoController = TextEditingController();
  TextEditingController contactPersonController = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  TextEditingController designationController = TextEditingController();

  Rx<TypOfBusiness> typOfBusiness = TypOfBusiness.business.obs;

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
