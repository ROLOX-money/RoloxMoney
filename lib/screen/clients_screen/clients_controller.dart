import 'dart:async';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:roloxmoney/model/project_model.dart';
import 'package:roloxmoney/screen/clients_screen/add_client/add_client_screen.dart';

/*Chinnadurai Viswanathan*/
class ClientsController extends GetxController with StateMixin {
  RxList projectInvoicesList = [].obs;

  @override
  void onInit() async {
    change(null, status: RxStatus.success());
    Future.delayed(const Duration(seconds: 5), () {});
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
    super.onInit();
  }

  void navigateAddClientScreen() {
    Get.offNamed(AddClientScreen.routeName);
  }
}
