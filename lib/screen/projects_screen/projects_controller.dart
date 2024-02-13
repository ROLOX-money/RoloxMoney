import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/model/project_model.dart';
import 'package:roloxmoney/screen/projects_screen/add_project/add_project_controller.dart';
import 'package:roloxmoney/screen/projects_screen/add_project/add_project_screen.dart';
import 'package:roloxmoney/singleton.dart';
import 'package:roloxmoney/utils/RoloxKey.dart';
import 'package:roloxmoney/utils/app_utils.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/*Chinnadurai Viswanathan*/
class ProjectsController extends GetxController with StateMixin {
  RxList<ProjectModel> projectInvoicesList = <ProjectModel>[].obs;
  RxList<ProjectModel> updatedProjectList = <ProjectModel>[].obs;
  final Map<int, int> invoiceCounts = {};

  RxInt listValueStart = 0.obs;
  RxInt listValueEnd = 0.obs;
  RxBool isEnabled = false.obs;

  // InvoiceController invoiceController = Get.put(InvoiceController());

  @override
  void onInit() async {
    change(null, status: RxStatus.success());
    print("projectInvoicesList before : ${projectInvoicesList.length}");
    // await getProjectList();

    await fetchProjectsWithInvoices();

    if (projectInvoicesList.isNotEmpty) {
      if (projectInvoicesList.length <= 20) {
        listValueStart.value = 1;
        listValueEnd.value = projectInvoicesList.length + 1;
        isEnabled.value = false;
      } else if (projectInvoicesList.length > 20) {
        listValueStart.value = 21;
        listValueEnd.value = projectInvoicesList.length + 1;
        isEnabled.value = true;
      }
    } else {
      listValueStart.value = 0;
      listValueEnd.value = 0;
    }
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
                projectvalue: int.tryParse(element['projectvalue'].toString()),
                projectName: element['projectName'],
                clientName: element['clientName'],
                dueDate: element['dueDate'],
                noOfInvoice: element['noOfInvoice'] != null
                    ? element['noOfInvoice']
                    : 0));
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

  Future<List<ProjectModel>> fetchProjectsWithInvoices() async {
    change(null, status: RxStatus.loading());
    try {
      await Singleton.supabaseInstance.client
          .from('project_invoice_summary_with_invoice_count')
          .select()
          // .eq("refrenceID", Singleton.mobileUserId)
          .execute()
          .then((response) {
        print('Projects with invoices: ${response.data}');
        if (response.data is List) {
          projectInvoicesList.value = [];
          response.data.forEach((element) {
            projectInvoicesList.add(ProjectModel(
                id: element['id'],
                projectvalue: int.tryParse(element['projectvalue'].toString()),
                projectName: element['projectName'],
                clientName: element['clientName'],
                dueDate: element['dueDate'],
                noOfInvoice: element['invoice_count']));
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

  Future<void> fetchProjectsWithInvoicesByUsers() async {
    await Singleton.supabaseInstance.client
        .from('project_invoice_summary_with_invoice_count')
        .select()
        .eq("refrenceID", Singleton.mobileUserId)
        .execute()
        .then((response) {
      print('Projects with invoices: ${response.data}');
    });
  }

  // Future<void> fetchProjectInvoiceSummary() async {
  //   final client = Supabase.instance.client;
  //   final response = await client
  //       // .from('project_invoice_summary_with_invoice_count')
  //       .from('Project and Invoice Summary')
  //       .select()
  //       .execute();
  //   if (response.data != null) {
  //     print('Error fetching project invoice summary: ${response.data.message}');
  //   } else {
  //     print('Project invoice summary: ${response.data}');
  //   }
  // }

  void navigateAddProjectScreen({int? arguments}) {
    Get.toNamed(AddProjectScreen.routeName, arguments: arguments)!
        .then((value) {
      if (value) getProjectList();
    });
    Get.lazyPut(() => AddProjectController());
  }
}
