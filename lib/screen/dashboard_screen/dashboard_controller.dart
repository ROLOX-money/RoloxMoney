import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/languages/app_languages.dart';
import 'package:roloxmoney/model/dashboard_navigator_model.dart';
import 'package:roloxmoney/screen/home_screen/home_screen.dart';
import 'package:roloxmoney/utils/image_resource.dart';

/*Chinnadurai Viswanathan*/
class DashboardController extends GetxController with StateMixin {
  RxList<DashboardNavigatorModel>? dashboardNavigatorModelList = [
    DashboardNavigatorModel(icon: ImageResource.home, name: 'Home'),
    DashboardNavigatorModel(icon: ImageResource.client, name: 'Clients'),
    DashboardNavigatorModel(icon: ImageResource.projects, name: 'Projects'),
    DashboardNavigatorModel(icon: ImageResource.invoice, name: 'Invoices'),
    DashboardNavigatorModel(icon: ImageResource.wallet, name: 'Payments'),
  ].obs;

  RxString selectedBottomButton = 'empty'.obs;



  @override
  void onInit() async {
    change(null, status: RxStatus.success());
    Future.delayed(const Duration(seconds: 5), () {
      selectedBottomButton = 'Home'.obs;
      change(selectedBottomButton);
    });
    super.onInit();
  }

  void bottomNavigation({required String selectedBottom}) {
    selectedBottomButton = selectedBottom.obs;
    change(selectedBottomButton);
  }
}
