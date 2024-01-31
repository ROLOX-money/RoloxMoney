
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/model/project_model.dart';
import 'package:roloxmoney/screen/invoice_screen/add_invoice/add_invoice_controller.dart';
import 'package:roloxmoney/screen/invoice_screen/add_invoice/add_invoice_screen.dart';
import 'package:roloxmoney/screen/invoice_screen/entities/invoice_model.dart';
import 'package:roloxmoney/screen/projects_screen/projects_controller.dart';
import 'package:roloxmoney/singleton.dart';
import 'package:roloxmoney/utils/RoloxKey.dart';

/*Chinnadurai Viswanathan*/
class InvoiceController extends GetxController with StateMixin {
  RxList<Invoice> invoicesList = <Invoice>[].obs;
  RxList<String> projectName = <String>[].obs;
  ProjectsController projectsController = Get.put(ProjectsController());
  RxList<ProjectModel> updatedProjectInvoicesList = <ProjectModel>[].obs;
  RxInt listValueStart = 0.obs;
  RxInt listValueEnd = 0.obs;
  RxBool isEnabled = false.obs;

  @override
  void onInit() async {
    change(null, status: RxStatus.loading());
    await toGetTheInvoiceList().then((value) {
      List<int> projectId = <int>[];
      for (var i = 0; i < invoicesList.length; i++) {
        Invoice invoiceModel = invoicesList[i];
        projectId.add(int.parse(invoiceModel.projectName!));
      }

      for (var j = 0; j < projectId.length; j++) {
        for (var i = 0;
            i < Singleton.projectList.length;
            // projectsController.projectInvoicesList.length;
            i++) {
          // ProjectModel projectModel = projectsController.projectInvoicesList[i];
          ProjectModel projectModel = Singleton.projectList[i];
          if (projectId[j] == projectModel.id) {
            projectName.add(projectModel.projectName!);
            projectModel.noOfInvoice = projectModel.noOfInvoice != null
                ? (projectModel.noOfInvoice! + 1)
                : 1;
            print("no of invoice added");
            updatedProjectInvoicesList.add(projectModel);
            Singleton.updatedProjectList = updatedProjectInvoicesList;
            change(Singleton.projectList, status: RxStatus.success());
          }
        }
      }
      for (var k = 0; k < invoicesList.length; k++) {
        invoicesList[k].projectName = projectName[k];
      }

      change(invoicesList, status: RxStatus.success());
      change(Singleton.invoiceList, status: RxStatus.success());
      change(Singleton.updatedProjectList, status: RxStatus.success());
      change(updatedProjectInvoicesList, status: RxStatus.success());

      debugPrint(
          "after project name updated invoice list value --> ${invoicesList.toString()}");
    });
    if (invoicesList.isNotEmpty) {
      if (invoicesList.length <= 20) {
        listValueStart.value = 1;
        listValueEnd.value = invoicesList.length + 1;
        isEnabled.value = false;
      } else if (invoicesList.length > 20) {
        listValueStart.value = 21;
        listValueEnd.value = invoicesList.length + 1;
        isEnabled.value = true;
      }
    } else {
      listValueStart.value = 0;
      listValueEnd.value = 0;
    }

    super.onInit();
  }

  Future<List<Invoice>> toGetTheInvoiceList() async {
    change(null, status: RxStatus.loading());
    invoicesList.clear();
    try {
      await Singleton.supabaseInstance.client
          .from(RoloxKey.supaBaseUserToInvoiceTable)
          .select('''
    userid,
    ${RoloxKey.supaBaseInvoiceTable}!inner (
      *
    )
  ''')
          .eq('userid', Singleton.mobileUserId)
          .then((value) {
            value.forEach((element) {
              invoicesList.add(Invoice(
                  invoiceValueWithoutGst: double.parse(
                      element['invoice']['invoiceValueWithoutGst'].toString()),
                  invoiceNumber: element['invoice']['invoiceNumber'],
                  invoiceName: element['invoice']['invoiceName'],
                  createdAt: element['invoice']['created_at'],
                  projectName: element['invoice']['projectId'].toString(),
                  hsnCode: int.parse(element['invoice']['hsnCode'].toString()),
                  gstCharges: int.parse(element['invoice']['gstCharges'].toString()),
                  invoiceDueDate: element['invoice']['InvoiceDueDate']));
            });
            debugPrint('invoiceListResponse--> $value');
          });
      Singleton.invoiceList = invoicesList;
      change(invoicesList, status: RxStatus.success());
      change(Singleton.invoiceList, status: RxStatus.success());
      return invoicesList;
    } catch (e) {
      e.printError();
      return [];
    }
  }

  void navigateAddInvoiceScreen({int? arguments}) {
    // Get.LazyPut(AddInvoiceController());
    Get.toNamed(AddInvoiceScreen.routeName, arguments: arguments)!
        .then((value) {
      if (value) toGetTheInvoiceList();
    });
    Get.lazyPut(() => AddInvoiceController());
  }
}
