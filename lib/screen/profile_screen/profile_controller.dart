import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/singleton.dart';
import 'package:roloxmoney/utils/RoloxKey.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../login_profile_screen/login_profile_controller.dart';

enum ModelOfWork { fullTime, partTime }

/*Chinnadurai Viswanathan*/
class ProfileController extends GetxController with StateMixin {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController mobilNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController businessNameController = TextEditingController();
  TextEditingController bankAccountController = TextEditingController();
  TextEditingController bankIFSCController = TextEditingController();
  RxBool isFreelancer = false.obs;
  RxBool isLogo = false.obs;
  final form = GlobalKey<FormState>();
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
    Singleton.supabaseInstance.client
        .from(RoloxKey.supaBaseUserTable)
        .select('*')
        .eq('id', Singleton.mobileUserId)
        .then((userResponse) {
      firstNameController.text = userResponse[0]['name'];
      emailController.text = userResponse[0]['email'];
      isFreelancer.value = userResponse[0]['profiletype'] == 1;
      mobilNumberController.text = userResponse[0]['phone']
          .toString()
          .substring(userResponse[0]['phone'].toString().contains('+91')
              ? 3
              : userResponse[0]['phone'].toString().contains('91')
                  ? 2
                  : userResponse[0]['phone'].toString().contains('1')
                      ? 1
                      : 0);

      Singleton.supabaseInstance.client
          .from(RoloxKey.supaBaseCompanyTable)
          .select('companyName')
          .eq('userid', [Singleton.mobileUserId]).then((value) {
        if (value is List) {
          businessNameController.text = value[0]['companyName'];
        }
      });
      change(null, status: RxStatus.success());
    });
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
