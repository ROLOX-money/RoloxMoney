import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/screen/dashboard_screen/dashboard_screen.dart';

import 'package:roloxmoney/utils/RoloxKey.dart';
import 'package:roloxmoney/utils/app_utils.dart';
import 'package:roloxmoney/utils/supa_base_control.dart';


/*Chinnadurai Viswanathan*/
enum TypOfBusiness { individual, business, agency }

class LoginProfileController extends GetxController
    with StateMixin, SupaBaseController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController emailIDController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController panNumberController = TextEditingController();
  TextEditingController gstNumberController = TextEditingController();
  TextEditingController aadhaarNumberController = TextEditingController();

  TextEditingController contactPersonNameController = TextEditingController();
  TextEditingController address1 = TextEditingController();
  TextEditingController address2 = TextEditingController();
  TextEditingController pinCode = TextEditingController();

  TextEditingController socialId = TextEditingController();
  Rx<TypOfBusiness> typOfBusiness = TypOfBusiness.business.obs;

  final form = GlobalKey<FormState>();

  @override
  void onInit() async {
    firstNameController.text = 'Chinnadurai';
    emailIDController.text = 'chinnadurai@gmail.com';
    companyNameController.text = 'Rolox Money Agency';
    panNumberController.text = 'BRYPC4090C';
    gstNumberController.text = '123445667687';
    contactPersonNameController.text = 'Viswanathan';
    socialId.text = 'Agencies Link';
    address1.text = 'No:2/41, North Street';
    address2.text = 'S.Ohaiyur, Kallakurichi';
    pinCode.text = '606204';
    change(null, status: RxStatus.success());
    Future.delayed(const Duration(seconds: 5), () {});
    super.onInit();
  }

  void businessToggle({TypOfBusiness? value}) {
    typOfBusiness = value!.obs;
    change(typOfBusiness);
  }

  Future<void> singUpNewUser() async {
    change(null, status: RxStatus.loading());
    if (typOfBusiness.obs.value.value == TypOfBusiness.individual) {
      insertUser();
    } else {
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
                  searchValue: gstNumberController.text,
                  tableName: RoloxKey.supaBaseGSTTable,
                  whatTypeOfValueYouWant: 'id',
                  searchKey: 'gstNumber')
              .then((responseList) {
            if (responseList.isEmpty) {
              insertUser();
            } else {
              change(null, status: RxStatus.success());
              AppUtils.showErrorSnackBar(Get.context!,
                  'GST Mapped with another profile..Please consider your GST',
                  durations: 2000);
            }
          });
        }
      });
    }
  }

  insertUser() {
    toInsert(userData: {
      'name': typOfBusiness.obs.value.value == TypOfBusiness.business
          ? contactPersonNameController.text
          : firstNameController.text,
      'email': emailIDController.text,
      'phoneVerfied': true,
      'socialId': socialId.text,
      'phone': Get.arguments.toString().contains('+')
          ? Get.arguments.toString()
          : '+91${Get.arguments.toString()}',
      'profiletype': typOfBusiness.obs.value.value == TypOfBusiness.individual
          ? '1'
          : typOfBusiness.obs.value.value == TypOfBusiness.business
              ? '2'
              : '3',
    }, tableName: RoloxKey.supaBaseUserTable)
        .then((insertNewUserResponse) {
      if (insertNewUserResponse) {
        try {
          SupaBaseController.toGetTheSelectedUser(
                  mobileNumber: Get.arguments.toString().contains('+')
                      ? Get.arguments.toString()
                      : '+91${Get.arguments.toString()}')
              .then((selectedUserResponse) {
            if (selectedUserResponse is List) {
              if (selectedUserResponse.length > 0) {
                toInsertFCM(userID: selectedUserResponse[0]['id'])
                    .then((fcmTokenValue) {
                  if (fcmTokenValue) {
                    toInsert(userData: {
                      'userType':
                          typOfBusiness.value == TypOfBusiness.business ? 2 : 1,
                      'referenceID': selectedUserResponse[0]['id'],
                      'address_1': address1.text,
                      'address_2': address2.text,
                      'pinCode': pinCode.text,
                      'phone': Get.arguments.toString().contains('+')
                          ? Get.arguments.toString()
                          : '+${Get.arguments.toString()}'
                    }, tableName: RoloxKey.supaBaseAddressTable)
                        .then((value) {
                      if (typOfBusiness.value == TypOfBusiness.business) {
                        toInsert(userData: {
                          'companyName': companyNameController.text,
                          'userid': [selectedUserResponse[0]['id']],
                        }, tableName: RoloxKey.supaBaseCompanyTable)
                            .then((insertResponse) {
                          if (insertResponse) {
                            SupaBaseController.toGetTheSelectedCompany(
                                    companyName: companyNameController.text)
                                .then((selectedCompanyResponse) {
                              if (selectedCompanyResponse is List) {
                                if (selectedCompanyResponse.length > 0) {
                                  toInsert(userData: {
                                    'Pannumber': panNumberController.text,
                                    'profiletype':
                                        typOfBusiness.obs.value.value ==
                                                TypOfBusiness.business
                                            ? '2'
                                            : '3',
                                    'refrenceid': selectedCompanyResponse[0]
                                        ['id'],
                                  }, tableName: RoloxKey.supaBasePANTable)
                                      .then((panCardInsertResponse) {
                                    toInsert(userData: {
                                      'gstNumber': gstNumberController.text,
                                      'profileType':
                                          typOfBusiness.obs.value.value ==
                                                  TypOfBusiness.business
                                              ? '2'
                                              : '3',
                                      'refrenceid': selectedCompanyResponse[0]
                                          ['id'],
                                    }, tableName: RoloxKey.supaBaseGSTTable)
                                        .then((gstInsertResponse) {
                                      if (gstInsertResponse) {
                                        Get.offAllNamed(
                                            DashboardScreen.routeName);
                                      } else {
                                        change(null,
                                            status: RxStatus.success());
                                        AppUtils.showErrorSnackBar(Get.context!,
                                            'Something went wrong..Please Please try again latter',
                                            durations: 2000);
                                      }
                                    });
                                  });
                                } else {
                                  change(null, status: RxStatus.success());
                                  AppUtils.showErrorSnackBar(Get.context!,
                                      'Something went wrong..Please Please try again latter',
                                      durations: 2000);
                                }
                              } else {
                                change(null, status: RxStatus.success());
                                AppUtils.showErrorSnackBar(Get.context!,
                                    'Something went wrong..Please Please try again latter',
                                    durations: 2000);
                              }
                            });
                          } else {
                            change(null, status: RxStatus.success());
                          }
                        });
                      } else {
                        Get.offAllNamed(DashboardScreen.routeName);
                      }
                    });
                  } else {
                    change(null, status: RxStatus.success());
                  }
                });
              } else {
                change(null, status: RxStatus.success());
                AppUtils.showErrorSnackBar(Get.context!,
                    'Something went wrong. Please try again after sometime',
                    durations: 2000);
                change(null, status: RxStatus.success());
              }
            } else {
              change(null, status: RxStatus.success());
              AppUtils.showErrorSnackBar(Get.context!,
                  'Something went wrong. Please try again after sometime',
                  durations: 2000);
              change(null, status: RxStatus.success());
            }
          });
        } catch (e) {
          AppUtils.showErrorSnackBar(Get.context!,
              'Something went wrong. Please try again after sometime',
              durations: 2000);
          change(null, status: RxStatus.success());
        }
      } else {
        change(null, status: RxStatus.success());
      }
    });
  }
}
