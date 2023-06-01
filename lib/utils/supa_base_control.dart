import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:roloxmoney/singleton.dart';
import 'package:roloxmoney/utils/RoloxKey.dart';
import 'package:roloxmoney/utils/app_utils.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupaBaseController {
  static Future<bool> sendSignInCode({required mobileNumber}) async {
    try {
      await Singleton.supabaseInstance.client.auth
          .signInWithOtp(phone: mobileNumber);
      return true;
    } catch (e) {
      try {
        AuthException authException = e as AuthException;
        AppUtils.showErrorSnackBar(Get.context!, authException.message,
            durations: 5000);
      } catch (e) {
        AppUtils.showErrorSnackBar(Get.context!,
            'Something went wrong. Please try again after sometime',
            durations: 2000);
      }
      return false;
    }
  }

  static Future<bool> verifyThroughOTP(
      {required mobileNumber,
      required otpNumber,
      BuildContext? context}) async {
    try {
      return await Singleton.supabaseInstance.client.auth
          .verifyOTP(
        type: OtpType.sms,
        token: otpNumber,
        phone: '+91$mobileNumber',
      )
          .then((value) {
        return true;
      });
    } catch (e) {
      if (e is AuthException) {
        AppUtils.showErrorSnackBar(context!, e.message, durations: 5000);
      } else {
        AppUtils.showErrorSnackBar(
            context!, 'Something went wrong. Please try again after sometime',
            durations: 2000);
      }
      return false;
    }
  }

  static Future<dynamic> toGetTheSelectedUser({required mobileNumber}) async {
    try {
      return await Singleton.supabaseInstance.client
          .from(RoloxKey.supaBaseUserTable)
          .select('id')
          .eq(
              'phone',
              Singleton.supabaseInstance.client.auth.currentUser!.phone!
                      .contains('+')
                  ? Singleton.supabaseInstance.client.auth.currentUser?.phone
                  : '+${Singleton.supabaseInstance.client.auth.currentUser?.phone}')
          .then((value) {
        return value;
      });
    } catch (e) {
      AppUtils.showErrorSnackBar(
          Get.context!, 'Something went wrong. Please try again after sometime',
          durations: 2000);
      return e;
    }
  }

  static Future<dynamic> toGetTheSelectedCompany({required companyName}) async {
    try {
      return await Singleton.supabaseInstance.client
          .from(RoloxKey.supaBaseCompanyTable)
          .select('id')
          .eq('companyName', companyName)
          .then((companyResponse) {
        return companyResponse;
      });
    } catch (e) {
      AppUtils.showErrorSnackBar(
          Get.context!, 'Something went wrong. Please try again after sometime',
          durations: 2000);
      return e;
    }
  }

  static Future<bool> toInsert({required userData, required tableName}) async {
    debugPrint('toInsert data--> $userData');
    debugPrint('toInsert tableName--> $tableName');
    try {
      return await Singleton.supabaseInstance.client
          .from(tableName)
          .insert(userData)
          .then((value) {
        debugPrint('toInsert response--> $value');
        return true;
      });
    } catch (e) {
      debugPrint('exception--> $e');
      if (e is PostgrestException) {
        AppUtils.showErrorSnackBar(Get.context!, e.message, durations: 5000);
      } else {
        AppUtils.showErrorSnackBar(Get.context!,
            'Something went wrong. Please try again after sometime',
            durations: 5000);
      }

      return false;
    }
  }

  //Common search
  static Future<List> toGetTheSelectedID(
      {String? whatTypeOfValueYouWant,
      required searchKey,
      required searchValue,
      required tableName}) async {
    try {
      return await Singleton.supabaseInstance.client
          .from(tableName)
          .select(whatTypeOfValueYouWant ?? '*')
          .eq(searchKey, searchValue)
          .then((listOfResponse) {
        if (listOfResponse is List) {
          return listOfResponse;
        } else {
          return [];
        }
      });
    } catch (e) {
      AppUtils.showErrorSnackBar(
          Get.context!, 'Something went wrong. Please try again after sometime',
          durations: 2000);
      return [];
    }
  }

  static Future<bool> toSearchPANAvailability({required panNumber}) async {
    try {
      return await Singleton.supabaseInstance.client
          .from(RoloxKey.supaBasePANTable)
          .select('Pannumber')
          .eq('Pannumber', panNumber)
          .then((panAvailabilityResponse) {
        if (panAvailabilityResponse is List) {
          if (panAvailabilityResponse.length > 0) {
            return true;
          } else {
            return false;
          }
        } else {
          return false;
        }
      });
    } catch (e) {
      AppUtils.showErrorSnackBar(
          Get.context!, 'Something went wrong. Please try again after sometime',
          durations: 2000);
      return false;
    }
  }

  static Future<List> toGetTheClientList(
      {required pageCount, required tableName}) async {
    try {
      return await Singleton.supabaseInstance.client
          .from(tableName)
          .select('*')
          .limit(pageCount)
          .then((clientListResponse) {
        debugPrint('clientListResponse--> $clientListResponse');
        return clientListResponse is List ? clientListResponse : [];
      });
    } catch (e) {
      AppUtils.showErrorSnackBar(
          Get.context!, 'Something went wrong. Please try again after sometime',
          durations: 2000);
      return [];
    }
  }
}
