import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/screen/dashboard_screen/dashboard_screen.dart';
import 'package:roloxmoney/screen/login_screen/login_screen.dart';
import 'package:roloxmoney/singleton.dart';
import 'package:roloxmoney/utils/RoloxKey.dart';
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
  TextEditingController contactPersonNameController = TextEditingController();

  TextEditingController socialId = TextEditingController();
  Rx<TypOfBusiness> typOfBusiness = TypOfBusiness.business.obs;

  final form = GlobalKey<FormState>();

  @override
  void onInit() async {
    firstNameController.text = 'Chinnadurai';
    emailIDController.text = 'chinnadurai@gmail.com';
    companyNameController.text = 'Rolox Money';
    panNumberController.text = 'BRYPC4090C';
    gstNumberController.text = '123445667687';
    contactPersonNameController.text = 'Viswanathan';
    socialId.text = 'socialId link';
    change(null, status: RxStatus.success());
    Future.delayed(const Duration(seconds: 5), () {});
    super.onInit();
  }

  void businessToggle({TypOfBusiness? value}) {
    typOfBusiness = value!.obs;
    change(typOfBusiness);
  }

  Future<void> singUpNewUser() async {
    toInsert(userData: {
      'name': typOfBusiness.obs.value.value == TypOfBusiness.business
          ? contactPersonNameController.text
          : firstNameController.text,
      'email': emailIDController.text,
      'phoneVerfied': Get.previousRoute == LoginScreen.routeName ? true : false,
      'socialId': socialId.text,
      'phone': Get.arguments.toString().contains('+')
          ? Get.arguments.toString()
          : '+${Get.arguments.toString()}',
      'profiletype': typOfBusiness.obs.value.value == TypOfBusiness.individual
          ? '1'
          : typOfBusiness.obs.value.value == TypOfBusiness.business
              ? '2'
              : '3',
    }, tableName: RoloxKey.supaBaseUserTable)
        .then((insertNewUserResponse) {
      if (insertNewUserResponse) {
        //if company(business) mean => have to add new company details
        if (typOfBusiness.obs.value.value == TypOfBusiness.business) {
          SupaBaseController.toSearchPANAvailability(
                  panNumber: panNumberController.text)
              .then((panAvailabilityResponse) async {
            if (panAvailabilityResponse) {
              //PAN card already add in table
              SupaBaseController.toGetTheSelectedUser(
                      mobileNumber: Get.arguments.toString().contains('+')
                          ? Get.arguments.toString()
                          : '+${Get.arguments.toString()}')
                  .then((selectedUserResponse) async {
                await Singleton.supabaseInstance.client
                    .from(RoloxKey.supaBaseCompanyTable)
                    .update({
                  'userid': [selectedUserResponse[0]['id']]
                }).then((value) {
                  debugPrint('toInsert response--> $value');
                  return true;
                });
              });
            } else {
              SupaBaseController.toGetTheSelectedUser(
                      mobileNumber: Get.arguments.toString().contains('+')
                          ? Get.arguments.toString()
                          : '+${Get.arguments.toString()}')
                  .then((selectedUserResponse) {
                if (selectedUserResponse is List) {
                  if (selectedUserResponse.length > 0) {
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
                              // to insert the PAN card after company creation
                              toInsert(userData: {
                                'Pannumber': panNumberController.text,
                                'profiletype': typOfBusiness.obs.value.value ==
                                        TypOfBusiness.individual
                                    ? '1'
                                    : typOfBusiness.obs.value.value ==
                                            TypOfBusiness.business
                                        ? '2'
                                        : '3',
                                'refrenceid': selectedCompanyResponse[0]['id'],
                              }, tableName: RoloxKey.supaBasePANTable)
                                  .then((panCardInsertResponse) {
                                toInsert(userData: {
                                  'gstNumber': gstNumberController.text,
                                  'profileType':
                                      typOfBusiness.obs.value.value ==
                                              TypOfBusiness.individual
                                          ? '1'
                                          : typOfBusiness.obs.value.value ==
                                                  TypOfBusiness.business
                                              ? '2'
                                              : '3',
                                  'refrenceid': selectedCompanyResponse[0]
                                      ['id'],
                                }, tableName: RoloxKey.supaBaseGSTTable)
                                    .then((gstInsertResponse) {
                                  if (gstInsertResponse) {
                                    Get.offAllNamed(DashboardScreen.routeName);
                                  }
                                });
                              });
                            }
                          }
                        });
                      }
                    });
                  }
                }
              });
            }
          });
        }
      }
    });
  }
}
