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
  ''')
          .eq('userid', Singleton.mobileUserId)
          .then((value) {
            value.forEach((element) {
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
