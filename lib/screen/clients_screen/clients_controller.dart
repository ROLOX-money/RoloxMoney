import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:roloxmoney/model/cleint_list_model.dart';
import 'package:roloxmoney/model/project_model.dart';
import 'package:roloxmoney/screen/clients_screen/add_client/add_client_controller.dart';
import 'package:roloxmoney/screen/clients_screen/add_client/add_client_screen.dart';
import 'package:roloxmoney/utils/RoloxKey.dart';
import 'package:roloxmoney/utils/supa_base_control.dart';

/*Chinnadurai Viswanathan*/
class ClientsController extends GetxController with StateMixin {
  RxList clientList = [].obs;

  @override
  void onInit() async {
    change(null, status: RxStatus.loading());
    // Future.delayed(const Duration(seconds: 5), () {
    //   clientList.addAll([
    //     ProjectModel(
    //         amount: '25000',
    //         projectName: 'Target InfoTech',
    //         date: DateFormat('dd MMM yyyy').format(DateTime.now()),
    //         noOfInvoice: 2),
    //     ProjectModel(
    //         amount: '25000',
    //         projectName: 'Target InfoTech',
    //         date: DateFormat('dd MMM yyyy').format(DateTime.now()),
    //         noOfInvoice: 2),
    //     ProjectModel(
    //         amount: '25000',
    //         projectName: 'Target InfoTech',
    //         date: DateFormat('dd MMM yyyy').format(DateTime.now()),
    //         noOfInvoice: 2),
    //   ]);
    //
    // });
    // change(clientList);
    super.onInit();

    toGetTheClientList();
  }

  void navigateAddClientScreen() {
    Get.put(AddClientController());
    Get.toNamed(AddClientScreen.routeName)?.then((value) {
      toGetTheClientList();
    });
  }

  toGetTheClientList() {
    clientList.value = [];
    SupaBaseController.toGetTheClientList(
            pageCount: 1, tableName: RoloxKey.supaBaseClientTable)
        .then((clientListResponse) {
      if (clientListResponse.length > 0) {
        clientListResponse.forEach((element) {
          // debugPrint('tempValues--> ${element['companyName']}');
          clientList.add(ClientListModel(
              companyName: element['companyName'], typeOfbuisness: '1'));
        });
        change(clientList, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.empty());
      }
    });
  }
}
