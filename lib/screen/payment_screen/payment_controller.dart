import 'dart:async';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:roloxmoney/model/project_model.dart';

/*Chinnadurai Viswanathan*/
class PaymentController extends GetxController with StateMixin {
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
          isCredit: true,
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
}
