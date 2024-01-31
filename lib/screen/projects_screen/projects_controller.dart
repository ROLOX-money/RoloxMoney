import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/model/project_model.dart';
import 'package:roloxmoney/screen/projects_screen/add_project/add_project_controller.dart';
import 'package:roloxmoney/screen/projects_screen/add_project/add_project_screen.dart';
import 'package:roloxmoney/singleton.dart';
import 'package:roloxmoney/utils/RoloxKey.dart';
import 'package:roloxmoney/utils/app_utils.dart';

/*Chinnadurai Viswanathan*/
class ProjectsController extends GetxController with StateMixin {
  RxList<ProjectModel> projectInvoicesList = <ProjectModel>[].obs;

  // InvoiceController invoiceController = Get.put(InvoiceController());

  @override
  void onInit() async {
    change(null, status: RxStatus.success());
    print("projectInvoicesList before : ${projectInvoicesList.length}");
    await getProjectList().then((value) {
      // for (int i = 0; i < value.length; i++) {
      //   for (int j = 0;
      //       j < invoiceController.updatedProjectInvoicesList.length;
      //       j++) {
      //     if (value[i].id ==
      //         invoiceController.updatedProjectInvoicesList[j].id) {
      //       value[i] = invoiceController.updatedProjectInvoicesList[j];
      //     }
      //   }
      // }
      change(projectInvoicesList, status: RxStatus.success());
    });
    print("projectInvoicesList after : ${projectInvoicesList.length}");
    super.onInit();
  }

  Future<List<ProjectModel>> getProjectList() async {
    change(null, status: RxStatus.loading());
    try {
      //Todo to get the based on user mapping
      await Singleton.supabaseInstance.client
          .from(RoloxKey.supaBaseProjectDb)
          .select('*')
          // .eq('refrenceID',  Singleton.mobileUserId)
          .then((value) {
        if (value is List) {
          debugPrint('after geting project from project table--> $value');
          projectInvoicesList.value = [];
          value.forEach((element) {
            projectInvoicesList.add(ProjectModel(
                id: element['id'],
                amount: element['projectvalue'].toString(),
                projectName: element['projectName'],
                clientName: element['clientName'],
                date: element['dueDate'],
                noOfInvoice: element['noOfInvoice']));
          });
        } else {
          projectInvoicesList.value = [];
          AppUtils.showErrorSnackBar(Get.context!,
              'Something went wrong. Please try again after sometime',
              durations: 2000);
        }
        change(projectInvoicesList, status: RxStatus.success());
      });
      return projectInvoicesList;
    } catch (e) {
      e.printError();
      return [];
    }
  }

  void navigateAddProjectScreen({int? arguments}) {
    Get.toNamed(AddProjectScreen.routeName, arguments: arguments)!
        .then((value) {
      if (value) getProjectList();
    });
    Get.lazyPut(() => AddProjectController());
  }
}
