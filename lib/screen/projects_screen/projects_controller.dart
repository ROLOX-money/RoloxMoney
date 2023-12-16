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

  @override
  void onInit() async {
    change(null, status: RxStatus.success());
    getProjectList();
    super.onInit();
  }

  Future<void> getProjectList() async {
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
