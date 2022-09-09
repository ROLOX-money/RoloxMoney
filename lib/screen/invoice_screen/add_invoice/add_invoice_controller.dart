import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

/*Chinnadurai Viswanathan*/
class AddInvoiceController extends GetxController with StateMixin {
  TextEditingController invoiceNameController = TextEditingController();
  TextEditingController invoiceNumberController = TextEditingController();
  TextEditingController invoiceValueWithoutGSTController =
      TextEditingController();
  TextEditingController projectNameController = TextEditingController();
  TextEditingController invoiceDueDateController = TextEditingController();
  TextEditingController gstChargesController = TextEditingController();
  TextEditingController hsnController = TextEditingController();
  TextEditingController stateController = TextEditingController();

  @override
  void onInit() async {
    change(null, status: RxStatus.success());
    Future.delayed(const Duration(seconds: 5), () {});
    super.onInit();
  }
}
