import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/screen/invoice_screen/add_invoice/add_invoice_controller.dart';
import 'package:roloxmoney/screen/invoice_screen/add_invoice/add_invoice_screen.dart';
import 'package:roloxmoney/screen/invoice_screen/entities/invoice_model.dart';
import 'package:roloxmoney/singleton.dart';
import 'package:roloxmoney/utils/RoloxKey.dart';

/*Chinnadurai Viswanathan*/
class PDFController extends GetxController with StateMixin {
  RxString url =
      'https://339rrq5qm1.execute-api.ap-south-1.amazonaws.com/download/invoices.vm.rstk.in/1/out.pdf'
          .obs;
  RxMap apiKey = {'x-api-key': 'WiToRbqXh44fTzRn0RhQe3qoLTPplOwA7GUywDA0'}.obs;

  @override
  void onInit() async {
    change(null, status: RxStatus.success());
    super.onInit();
  }
}
