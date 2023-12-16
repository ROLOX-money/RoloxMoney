import 'dart:async';
import 'package:get/get.dart';
import 'package:roloxmoney/model/project_model.dart';
import 'package:roloxmoney/screen/bank_list_screen/bank_list_controller.dart';
import 'package:roloxmoney/screen/payment_screen/add_bank_account/add_bank_account_controller.dart';
import 'package:roloxmoney/screen/payment_screen/add_bank_account/add_bank_account_screen.dart';

/*Chinnadurai Viswanathan*/
class PaymentController extends GetxController with StateMixin {
  RxList<ProjectModel> projectInvoicesList = <ProjectModel>[].obs;

  BankListController bankListController = Get.put(BankListController());

  @override
  void onInit() async {
    change(null, status: RxStatus.success());
    Future.delayed(const Duration(seconds: 5), () {
      projectInvoicesList.addAll([
        ProjectModel(
            amount: '25000',
            clientName: 'Target InfoTech',
            projectName: 'Target InfoTech',
            date: DateTime.now().toString(),
            isCredit: true,
            noOfInvoice: 2),
        ProjectModel(
            amount: '25000',
            clientName: 'Target InfoTech',
            projectName: 'Target InfoTech',
            date: DateTime.now().toString(),
            noOfInvoice: 2),
        ProjectModel(
            amount: '25000',
            projectName: 'Target InfoTech',
            clientName: 'Target InfoTech',
            date: DateTime.now().toString(),
            noOfInvoice: 2),
      ]);
      change(projectInvoicesList);
    });

    super.onInit();
  }

  void navigateAddPaymentScreen() {
    Get.put(AddBankAccountController());
    Get.toNamed(AddBankAccountScreen.routeName);
  }
}
