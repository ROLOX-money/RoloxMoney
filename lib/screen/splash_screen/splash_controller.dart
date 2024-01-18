import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/screen/dashboard_screen/dashboard_screen.dart';
import 'package:roloxmoney/screen/login_profile_screen/login_profile_screen.dart';
import 'package:roloxmoney/screen/login_screen/login_screen.dart';
import 'package:roloxmoney/singleton.dart';
import 'package:roloxmoney/utils/RoloxKey.dart';
import 'package:roloxmoney/utils/supa_base_control.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
/*Chinnadurai Viswanathan*/

class SplashScreenController extends GetxController with StateMixin {
  @override
  void onInit() async {
    change(null, status: RxStatus.success());
    initializeSupaBase();
    super.onInit();
  }

  Future<void> initializeSupaBase() async {
    try {
      await Supabase.initialize(
        url: RoloxKey.supaBaseClientEnvUrl,
        anonKey: RoloxKey.supaBaseClientClientKey,
      ).then((initializeValue) {
        debugPrint(
            'Supabase initialize---> ${initializeValue.client.auth.currentUser?.phone}');
        Singleton.supabaseInstance = initializeValue;
        if (initializeValue.client.auth.currentSession != null &&
            initializeValue.client.auth.currentUser != null) {
          SupaBaseController.toGetTheSelectedUser(
                  mobileNumber: initializeValue.client.auth.currentUser?.phone)
              .then((value) {
            if (value is List && value.length == 0) {
              Get.offAndToNamed(LoginProfileScreen.routeName,
                  arguments: initializeValue.client.auth.currentUser?.phone);
            } else {
              Singleton.mobileUserId = value[0]['id'];
              Get.offAndToNamed(DashboardScreen.routeName);
              // Get.offAndToNamed(LoginProfileScreen.routeName,
              //     arguments: initializeValue.client.auth.currentUser?.phone);
            }
          });
        } else {
          Get.offAndToNamed(LoginScreen.routeName);
        }
      });
    } catch (e) {
      debugPrint('exception--> $e');
      // initializeSupaBase();
    }
  }
}
