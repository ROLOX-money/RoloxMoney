import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../login_profile_screen/login_profile_controller.dart';

enum ModelOfWork { fullTime, partTime }

/*Chinnadurai Viswanathan*/
class BusinessProfileController extends GetxController with StateMixin {
  TextEditingController otherNatureController = TextEditingController();
  TextEditingController businessNameController = TextEditingController();
  TextEditingController otherIndustryOfWorkController = TextEditingController();
  TextEditingController mobilNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController plsIfSpecifyController = TextEditingController();


  Rx<ModelOfWork> modelOfWork = ModelOfWork.fullTime.obs;
  RxList<String> roleDropDown = [
    'Founder',
    'CEO',
    'Admin',
  ].obs;
  RxString roleDropDownValue = 'Founder'.obs;
  RxList<String> natureOfWork = [
    'Software',
    'Driver',
    'Auditor',
    'Other',
  ].obs;
  RxString natureOfWorkValue = 'Software'.obs;


  RxBool iDontHaveBusiness = true.obs;

  RxList<String> industryOfWork = [
    'Telecom',
    'Cinema',
    'Account',
    'Banking',
    'Other',
  ].obs;
  RxString industryOfWorkValue = 'Telecom'.obs;

  RxList<String> typeOfAddress = [
    'Work',
    'Home',
    'Current',
    'Residence',
  ].obs;
  RxString typeOfAddressValue = 'Home'.obs;
  RxBool gstNumber = true.obs;
  RxInt currentStep = 1.obs;

  @override
  void onInit() async {
    change(null, status: RxStatus.success());
    Future.delayed(const Duration(seconds: 5), () {});
    super.onInit();
  }

  void updateValuesOnUI({String? value, RxString? variableName}) {
    if (variableName == this.roleDropDownValue) {
      roleDropDownValue = value!.obs;
      change(roleDropDownValue);
    } else if (variableName == this.natureOfWorkValue) {
      natureOfWorkValue = value!.obs;
      change(natureOfWorkValue);
    } else if (variableName == this.industryOfWorkValue) {
      industryOfWorkValue = value!.obs;
      change(industryOfWorkValue);
    } else if (variableName == this.typeOfAddressValue) {
      typeOfAddressValue = value!.obs;
      change(typeOfAddressValue);
    }
  }

  void modelOfWorkToggle({ModelOfWork? value}) {
    modelOfWork = value!.obs;
    change(modelOfWork);
  }

  void noBusinessCheckBox({bool? values}) {
    iDontHaveBusiness = values!.obs;
    change(iDontHaveBusiness);
  }

  void noGSTCheckBox({bool? values}) {
    gstNumber = values!.obs;
    change(gstNumber);
  }

  void stepCount({required int values}) {
    currentStep = values.obs;
    change(currentStep);
  }
}
