
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:roloxmoney/screen/clients_screen/entites/clinet_model.dart';
import 'package:roloxmoney/singleton.dart';
import 'package:roloxmoney/utils/RoloxKey.dart';
import 'package:roloxmoney/utils/app_utils.dart';
import 'package:roloxmoney/utils/picker.dart';
import 'package:roloxmoney/utils/supa_base_control.dart';

/*Chinnadurai Viswanathan*/
class AddProjectController extends GetxController
    with StateMixin, SupaBaseController {
  TextEditingController projectNameController = TextEditingController();
  TextEditingController clientNameController = TextEditingController();
  TextEditingController projectValueController = TextEditingController();
  TextEditingController projectDueDateDController = TextEditingController();
  TextEditingController projectLinkDController = TextEditingController();
  TextEditingController emailIDController = TextEditingController();
  TextEditingController projectLinkController = TextEditingController();
  final form = GlobalKey<FormState>();
  List<ClientModel> clientList = [];
  String? clientId;
  RxString clientName = ''.obs;

  @override
  void onInit() async {
    change(null, status: RxStatus.loading());
    toGetTheClientList().then((value) {
      clientList = value;
      change(clientList, status: RxStatus.success());
    });
    super.onInit();
  }

  toSelectDate() {
    PickerUtils.datePicker(context: Get.context!).then((value) {
      if (value is DateTime) {
        projectDueDateDController.text = DateFormat('dd/MM/yyyy').format(value);
        change(projectDueDateDController);
      } else {
        AppUtils.showErrorSnackBar(Get.context!, value ?? 'Date not selected');
      }
    });
  }

  toAddProject() {
    change(null, status: RxStatus.loading());
    toInsert(userData: {
      'projectName': projectNameController.text,
      'projectvalue': projectValueController.text,
      'dueDate': projectDueDateDController.text,
      'clientID': clientId,
      'clientName': clientName.value,
      'refrenceID': Singleton.supabaseInstance.client.auth.currentUser!.id,
    }, tableName: RoloxKey.supaBaseProjectDb)
        .then((value) {
      if (value) {
        AppUtils.showSnackBar(
            Get.context!, 'Successfully created your new project');
        Get.back(result: true);
      }
    });
  }

  toSetClientId({bool isClear = false, String? searchingText}) {
    if (isClear) {
      change(clientId = null);
      change(clientName.value = '');
    } else {
      clientName.value = searchingText!;
      change(clientName);
      change(clientId = clientList
          .where((element) =>
              element.companyDB!.companyName!.toLowerCase() ==
              searchingText.toLowerCase())
          .first
          .companyDB!
          .id);
    }
  }
}
