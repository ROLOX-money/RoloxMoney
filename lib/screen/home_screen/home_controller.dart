import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:roloxmoney/screen/dashboard_screen/entities/dashboard_model.dart';
import 'package:roloxmoney/singleton.dart';
import 'package:roloxmoney/utils/RoloxKey.dart';

/*Chinnadurai Viswanathan*/
class HomeController extends GetxController with StateMixin {
  RxList invoicesList = [].obs;
  RxDouble paidTransaction = 0.0.obs;
  RxDouble dueTransaction = 0.0.obs;
  RxDouble upComingTransaction = 0.0.obs;

  @override
  void onInit() async {
    change(null, status: RxStatus.success());
    toGetTheInvoiceList();
    super.onInit();
  }

  toGetTheInvoiceList() async {
    change(null, status: RxStatus.loading());
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
              invoicesList.add(
                DashBoardInvoice(
                    invoiceAmount: element['invoice']['invoiceValueWithoutGst'],
                    invoiceNumber: element['invoice']['invoiceNumber'],
                    invoiceName: element['invoice']['invoiceName'],
                    paid: element['invoice']['paid'],
                    dueDate: element['invoice']['InvoiceDueDate']),
              );
            });
          });

      invoicesList.obs.value.toList().forEach((element) {
        DashBoardInvoice dashBoardInvoice = element as DashBoardInvoice;

        if (dashBoardInvoice.paid!) {
          paidTransaction.value =
              paidTransaction.value + dashBoardInvoice.invoiceAmount!;
        } else {
          dueTransaction.value =
              dueTransaction.value + dashBoardInvoice.invoiceAmount!;
        }
        if (DateFormat("dd/MM/yyyy").parse(dashBoardInvoice.dueDate!).isBefore(
                  DateTime.now().add(
                    Duration(days: 7),
                  ),
                ) &&
            element.paid == false) {
          upComingTransaction.value =
              upComingTransaction.value + dashBoardInvoice.invoiceAmount!;
        } else {}
      });
      change(upComingTransaction);
      change(paidTransaction);
      change(dueTransaction);
      change(null, status: RxStatus.success());
    } catch (e) {
      e.printError();
      return [];
    }
  }
}
