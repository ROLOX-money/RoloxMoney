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

class AddClientController extends GetxController with StateMixin {
  TextEditingController brandNameController = TextEditingController();
  TextEditingController gstNumberController = TextEditingController();
  TextEditingController legalNameController = TextEditingController();
  TextEditingController emailIDController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController fullAddressController = TextEditingController();
  TextEditingController panNoController = TextEditingController();
  TextEditingController contactPersonController = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  TextEditingController designationController = TextEditingController();

  Rx<TypOfBusiness> typOfBusiness = TypOfBusiness.business.obs;
  final form = GlobalKey<FormState>();

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
      fullAddressController.text = 'Rolox Money, No:123, Mumbai';
      panNoController.text = 'BRYPC4090C';
      departmentController.text = 'Software Development';
      designationController.text = 'Software Developer';
    }
  }

  void businessToggle({TypOfBusiness? value}) {
    typOfBusiness = value!.obs;
    change(typOfBusiness);
  }

  void createClient() {
    //First to check the GST/PAN (if company/client existing or not)
    SupaBaseController.toGetTheSelectedID(
            searchValue: gstNumberController.text,
            tableName: RoloxKey.supaBaseGSTTable,
            searchKey: 'gstNumber',
            whatTypeOfValueYouWant: 'refrenceid')
        .then((gstListValue) {
      if (gstListValue.length > 0) {
        SupaBaseController.toGetTheSelectedID(
                searchValue: panNoController.text,
                tableName: RoloxKey.supaBasePANTable,
                searchKey: 'Pannumber')
            .then((panCardListValue) {
          if (panCardListValue.length > 0) {
            if (typOfBusiness.obs.value == TypOfBusiness.business) {
              SupaBaseController.toInsert(
                  tableName: RoloxKey.supaBaseProfileCompanyTable,
                  userData: {
                    'dept': departmentController.text,
                    'designation': designationController.text,
                    'phone': Singleton
                        .supabaseInstance.client.auth.currentUser?.phone,
                    'companyRefrenceId': panCardListValue[0]['refrenceid']
                  }).then((insertResponse) {
                if (insertResponse) {
                  SupaBaseController.toInsert(
                      tableName: RoloxKey.supaBaseAddresstable,
                      userData: {
                        'address': fullAddressController.text,
                        'phone': mobileNumberController.text
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
                          SupaBaseController.toInsert(
                              tableName: RoloxKey.supaBaseUserToClientMap,
                              userData: {
                                'userId': userResponseList[0]['id'],
                                'clientId': panCardListValue[0]['refrenceid'],
                                'profileType': panCardListValue[0]
                                    ['profiletype']
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
                        }
                      });
                    }
                  });
                }
              });
            } else {
              AppUtils.showErrorSnackBar(
                  Get.context!, 'Todo Have to consider as freelancer',
                  durations: 5000);
              //Todo Have to consider as freelancer
            }
          } else {
            //Todo Have to insert in PAN table
            // Todo if freelancer mean -> have to take user Id to user PAN
            // Todo if company mean -> have to take company Id to user PAN

            AppUtils.showErrorSnackBar(
                Get.context!, 'Todo Have to insert in PAN table',
                durations: 5000);
          }
        });
      } else {
        //Todo Have to insert in GST table
        // Todo if freelancer mean -> have to take user Id to user GST
        // Todo if company mean -> have to take company Id to user GST
        AppUtils.showErrorSnackBar(
            Get.context!, 'Todo Have to insert in GST table',
            durations: 5000);
      }
    });
  }
}
