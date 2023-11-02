import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/model/dashboard_navigator_model.dart';
import 'package:roloxmoney/screen/clients_screen/clients_controller.dart';
import 'package:roloxmoney/screen/clients_screen/clients_screen.dart';
import 'package:roloxmoney/screen/home_screen/home_controller.dart';
import 'package:roloxmoney/screen/home_screen/home_screen.dart';
import 'package:roloxmoney/screen/invoice_screen/invoice_controller.dart';
import 'package:roloxmoney/screen/invoice_screen/invoice_screen.dart';
import 'package:roloxmoney/screen/payment_screen/payment_controller.dart';
import 'package:roloxmoney/screen/payment_screen/payment_screen.dart';
import 'package:roloxmoney/screen/projects_screen/projects_controller.dart';
import 'package:roloxmoney/screen/projects_screen/projects_screen.dart';
import 'package:roloxmoney/utils/image_resource.dart';

enum CurrentPage { HomePage, ClientPage, ProjectPage, InvoicePage, PaymentPage }

/*Chinnadurai Viswanathan*/
class DashboardController extends GetxController with StateMixin {
  Rx<PageController> pageController = PageController().obs;

  RxList<DashboardNavigatorModel>? dashboardNavigatorModelList = [
    DashboardNavigatorModel(
      icon: ImageResource.home,
      name: 'Home',
      index: 0,
      icon1: ImageResource.homeBold,
    ),
    DashboardNavigatorModel(
      icon: ImageResource.client,
      name: 'Clients',
      index: 1,
      icon1: ImageResource.clientBold,
    ),
    DashboardNavigatorModel(
      icon: ImageResource.projects,
      name: 'Projects',
      index: 2,
      icon1: ImageResource.projectBold,
    ),
    DashboardNavigatorModel(
      icon: ImageResource.invoice,
      name: 'Invoices',
      index: 3,
      icon1: ImageResource.invoiceBold,
    ),
    DashboardNavigatorModel(
      icon: ImageResource.wallet,
      name: 'Payments',
      index: 4,
      icon1: ImageResource.walletBold,
    ),
  ].obs;

  RxString selectedBottomButton = 'empty'.obs;
  RxBool isDarkMode = true.obs;
  RxInt selectedIndex = 0.obs;
  CurrentPage currentPage = CurrentPage.HomePage;

  HomeController homeController = Get.put(HomeController());

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
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => ProjectsController());
    Get.lazyPut(() => ClientsController());
    Get.lazyPut(() => InvoiceController());
    Get.lazyPut(() => PaymentController());
    selectedBottomButton = selectedBottom.obs;
    dashboardNavigatorModelList!.forEach((element) {
      // element.index
      // pageController.obs.value.value.c
    });
    change(selectedBottomButton);
  }

  pageChange(BuildContext context, int index) {
    if (index == 0) {
      currentPage = CurrentPage.HomePage;
    } else if (index == 1) {
      currentPage = CurrentPage.ClientPage;
    } else if (index == 2) {
      currentPage = CurrentPage.ProjectPage;
    } else if (index == 3) {
      currentPage = CurrentPage.InvoicePage;
    } else if (index == 4) {
      currentPage = CurrentPage.PaymentPage;
    }

    switch (currentPage) {
      case CurrentPage.HomePage:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
        break;
      case CurrentPage.ClientPage:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ClientsScreen()));
        break;
      case CurrentPage.InvoicePage:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => InvoiceScreen()));
        break;
      case CurrentPage.ProjectPage:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProjectsScreen()));
        break;
      case CurrentPage.PaymentPage:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PaymentScreen()));
        break;
    }
  }
}
