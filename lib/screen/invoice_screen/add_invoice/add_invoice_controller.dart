import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:roloxmoney/screen/invoice_screen/entities/project_model.dart';
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
      change(projectName);
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
        // toInsert(userData: {
        //   'projectName': projectNameController.text,
        //   'projectvalue': projectValueController.text,
        //   'dueDate': projectDueDateDController.text,
        //   'clientID': clientId,
        //   'clientName': clientName.value,
        //   'refrenceID': Singleton.supabaseInstance.client.auth.currentUser!.id,
        // }, tableName: RoloxKey.supaBaseProjectDb)
        //     .then((value) {
        //   if (value) {
        //     AppUtils.showSnackBar(
        //         Get.context!, 'Successfully created your new project');
        //     Get.back(result: true);
        //   }
        // });
      } else {
        AppUtils.showErrorSnackBar(Get.context!, 'Please selected your client');
      }
    }
  }
}
