import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:roloxmoney/model/project_model.dart';
import 'package:roloxmoney/screen/clients_screen/entites/clinet_model.dart';
import 'package:roloxmoney/screen/projects_screen/add_project/add_project_controller.dart';
import 'package:roloxmoney/screen/projects_screen/add_project/add_project_screen.dart';
import 'package:roloxmoney/singleton.dart';
import 'package:roloxmoney/utils/RoloxKey.dart';
import 'package:roloxmoney/utils/app_utils.dart';

/*Chinnadurai Viswanathan*/
class ProjectsController extends GetxController with StateMixin {
  RxList projectInvoicesList = [].obs;

  @override
  void onInit() async {
    change(null, status: RxStatus.loading());
    getProjectList();

    super.onInit();
  }

  Future<void> getProjectList() async {
    await Singleton.supabaseInstance.client
        .from(RoloxKey.supaBaseProjectDb)
        .select('*')
        .eq('refrenceID',  Singleton.supabaseInstance.client.auth.currentUser?.id)
        .then((value) {
      if (value is List) {
        projectInvoicesList.value = [];
        value.forEach((element) {
          projectInvoicesList.add(ProjectModel(
              amount: element['projectvalue'].toString(),
              projectName: element['projectName'],
              clientName: element['clientName'],
              date: element['dueDate'],
              noOfInvoice: 0));
        });
      } else {
        projectInvoicesList.value = [];
        AppUtils.showErrorSnackBar(Get.context!,
            'Something went wrong. Please try again after sometime',
            durations: 2000);
      }
      change(projectInvoicesList, status: RxStatus.success());
    });
  }

  void navigateAddProjectScreen() {
    Get.put(AddProjectController());
    Get.toNamed(AddProjectScreen.routeName)!.then((value) {
      if (value) getProjectList();
    });
  }
}
