import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/screen/login_screen/login_controller.dart';

/*Chinnadurai Viswanathan*/
class IndividualProfileController extends GetxController with StateMixin {
  TextEditingController otherNatureController = TextEditingController();
  TextEditingController otherIndustryOfWorkController = TextEditingController();
  TextEditingController panNumberController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController gstController = TextEditingController();
  TextEditingController plsIfSpecifyController = TextEditingController();
  TextEditingController plsIfSpecifyControllerForNatureOfWork = TextEditingController();
  TextEditingController mobilNumberController = TextEditingController();
  TextEditingController aadharNoController = TextEditingController();

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
  RxList<String> natureOfBusiness = [
    'Software',
    'Driver',
    'Auditor',
    'Others',
  ].obs;
  RxString natureOfBusinessValue = 'Software'.obs;
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

  final form = GlobalKey<FormState>();

  LoginController loginController = Get.put(LoginController());

  @override
  void onInit() async {
    change(null, status: RxStatus.success());
    Future.delayed(const Duration(seconds: 5), () {});
    mobilNumberController.value = loginController.mobilNumberController.value;
    super.onInit();
  }

  void updateValuesOnUI({String? value, RxString? variableName}) {
    if (variableName == this.modelOfWorkValue) {
      modelOfWorkValue = value!.obs;
      change(modelOfWorkValue);
    } else if (variableName == this.natureOfBusinessValue) {
      natureOfBusinessValue = value!.obs;
      change(natureOfBusinessValue);
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
