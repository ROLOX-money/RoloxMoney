import 'dart:async';
import 'package:get/get.dart';
import 'package:roloxmoney/model/project_model.dart';
import 'package:roloxmoney/screen/invoice_screen/add_invoice/add_invoice_controller.dart';
import 'package:roloxmoney/screen/invoice_screen/add_invoice/add_invoice_screen.dart';

/*Chinnadurai Viswanathan*/
class InvoiceController extends GetxController with StateMixin {
  RxList<ProjectModel> projectInvoicesList = <ProjectModel>[].obs;

  @override
  void onInit() async {
    change(null, status: RxStatus.success());
    Future.delayed(const Duration(seconds: 5), () {
      projectInvoicesList.addAll([
        ProjectModel(
            clientName: 'Target InfoTech',
            amount: '25000',
            projectName: 'Target InfoTech',
            date: DateTime.now().toString(),
            noOfInvoice: 2),
        ProjectModel(
            amount: '25000',
            clientName: 'Target InfoTech',
            projectName: 'Target InfoTech',
            date: DateTime.now().toString(),
            noOfInvoice: 2),
        ProjectModel(
            amount: '25000',
            clientName: 'Target InfoTech',
            projectName: 'Target InfoTech',
            date: DateTime.now().toString(),
            noOfInvoice: 2),
      ]);
      change(projectInvoicesList);
    });

    super.onInit();
  }

  void navigateAddInvoiceScreen() {
    Get.put(AddInvoiceController());
    Get.toNamed(AddInvoiceScreen.routeName);
  }
}
