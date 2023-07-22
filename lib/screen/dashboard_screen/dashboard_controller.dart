import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/model/dashboard_navigator_model.dart';
import 'package:roloxmoney/screen/clients_screen/clients_controller.dart';
import 'package:roloxmoney/screen/home_screen/home_controller.dart';
import 'package:roloxmoney/screen/invoice_screen/entities/invoice_model.dart';
import 'package:roloxmoney/screen/invoice_screen/invoice_controller.dart';
import 'package:roloxmoney/screen/payment_screen/payment_controller.dart';
import 'package:roloxmoney/screen/projects_screen/projects_controller.dart';
import 'package:roloxmoney/singleton.dart';
import 'package:roloxmoney/utils/RoloxKey.dart';
import 'package:roloxmoney/utils/image_resource.dart';
import 'package:roloxmoney/utils/supa_base_control.dart';

/*Chinnadurai Viswanathan*/
class DashboardController extends GetxController with StateMixin {
  Rx<PageController> pageController = PageController().obs;

  RxList<DashboardNavigatorModel>? dashboardNavigatorModelList = [
    DashboardNavigatorModel(icon: ImageResource.home, name: 'Home', index: 0),
    DashboardNavigatorModel(
        icon: ImageResource.client, name: 'Clients', index: 1),
    DashboardNavigatorModel(
        icon: ImageResource.projects, name: 'Projects', index: 2),
    DashboardNavigatorModel(
        icon: ImageResource.invoice, name: 'Invoices', index: 3),
    DashboardNavigatorModel(
        icon: ImageResource.wallet, name: 'Payments', index: 4),
  ].obs;

  RxString selectedBottomButton = 'empty'.obs;

  @override
  void onInit() async {
    SupaBaseController.toGetTheSelectedUser(
            mobileNumber: Singleton
                    .supabaseInstance.client.auth.currentUser!.phone
                    .toString()
                    .contains('+')
                ? Singleton.supabaseInstance.client.auth.currentUser!.phone
                    .toString()
                : '+${Singleton.supabaseInstance.client.auth.currentUser!.phone.toString()}')
        .then((value) {
      if (value is List && value.length > 0) {
        // [{id: f3dc1e06-b065-467a-a6ed-c47224768dd5}]
        Singleton.mobileUserId = value[0]['id'];
        change(null, status: RxStatus.success());
      }
    });
    super.onInit();
  }

  void bottomNavigation({required String selectedBottom}) {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => ProjectsController());
    Get.lazyPut(() => ClientsController());
    Get.lazyPut(() => InvoiceController());
    Get.lazyPut(() => PaymentController());
    selectedBottomButton = selectedBottom.obs;
    dashboardNavigatorModelList!.forEach((element) {});
    change(selectedBottomButton);
  }
}
