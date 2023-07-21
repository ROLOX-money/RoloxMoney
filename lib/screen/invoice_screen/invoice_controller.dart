import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/screen/invoice_screen/add_invoice/add_invoice_controller.dart';
import 'package:roloxmoney/screen/invoice_screen/add_invoice/add_invoice_screen.dart';
import 'package:roloxmoney/screen/invoice_screen/entities/invoice_model.dart';
import 'package:roloxmoney/singleton.dart';
import 'package:roloxmoney/utils/RoloxKey.dart';

/*Chinnadurai Viswanathan*/
class InvoiceController extends GetxController with StateMixin {
  RxList invoicesList = [].obs;

  @override
  void onInit() async {
    change(null, status: RxStatus.success());
    toGetTheInvoiceList();
    super.onInit();
  }

  toGetTheInvoiceList() async {
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
  ''').then((value) {
        value.forEach((element) {
          debugPrint('element--$element');
          /*     {userid: 206b8fc1-1c22-4f95-885d-3acbd964dc10,
          invoice: {id: 16, created_at: 2023-07-21T08:19:13.375768+00:00,
          invoiceName: Invoice for Photo work, invoiceNumber: 123456,
          invoiceValueWithoutGst: 1234.56, InvoiceDueDate: 21/07/2023,

          hsnCode: 123456, gstCharges: 0, projectId: 3, paid: false}}*/

          invoicesList.add(Invoice(
              invoiceAmount: element['invoice']['invoiceValueWithoutGst'],
              invoiceNumber: element['invoice']['invoiceNumber'],
              invoiceName: element['invoice']['invoiceName'],
              dueDate: element['invoice']['InvoiceDueDate']));
        });
      });
      change(invoicesList, status: RxStatus.success());
    } catch (e) {
      e.printError();
      return [];
    }
  }

  void navigateAddInvoiceScreen() {
    Get.put(AddInvoiceController());
    Get.toNamed(AddInvoiceScreen.routeName);
  }
}
