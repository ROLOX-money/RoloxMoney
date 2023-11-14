import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/singleton.dart';
import 'package:roloxmoney/utils/RoloxKey.dart';
import 'package:roloxmoney/utils/app_utils.dart';
import 'package:roloxmoney/utils/supa_base_control.dart';

/*Chinnadurai Viswanathan*/
enum TypOfBusiness { individual, business }

class AddClientController extends GetxController
    with StateMixin, SupaBaseController {
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
  TextEditingController fullAddress = TextEditingController();
  Rx<TypOfBusiness> typOfBusiness = TypOfBusiness.business.obs;
  RxBool iDontHaveBusiness = true.obs;
  final form = GlobalKey<FormState>();

  RxBool gstNumber = false.obs;
  @override
  void onInit() async {
    change(null, status: RxStatus.success());
    Future.delayed(const Duration(seconds: 5), () {});
    super.onInit();

    if (kDebugMode) {
      brandNameController.text = 'Rolox Money';
      gstNumberController.text = '123445667687';
      legalNameController.text = 'Rolox Money';
      emailIDController.text = 'chinnaduraiv@live.in';
      mobileNumberController.text = '+919585313659';
      contactPersonController.text = 'Chinnadurai Viswanathan';
      panNoController.text = 'BRYPC4090C';
      departmentController.text = 'Software Development';
      designationController.text = 'Software Developer';
      fullAddress.text = 'No:2/41, North Street,S.Ohaiyur, Kallakurichi,606204';
    }
  }

  void gstNumberCheckBox({bool? values}) {
    gstNumber = values!.obs;
    change(gstNumber);
  }
  void businessToggle({TypOfBusiness? value}) {
    typOfBusiness = value!.obs;
    change(typOfBusiness);
  }

  void noBusinessCheckBox({bool? values}) {
    iDontHaveBusiness = values!.obs;
    change(iDontHaveBusiness);
  }

  void createClient() {
    change(null, status: RxStatus.loading());
    SupaBaseController.toGetTheSelectedID(
      searchValue: gstNumberController.text,
      tableName: RoloxKey.supaBaseGSTTable,
      searchKey: 'gstNumber',
    ).then((gstListValue) {
      if (gstListValue.isEmpty) {
        SupaBaseController.toGetTheSelectedID(
                searchValue: panNoController.text,
                tableName: RoloxKey.supaBasePANTable,
                searchKey: 'Pannumber')
            .then((panCardListValue) {
          if (panCardListValue.isEmpty) {
            //Todo Have to check phone already exist or not
            toInsert(userData: {
              'companyName': brandNameController.text,
              'typeOfbuisness':
                  typOfBusiness.value == TypOfBusiness.business ? 2 : 1,
              'userid': [Singleton.mobileUserId],
            }, tableName: RoloxKey.supaBaseCompanyTable)
                .then((value) {
              SupaBaseController.toGetTheSelectedCompany(
                      companyName: brandNameController.text)
                  .then((companyDetails) {
                toInsert(
                    tableName: RoloxKey.supaBaseProfileCompanyTable,
                    userData: {
                      'dept': departmentController.text,
                      'designation': designationController.text,
                      'phone': mobileNumberController.text,
                      'companyRefrenceId': companyDetails[0]['id']
                    }).then((insertResponse) {
                  if (insertResponse) {
                    toInsert(
                        tableName: RoloxKey.supaBaseAddressTable,
                        userData: {
                          'phone': mobileNumberController.text,
                          'address_1': fullAddress.text,
                        }).then((addressInsertResponse) {
                      if (addressInsertResponse) {
                        SupaBaseController.toGetTheSelectedID(
                                searchValue: Singleton.supabaseInstance.client
                                        .auth.currentUser!.phone!
                                        .contains('+')
                                    ? Singleton.supabaseInstance.client.auth
                                        .currentUser?.phone
                                    : '+${Singleton.supabaseInstance.client.auth.currentUser?.phone}',
                                tableName: RoloxKey.supaBaseUserTable,
                                whatTypeOfValueYouWant: 'id',
                                searchKey: 'phone')
                            .then((userResponseList) {
                          if (userResponseList.isNotEmpty) {
                            //PAN Insert & GEST Insert
                            toInsert(
                                tableName: RoloxKey.supaBasePANTable,
                                userData: {
                                  'Pannumber': panNoController.text,
                                  'refrenceid': userResponseList[0]['id'],
                                  'profiletype': typOfBusiness.value ==
                                          TypOfBusiness.business
                                      ? 2
                                      : 1,
                                }).then((value) {
                              toInsert(
                                  tableName: RoloxKey.supaBaseGSTTable,
                                  userData: {
                                    'gstNumber': gstNumberController.text,
                                    'refrenceid': userResponseList[0]['id'],
                                    'profiletype': typOfBusiness.value ==
                                            TypOfBusiness.business
                                        ? 2
                                        : 1,
                                  }).then((value) {
                                SupaBaseController.toGetTheSelectedID(
                                        searchValue: brandNameController.text,
                                        tableName:
                                            RoloxKey.supaBaseCompanyTable,
                                        whatTypeOfValueYouWant: 'id',
                                        searchKey: 'gstNumber')
                                    .then((companyResponseList) {
                                  if (companyResponseList.isNotEmpty) {
                                    toInsert(
                                        tableName:
                                            RoloxKey.supaBaseUserToClientMap,
                                        userData: {
                                          'userid': userResponseList[0]['id'],
                                          'companyId': companyResponseList[0]
                                              ['id'], //Todo
                                          'profileType': typOfBusiness.value ==
                                                  TypOfBusiness.business
                                              ? 2
                                              : 1
                                        }).then((value) {
                                      if (value) {
                                        AppUtils.showSnackBar(Get.context!,
                                            'Successfully added client with your profile');
                                        Get.back(result: true);
                                      } else {
                                        AppUtils.showErrorSnackBar(Get.context!,
                                            'Something went wrong. Please try again after sometime',
                                            durations: 5000);
                                      }
                                    });
                                  } else {
                                    change(null, status: RxStatus.success());
                                    AppUtils.showErrorSnackBar(Get.context!,
                                        'We are facing problem with finding your GST... Please try again',
                                        durations: 10000);
                                  }
                                });
                              });
                            });
                          } else {
                            change(null, status: RxStatus.success());
                          }
                        });
                      } else {
                        change(null, status: RxStatus.success());
                      }
                    });
                  } else {
                    change(null, status: RxStatus.success());
                  }
                });
              });
            });
          } else {
            AppUtils.showErrorSnackBar(
                Get.context!, 'This PAN already mapped with another client',
                durations: 10000);
          }
        });
      } else {
        change(null, status: RxStatus.success());
        AppUtils.showErrorSnackBar(
            Get.context!, 'This GST already mapped with another client',
            durations: 10000);
      }
    });
  }
}
