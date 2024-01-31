import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/screen/dashboard_screen/dashboard_screen.dart';
import 'package:roloxmoney/screen/login_screen/login_controller.dart';
import 'package:roloxmoney/screen/profile_screen/profile_controller.dart';
import 'package:roloxmoney/singleton.dart';
import 'package:roloxmoney/utils/RoloxKey.dart';
import 'package:roloxmoney/utils/app_utils.dart';
import 'package:roloxmoney/utils/supa_base_control.dart';

enum ModelOfWork { fullTime, partTime }

/*Chinnadurai Viswanathan*/
class BusinessProfileController extends GetxController
    with StateMixin, SupaBaseController {
  TextEditingController otherNatureController = TextEditingController();
  TextEditingController businessNameController = TextEditingController();
  TextEditingController otherIndustryOfWorkController = TextEditingController();
  TextEditingController mobilNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController plsIfSpecifyController = TextEditingController();
  TextEditingController gstController = TextEditingController();
  TextEditingController plsIfSpecifyControllerForNatureOfBusiness =
      TextEditingController();

  Rx<ModelOfWork> modelOfWork = ModelOfWork.fullTime.obs;
  RxList<String> roleDropDown = [
    'Founder',
    'Operations',
    'Accounts',
    'Finance',
    'Contractor',
    'Others',
  ].obs;
  RxString roleDropDownValue = 'Founder'.obs;
  RxList<String> natureOfWork = [
    'Software',
    'Driver',
    'Auditor',
    'Others',
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
    'Others',
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

  LoginController loginController = Get.put(LoginController());
  ProfileController profileController = Get.put(ProfileController());

  @override
  void onInit() async {
    change(null, status: RxStatus.success());
    mobilNumberController.value = loginController.mobilNumberController.value;
    emailController.value = profileController.emailController.value;
    Future.delayed(const Duration(seconds: 5), () {});
    super.onInit();
  }

  void validatingProfile() {
    if (iDontHaveBusiness.isTrue && businessNameController.text.trim() == '') {
      AppUtils.showErrorSnackBar(Get.context!,
          'Business name is empty... Please consider your business name',
          durations: 3000);
    } else if (natureOfBusinessValue.value.toLowerCase() == 'others' &&
        plsIfSpecifyControllerForNatureOfBusiness.text.trim() == '') {
      AppUtils.showErrorSnackBar(Get.context!,
          'Nature of business is empty... Please consider your nature of business',
          durations: 3000);
    } else if (natureOfWorkValue.value.toLowerCase() == 'others' &&
        plsIfSpecifyController.text.trim() == '') {
      AppUtils.showErrorSnackBar(Get.context!,
          'Nature of work is empty... Please consider your nature of work',
          durations: 3000);
    } else if (!RegExp(r'^[0-9]{10}$')
        .hasMatch(mobilNumberController.text.trim())) {
      AppUtils.showErrorSnackBar(Get.context!,
          'Invalid mobile number... Please consider your mobile number',
          durations: 3000);
    } else if (!RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    ).hasMatch(emailController.text.trim())) {
      AppUtils.showErrorSnackBar(
          Get.context!, 'Invalid email address... Please consider your email',
          durations: 3000);
    } else {
      change(null, status: RxStatus.loading());
      var loginValues = Get.arguments;
      toInsert(userData: {
        'name': loginValues['name'],
        'email': loginValues['emailAddress'],
        'phoneVerfied': true,
        'socialId': loginValues['socialId'],
        'phone': Singleton.supabaseInstance.client.auth.currentUser!.phone!
                .contains('+')
            ? Singleton.supabaseInstance.client.auth.currentUser!.phone!
            : '+${Singleton.supabaseInstance.client.auth.currentUser!.phone!}',
        'profiletype': loginValues['profileType'],
      }, tableName: RoloxKey.supaBaseUserTable)
          .then((value) {
        if (value) {
          SupaBaseController.toGetTheSelectedID(
                  searchValue: Singleton
                          .supabaseInstance.client.auth.currentUser!.phone!
                          .contains('+')
                      ? Singleton
                          .supabaseInstance.client.auth.currentUser?.phone
                      : '+${Singleton.supabaseInstance.client.auth.currentUser?.phone}',
                  tableName: RoloxKey.supaBaseUserTable,
                  whatTypeOfValueYouWant: 'id',
                  searchKey: 'phone')
              .then((userResponseList) {
            toInsert(userData: {
              'companyName': businessNameController.text.trim(),
              'typeOfbuisness': loginValues['profileType'],
              'userid': [userResponseList[0]['id']],
            }, tableName: RoloxKey.supaBaseCompanyTable)
                .then((value) {
              if (value) {
                SupaBaseController.toGetTheSelectedID(
                        searchValue: businessNameController.text.trim(),
                        tableName: RoloxKey.supaBaseCompanyTable,
                        whatTypeOfValueYouWant: 'id',
                        searchKey: 'companyName')
                    .then((companyResponse) {
                  debugPrint('values from supabase--> ${companyResponse}');
                  debugPrint(
                      'searching values--> ${userResponseList[0]['id']}');
                  Future.wait([
                    toInsert(userData: {
                      'Pannumber': loginValues['panNumber'],
                      'profiletype': loginValues['profileType'],
                      'refrenceid': userResponseList[0]['id'],
                    }, tableName: RoloxKey.supaBasePANTable),
                    toInsert(userData: {
                      'gstNumber': loginValues['gstNumberController'],
                      'profileType': loginValues['profileType'],
                      'refrenceid': userResponseList[0]['id'],
                    }, tableName: RoloxKey.supaBaseGSTTable),
                    //Todo add the nature of work and business
                  ]).then((value) {
                    if (value.every((item) => item)) {
                      toInsert(userData: {
                        'designation': roleDropDownValue.obs.value.value,
                        'phone': mobilNumberController.text.trim(),
                        'natureOfWork':
                            natureOfWorkValue.value.toLowerCase() == 'others'
                                ? plsIfSpecifyController.text.trim()
                                : natureOfWorkValue.value,
                        'natureOfBusiness':
                            natureOfBusinessValue.value.toLowerCase() ==
                                    'others'
                                ? plsIfSpecifyControllerForNatureOfBusiness.text
                                : natureOfBusinessValue.value,
                        'companyRefrenceId': companyResponse[0]['id'],
                      }, tableName: RoloxKey.supaBaseProfileCompanyTable)
                          .then((value) {
                        change(null, status: RxStatus.success());
                        if (value) {
                          Get.offAndToNamed(DashboardScreen.routeName,
                              arguments: mobilNumberController.text);
                        } else {
                          AppUtils.showErrorSnackBar(Get.context!,
                              'Something went wrong. Please try again',
                              durations: 3000);
                        }
                      });
                    } else {
                      AppUtils.showErrorSnackBar(Get.context!,
                          'Something went wrong. Please try again',
                          durations: 3000);
                    }
                  });
                });
              } else {
                AppUtils.showErrorSnackBar(
                    Get.context!, 'Something went wrong. Please try again',
                    durations: 3000);
              }
            });
          });
        } else {
          AppUtils.showErrorSnackBar(
              Get.context!, 'Something went wrong..Please tray again',
              durations: 2000);
        }
      });
      change(null, status: RxStatus.success());
    }
  }

  void updateNatureOfWork(String value) {
    natureOfWorkValue = value.obs;
    change(natureOfWorkValue);
  }

  void updateNatureOfBusinessValue(String value) {
    natureOfBusinessValue = value.obs;
    change(natureOfBusinessValue);
  }

  void updateValuesOnUI({String? value, RxString? variableName}) {
    if (variableName == roleDropDownValue) {
      roleDropDownValue = value!.obs;
      change(roleDropDownValue);
    }
  }

  void updateRoleDropDownValue({required String value}) {
    roleDropDownValue = value.obs;
    change(roleDropDownValue);
  }

  void modelOfWorkToggle({ModelOfWork? value}) {
    modelOfWork = value!.obs;
    change(modelOfWork);
  }

  void noBusinessCheckBox({bool? values}) {
    iDontHaveBusiness = values!.obs;
    change(iDontHaveBusiness);
  }
}
