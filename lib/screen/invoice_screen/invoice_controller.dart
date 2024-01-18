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

  @override
  void onInit() async {
    change(null, status: RxStatus.success());
    await toGetTheInvoiceList().then((value) {
      print(
          "before project name updated invoice list value --> ${invoicesList.toString()}");
      List<int> projectId = <int>[];

      for (var i = 0; i < invoicesList.length; i++) {
        Invoice invoiceModel = invoicesList[i];
        projectId.add(int.parse(invoiceModel.projectName!));
      }
      for (var j = 0; j < projectId.length; j++) {
        for (var i = 0;
            i < projectsController.projectInvoicesList.length;
            i++) {
          ProjectModel projectModel = projectsController.projectInvoicesList[i];
          if (projectId[j] == projectModel.id) {
            projectName.add(projectModel.projectName!);
          }
        }
      }

      for (var k = 0; k < invoicesList.length; k++) {
        invoicesList[k].projectName = projectName[k];
      }

      print(
          "after project name updated invoice list value --> ${invoicesList.toString()}");
    });
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
                  invoiceAmount: element['invoice']['invoiceValueWithoutGst'],
                  invoiceNumber: element['invoice']['invoiceNumber'],
                  invoiceName: element['invoice']['invoiceName'],
                  createdAt: element['invoice']['created_at'],
                  projectName: element['invoice']['projectId'].toString(),
                  dueDate: element['invoice']['InvoiceDueDate']));
            });
            debugPrint('invoiceListResponse--> $value');
          });
      change(invoicesList, status: RxStatus.success());
      return invoicesList;
    } catch (e) {
      e.printError();
      return [];
    }
  }

  void navigateAddInvoiceScreen() {
    Get.put(AddInvoiceController());
    Get.toNamed(AddInvoiceScreen.routeName)!.then((value) {
      if (value) toGetTheInvoiceList();
    });
  }
}
