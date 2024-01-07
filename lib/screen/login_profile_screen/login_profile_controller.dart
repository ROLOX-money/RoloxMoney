import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/screen/business_profile_screen/business_profile_screen.dart';
import 'package:roloxmoney/screen/dashboard_screen/dashboard_screen.dart';
import 'package:roloxmoney/screen/individual_profile_screen/individual_profile_screen.dart';

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
    panNumberController.text = 'BRYPC4090B';
    gstNumberController.text = '12344566';
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
    SupaBaseController.toGetTheSelectedID(
            searchValue: emailIDController.text.trim(),
            tableName: RoloxKey.supaBaseUserTable,
            whatTypeOfValueYouWant: 'id',
            searchKey: 'email')
        .then((value) {
      if (value.isEmpty) {
        if (typOfBusiness.obs.value.value == TypOfBusiness.individual) {
          var login = {
            "name": firstNameController.text.trim(),
            "profileType": 1,
            "emailAddress": emailIDController.text.trim(),
            'socialId': socialId.text,
          };
          change(null, status: RxStatus.success());
          Get.toNamed(IndividualProfileScreen.routeName, arguments: login);
        } else {
          SupaBaseController.toSearchPANAvailability(
                  panNumber: panNumberController.text)
              .then((panAvailabilityResponse) {
            if (panAvailabilityResponse) {
              AppUtils.showErrorSnackBar(Get.context!,
                  'PAN Mapped with another profile..Please consider your PAN',
                  durations: 2000);
              change(null, status: RxStatus.success());
            } else {
              SupaBaseController.toGetTheSelectedID(
                      searchValue: gstNumberController.text,
                      tableName: RoloxKey.supaBaseGSTTable,
                      whatTypeOfValueYouWant: 'id',
                      searchKey: 'gstNumber')
                  .then((responseList) {
                if (responseList.isEmpty) {
                  var login = {
                    "name": companyNameController.text.trim(),
                    "profileType": 2,
                    "contactEmail": emailIDController.text.trim(),
                    "panNumber": panNumberController.text,
                    "emailAddress": emailIDController.text.trim(),
                    "gstNumber": gstNumberController.text,
                    'socialId': socialId.text,
                  };
                  change(null, status: RxStatus.success());
                  Get.toNamed(BusinessProfileScreen.routeName,
                      arguments: login);
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
      } else {
        change(null, status: RxStatus.success());
        AppUtils.showErrorSnackBar(Get.context!,
            'Email already exist..Please consider your your email',
            durations: 3000);
      }
    });
  }
}
