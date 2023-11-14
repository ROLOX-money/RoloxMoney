import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:roloxmoney/screen/invoice_screen/entities/project_model.dart';
import 'package:roloxmoney/singleton.dart';
import 'package:roloxmoney/utils/RoloxKey.dart';
import 'package:roloxmoney/utils/app_utils.dart';
import 'package:roloxmoney/utils/picker.dart';
import 'package:roloxmoney/utils/supa_base_control.dart';

/*Chinnadurai Viswanathan*/
class AddInvoiceController extends GetxController
    with StateMixin, SupaBaseController {
  TextEditingController invoiceNameController = TextEditingController();
  TextEditingController invoiceNumberController = TextEditingController();
  TextEditingController invoiceValueWithoutGSTController =
      TextEditingController();
  TextEditingController projectNameController = TextEditingController();
  TextEditingController invoiceDueDateController = TextEditingController();
  TextEditingController gstChargesController = TextEditingController();
  TextEditingController hsnController = TextEditingController();
  TextEditingController stateController = TextEditingController();

  final form = GlobalKey<FormState>();

  List<Project> projectList = [];
  int? projectId;
  RxString projectName = ''.obs;

  @override
  void onInit() async {
    change(null, status: RxStatus.loading());
    invoiceNameController.text = 'Invoice for Photo work';
    invoiceNumberController.text = '123456';
    invoiceValueWithoutGSTController.text = '1234.56';
    invoiceDueDateController.text = '21/07/2023';
    gstChargesController.text = '0';
    hsnController.text = '123456';
    stateController.text = 'TamilNadu';
    getProjectList();
    super.onInit();
  }

  void getProjectList() {
    projectList = [];
    toGetTheProjectList().then((value) {
      projectList = value;
    });
    change(projectList, status: RxStatus.success());
  }

  toSetClientId({bool isClear = false, String? searchingText}) {
    if (isClear) {
      change(projectId = null);
      change(projectName.value = '');
    } else {
      projectName.value = searchingText!;
      projectNameController.text = searchingText;
      change(projectName);
      change(projectNameController.text);
      change(projectId = projectList
          .where((element) =>
              element.projectName!.toLowerCase() == searchingText.toLowerCase())
          .first
          .id!);
    }
  }

  toSelectDate() {
    PickerUtils.datePicker(context: Get.context!).then((value) {
      if (value is DateTime) {
        invoiceDueDateController.text = DateFormat('dd/MM/yyyy').format(value);
        change(invoiceDueDateController);
      } else {
        AppUtils.showErrorSnackBar(Get.context!, value ?? 'Date not selected');
      }
    });
  }

  toAddInvoice() {
    if (form.currentState!.validate()) {
      if (projectId != null) {
        change(null, status: RxStatus.loading());
        //To check invoice existing or not
        Singleton.supabaseInstance.client
            .from(RoloxKey.supaBaseInvoiceTable)
            .select('*')
            .eq('invoiceNumber', invoiceNumberController.text)
            .eq('invoiceName', invoiceNameController.text)
            .eq('projectId', projectId)
            .eq('hsnCode', hsnController.text)
            .then((responseList) {
          if (responseList.isEmpty) {
            insert();
          } else {
            if (responseList.any((element) =>
                element['invoiceNumber'] == invoiceNumberController.text &&
                element['projectId'] == projectId)) {
              change(null, status: RxStatus.success());
              AppUtils.showErrorSnackBar(Get.context!,
                  'Invoice number existing...Please try again with another',
                  durations: 3000);
            } else {
              insert();
            }
          }
        });
      } else {
        AppUtils.showErrorSnackBar(Get.context!, 'Please select your client');
      }
    }
  }

  insert() {
    toInsert(userData: {
      'invoiceName': invoiceNameController.text,
      'invoiceNumber': invoiceNumberController.text,
      'invoiceValueWithoutGst': invoiceValueWithoutGSTController.text,
      'InvoiceDueDate': invoiceDueDateController.text,
      'gstCharges': gstChargesController.text,
      'hsnCode': hsnController.text,
      'projectId': projectId,
    }, tableName: RoloxKey.supaBaseInvoiceTable)
        .then((value) {
      //To get the last inserted invoice
      if (value) {
        Singleton.supabaseInstance.client
            .from(RoloxKey.supaBaseInvoiceTable)
            .select('id')
            .eq('invoiceNumber', invoiceNumberController.text)
            .eq('invoiceName', invoiceNameController.text)
            .eq('projectId', projectId)
            .eq('hsnCode', hsnController.text)
            .then((value) {
          if (!value.isEmpty) {
            userToInvoiceMapping(invoiceId: value[0]['id']);
          }
        });
      } else {
        change(null, status: RxStatus.success());
        AppUtils.showErrorSnackBar(
            Get.context!, 'Something went wrong...Please try again');
      }
    });
  }

  userToInvoiceMapping({required invoiceId}) {
    SupaBaseController.toGetTheSelectedUser(
            mobileNumber: Singleton
                    .supabaseInstance.client.auth.currentUser!.phone
                    .toString()
                    .contains('+')
                ? Singleton.supabaseInstance.client.auth.currentUser!.phone
                    .toString()
                : '+${Singleton.supabaseInstance.client.auth.currentUser!.phone.toString()}')
        .then((selectedUserResponse) {
      debugPrint('response--> $selectedUserResponse');
      if (selectedUserResponse is List && selectedUserResponse.length > 0) {
        toInsert(userData: {
          'invoiceid': invoiceId,
          'userid': selectedUserResponse[0]['id'],
        }, tableName: RoloxKey.supaBaseUserToInvoiceTable)
            .then((value) {
          if (value) {
            change(null, status: RxStatus.success());
            Get.back(result: true);
          } else {
            userToInvoiceMapping(invoiceId: invoiceId);
          }
        });
      } else {
        change(null, status: RxStatus.success());
        AppUtils.showErrorSnackBar(
            Get.context!, 'Something went wrong...Please try again');
      }
    });
  }
}
