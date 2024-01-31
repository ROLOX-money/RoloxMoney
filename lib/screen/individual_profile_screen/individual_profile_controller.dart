import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/screen/dashboard_screen/dashboard_screen.dart';
import 'package:roloxmoney/screen/login_screen/login_controller.dart';
import 'package:roloxmoney/singleton.dart';
import 'package:roloxmoney/utils/RoloxKey.dart';
import 'package:roloxmoney/utils/app_utils.dart';
import 'package:roloxmoney/utils/supa_base_control.dart';

/*Chinnadurai Viswanathan*/
class IndividualProfileController extends GetxController
    with StateMixin, SupaBaseController {
  TextEditingController otherNatureController = TextEditingController();
  TextEditingController otherIndustryOfWorkController = TextEditingController();
  TextEditingController panNumberController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController gstController = TextEditingController();
  TextEditingController plsIfSpecifyController = TextEditingController();
  TextEditingController plsIfSpecifyControllerForNatureOfWork =
      TextEditingController();
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

  final form = GlobalKey<FormState>();

  LoginController loginController = Get.put(LoginController());

  @override
  void onInit() async {
    change(null, status: RxStatus.success());
    Future.delayed(const Duration(seconds: 5), () {});
    mobilNumberController.value = loginController.mobilNumberController.value;
    super.onInit();
  }

  void validatingProfile() {
    if (currentStep.obs.value == 1) {
      if (natureOfBusinessValue.value.toLowerCase() == 'others' &&
          plsIfSpecifyController.text.trim() == '') {
        AppUtils.showErrorSnackBar(Get.context!,
            'Nature of business is empty... Please consider your nature of business',
            durations: 3000);
      } else if (natureOfWorkValue.value.toLowerCase() == 'others' &&
          plsIfSpecifyControllerForNatureOfWork.text.trim() == '') {
        AppUtils.showErrorSnackBar(Get.context!,
            'Nature of work is empty... Please consider your nature of work',
            durations: 3000);
      } else if (!RegExp(r'^[0-9]{10}$')
          .hasMatch(mobilNumberController.text.trim())) {
        AppUtils.showErrorSnackBar(Get.context!,
            'Invalid mobile number... Please consider your mobile number',
            durations: 3000);
      } else {
        change(null, status: RxStatus.loading());
        SupaBaseController.toGetTheSelectedID(
                searchValue: '+91${mobilNumberController.text}',
                tableName: RoloxKey.supaBaseUserTable,
                whatTypeOfValueYouWant: 'id',
                searchKey: 'phone')
            .then((value) {
          if (value.isEmpty) {
            currentStep = currentStep.obs.value == 1 ? 2.obs : 1.obs;
            change(currentStep);
            change(null, status: RxStatus.success());
          } else {
            AppUtils.showErrorSnackBar(Get.context!,
                '+91${mobilNumberController.text}... Already exist',
                durations: 3000);
          }
        });
        change(null, status: RxStatus.success());
      }
    } else if (currentStep.obs.value == 2) {
      if (panNumberController.text.trim() == '') {
        AppUtils.showErrorSnackBar(
            Get.context!, 'PAN is empty... Please consider your PAN identity',
            durations: 3000);
      } else if (addressController.text.trim() == '') {
        AppUtils.showErrorSnackBar(Get.context!,
            'Address is empty... Please consider your postal address',
            durations: 3000);
      } else if (pincodeController.text.trim() == '') {
        AppUtils.showErrorSnackBar(Get.context!,
            'Pin code is empty... Please consider your postal identity',
            durations: 3000);
      } else if (iDontHaveBusiness.isTrue && gstController.text.trim() == '') {
        AppUtils.showErrorSnackBar(
            Get.context!, 'GST is empty... Please consider your GST identity',
            durations: 3000);
      } else {
        change(null, status: RxStatus.loading());
        SupaBaseController.toSearchPANAvailability(
                panNumber: panNumberController.text)
            .then((panAvailabilityResponse) {
          if (panAvailabilityResponse) {
            change(null, status: RxStatus.success());
            AppUtils.showErrorSnackBar(Get.context!,
                'PAN Mapped with another profile..Please consider your PAN',
                durations: 2000);
          } else {
            SupaBaseController.toGetTheSelectedID(
                    searchValue: gstController.text.trim(),
                    tableName: RoloxKey.supaBaseGSTTable,
                    whatTypeOfValueYouWant: 'id',
                    searchKey: 'gstNumber')
                .then((value) {
              if (value.isEmpty) {
                var loginValues = Get.arguments;
                toInsert(userData: {
                  'name': loginValues['name'],
                  'email': loginValues['emailAddress'],
                  'phoneVerfied': true,
                  'socialId': loginValues['socialId'],
                  'phone': Singleton
                          .supabaseInstance.client.auth.currentUser!.phone!
                          .contains('+')
                      ? Singleton
                          .supabaseInstance.client.auth.currentUser!.phone!
                      : '+${Singleton.supabaseInstance.client.auth.currentUser!.phone!}',
                  'profiletype': loginValues['profileType'],
                }, tableName: RoloxKey.supaBaseUserTable)
                    .then((value) {
                  SupaBaseController.toGetTheSelectedID(
                          searchValue: Singleton.supabaseInstance.client.auth
                                  .currentUser!.phone!
                                  .contains('+')
                              ? Singleton.supabaseInstance.client.auth
                                  .currentUser?.phone
                              : '+${Singleton.supabaseInstance.client.auth.currentUser?.phone}',
                          tableName: RoloxKey.supaBaseUserTable,
                          whatTypeOfValueYouWant: 'id',
                          searchKey: 'phone')
                      .then((userResponseList) {
                    Future.wait([
                      toInsert(userData: {
                        'phoneNo': Singleton.supabaseInstance.client.auth
                                .currentUser!.phone!
                                .contains('+')
                            ? Singleton
                                .supabaseInstance.client.auth.currentUser?.phone
                            : '+${Singleton.supabaseInstance.client.auth.currentUser?.phone}',
                        'refID': userResponseList[0]['id'],
                        'natureOfWork': natureOfWorkValue.value,
                        'natureOfBusiness': natureOfBusinessValue.value,
                        'modelOfWork': modelOfWorkValue.value,
                      }, tableName: RoloxKey.supaBaseFreelancerDB),
                      toInsert(userData: {
                        'Pannumber': panNumberController.text,
                        'profiletype': loginValues['profileType'],
                        'refrenceid': userResponseList[0]['id'],
                      }, tableName: RoloxKey.supaBasePANTable),
                      toInsert(userData: {
                        'gstNumber': gstController.text,
                        'profileType': loginValues['profileType'],
                        'refrenceid': userResponseList[0]['id'],
                      }, tableName: RoloxKey.supaBaseGSTTable),
                      toInsert(userData: {
                        'userType': loginValues['profileType'],
                        'referenceID': userResponseList[0]['id'],
                        'address': addressController.text,
                        'pinCode': pincodeController.text,
                        'phone': Singleton.supabaseInstance.client.auth
                                .currentUser!.phone!
                                .contains('+')
                            ? Singleton
                                .supabaseInstance.client.auth.currentUser?.phone
                            : '+${Singleton.supabaseInstance.client.auth.currentUser?.phone}'
                      }, tableName: RoloxKey.supaBaseAddressTable)
                    ]).then((value) {
                      if (!value.any((element) => false)) {
                        Get.offAllNamed(DashboardScreen.routeName);
                      } else {
                        AppUtils.showErrorSnackBar(Get.context!,
                            'Something went wrong..Please tray again',
                            durations: 2000);
                      }
                    });
                  });
                });
                change(null, status: RxStatus.success());
              } else {
                AppUtils.showErrorSnackBar(Get.context!,
                    'GST Mapped with another profile..Please consider your GST',
                    durations: 2000);
              }
            });
          }
        });
        change(null, status: RxStatus.success());
      }
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

  void updatedModelOfWorkValue(String value) {
    modelOfWorkValue = value.obs;
    change(modelOfWorkValue);
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

  void clearData() {
    otherIndustryOfWorkController.clear();
    otherNatureController.clear();
    panNumberController.clear();
    gstController.clear();
    addressController.clear();
    pincodeController.clear();
    plsIfSpecifyController.clear();
    plsIfSpecifyControllerForNatureOfWork.clear();
  }
}
