import 'dart:async';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:roloxmoney/languages/app_languages.dart';
import 'package:roloxmoney/model/group_invoices_model.dart';
import 'package:roloxmoney/model/invoice_model.dart';
import 'package:roloxmoney/utils/color_resource.dart';

/*Chinnadurai Viswanathan*/
class HomeController extends GetxController with StateMixin {
  RxList groupInvoicesList = [].obs;

  @override
  void onInit() async {
    change(null, status: RxStatus.success());
    Future.delayed(const Duration(seconds: 5), () {});

    groupInvoicesList.addAll([
      GroupInvoices(
          boarderColor: ColorResource.color178674,
          groupName: Languages.of(Get.context!)!.upcomingInvoices,
          invoiceList: [
            InvoiceModel(
                amount: '25000',
                clientName: 'Target InfoTech',
                date: DateTime.now().toString(),
                workName: 'Brochure Design'),
            InvoiceModel(
                amount: '25000',
                clientName: 'Target InfoTech',
                date: DateFormat('yyyy MM dd').format(DateTime.now()),
                workName: 'Brochure Design'),
            InvoiceModel(
                amount: '25000',
                clientName: 'Target InfoTech',
                date: DateTime.now().toString(),
                workName: 'Brochure Design'),
            InvoiceModel(
                amount: '25000',
                clientName: 'Target InfoTech',
                date: DateTime.now().toString(),
                workName: 'Brochure Design'),
          ]),
      GroupInvoices(
          boarderColor: ColorResource.colorF27C6C,
          groupName: Languages.of(Get.context!)!.dueInvoices,
          invoiceList: [
            InvoiceModel(
                amount: '25000',
                clientName: 'Target InfoTech',
                date: DateTime.now().toString(),
                workName: 'Brochure Design'),
            InvoiceModel(
                amount: '25000',
                clientName: 'Target InfoTech',
                date: DateTime.now().toString(),
                workName: 'Brochure Design'),
            InvoiceModel(
                amount: '25000',
                clientName: 'Target InfoTech',
                date: DateTime.now().toString(),
                workName: 'Brochure Design'),
            InvoiceModel(
                amount: '25000',
                clientName: 'Target InfoTech',
                date: DateTime.now().toString(),
                workName: 'Brochure Design'),
          ]),
      GroupInvoices(
          boarderColor: ColorResource.color4A89D1,
          groupName: Languages.of(Get.context!)!.paidInvoices,
          invoiceList: [
            InvoiceModel(
                amount: '25000',
                clientName: 'Target InfoTech',
                date: DateTime.now().toString(),
                workName: 'Brochure Design'),
            InvoiceModel(
                amount: '25000',
                clientName: 'Target InfoTech',
                date: DateTime.now().toString(),
                workName: 'Brochure Design'),
            InvoiceModel(
                amount: '25000',
                clientName: 'Target InfoTech',
                date: DateTime.now().toString(),
                workName: 'Brochure Design'),
            InvoiceModel(
                amount: '25000',
                clientName: 'Target InfoTech',
                date: DateTime.now().toString(),
                workName: 'Brochure Design'),
          ]),
    ]);
    change(groupInvoicesList);
    super.onInit();
  }
}
