import 'dart:async';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:roloxmoney/model/project_model.dart';
import 'package:roloxmoney/screen/invoice_screen/add_invoice/add_invoice_controller.dart';
import 'package:roloxmoney/screen/invoice_screen/add_invoice/add_invoice_screen.dart';
import 'package:roloxmoney/screen/projects_screen/add_project/add_project_controller.dart';
import 'package:roloxmoney/screen/projects_screen/add_project/add_project_screen.dart';

/*Chinnadurai Viswanathan*/
class InvoiceController extends GetxController with StateMixin {
  RxList projectInvoicesList = [].obs;

  @override
  void onInit() async {
    change(null, status: RxStatus.success());
    Future.delayed(const Duration(seconds: 5), () {
      projectInvoicesList.addAll([
        ProjectModel(
            amount: '25000',
            projectName: 'Target InfoTech',
            date: DateFormat('dd MMM yyyy').format(DateTime.now()),
            noOfInvoice: 2),
        ProjectModel(
            amount: '25000',
            projectName: 'Target InfoTech',
            date: DateFormat('dd MMM yyyy').format(DateTime.now()),
            noOfInvoice: 2),
        ProjectModel(
            amount: '25000',
            projectName: 'Target InfoTech',
            date: DateFormat('dd MMM yyyy').format(DateTime.now()),
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
