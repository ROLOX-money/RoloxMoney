import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

/*Chinnadurai Viswanathan*/
class AddBankAccountController extends GetxController with StateMixin {
  TextEditingController bankAccountNumberController = TextEditingController();
  TextEditingController accountHolderNameController = TextEditingController();
  TextEditingController bankIFSCCodeController =
      TextEditingController();
  TextEditingController branchNameController = TextEditingController();
  TextEditingController cityNameController = TextEditingController();
  TextEditingController gstChargesController = TextEditingController();
  TextEditingController hsnController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  final form = GlobalKey<FormState>();

  @override
  void onInit() async {
    change(null, status: RxStatus.success());
    Future.delayed(const Duration(seconds: 5), () {});
    super.onInit();
  }
}
