import 'dart:async';
import 'package:get/get.dart';
import 'package:roloxmoney/model/bank_model.dart';
import 'package:roloxmoney/screen/payment_screen/add_bank_account/add_bank_account_controller.dart';
import 'package:roloxmoney/screen/payment_screen/add_bank_account/add_bank_account_screen.dart';

/*Chinnadurai Viswanathan*/
class BankListController extends GetxController with StateMixin {
  RxList bankList = [].obs;

  @override
  void onInit() async {
    change(null, status: RxStatus.success());
    Future.delayed(const Duration(seconds: 5), () {
      bankList.addAll([
        BankModel(
            bankName: 'Axis',
            accountNumber: '123456789012',
            holderName: 'Chinnadurai'),
        BankModel(
            bankName: 'SBI',
            isPrimary: true,
            accountNumber: '123456789012',
            holderName: 'James'),
        BankModel(
            bankName: 'Citi',
            accountNumber: '123456789012',
            holderName: 'Cameron'),
      ]);
      change(bankList);
    });
    super.onInit();
  }

  void changedThePrimaryAccount({required int selectedIndex}) {
    bankList.value.forEach((element) {
      element.isPrimary = false;
    });
    bankList.value[selectedIndex].isPrimary = true;
    change(bankList);
  }

  void navigateAddBankAccountScreen() {
    Get.put(AddBankAccountController());
    Get.toNamed(AddBankAccountScreen.routeName);
  }
}
