import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

/*Chinnadurai Viswanathan*/
class ProfileController extends GetxController with StateMixin {
  TextEditingController otherNatureController = TextEditingController();
  TextEditingController otherIndustryOfWorkController = TextEditingController();

  RxList<String> modelOfWork = [
    'Full Time',
    'Part Time',
    'Freelancer',
  ].obs;
  RxString modelOfWorkValue = 'Full Time'.obs;
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

  @override
  void onInit() async {
    change(null, status: RxStatus.success());
    Future.delayed(const Duration(seconds: 5), () {});
    super.onInit();
  }

  void updateValuesOnUI({String? value, RxString? variableName}) {
    if (variableName == this.modelOfWorkValue) {
      modelOfWorkValue = value!.obs;
      change(modelOfWorkValue);
    } else if (variableName == this.natureOfWorkValue) {
      natureOfWorkValue = value!.obs;
      change(natureOfWorkValue);
    } else if (variableName == this.industryOfWorkValue) {
      industryOfWorkValue = value!.obs;
      change(industryOfWorkValue);
    }
  }

  void noBusinessCheckBox({bool? values}) {
    iDontHaveBusiness = values!.obs;
    change(iDontHaveBusiness);
  }
}
