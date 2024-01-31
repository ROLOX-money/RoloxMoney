import 'package:get/get.dart';
import 'package:roloxmoney/screen/clients_screen/add_client/add_client_controller.dart';
import 'package:roloxmoney/screen/clients_screen/add_client/add_client_screen.dart';
import 'package:roloxmoney/screen/clients_screen/entites/clinet_model.dart';
import 'package:roloxmoney/utils/supa_base_control.dart';

/*Chinnadurai Viswanathan*/
class ClientsController extends GetxController
    with StateMixin, SupaBaseController {
  RxList clientList = [].obs;
  List<ClientModel> cModel = <ClientModel>[];
  RxInt listValueStart = 0.obs;
  RxInt listValueEnd = 0.obs;
  RxBool isEnabled = false.obs;

  @override
  void onInit() async {
    change(null, status: RxStatus.success());
    // Future.delayed(const Duration(seconds: 5), () {
    //   projectInvoicesList.addAll([
    //     ProjectModel(
    //         amount: '25000',
    //         clientName: 'Target InfoTech',
    //         projectName: 'Target InfoTech',
    //         date: DateTime.now().toString(),
    //         noOfInvoice: 2),
    //     ProjectModel(
    //         amount: '25000',
    //         clientName: 'Hyundai Corporation',
    //         projectName: 'Target InfoTech',
    //         date: DateTime.now().toString(),
    //         noOfInvoice: 2),
    //     ProjectModel(
    //         amount: '25000',
    //         clientName: 'Target InfoTech',
    //         projectName: 'Target InfoTech',
    //         date: DateTime.now().toString(),
    //         noOfInvoice: 2),
    //   ]);
    //   change(projectInvoicesList);
    // });
    super.onInit();
    await toGetTheClientList().then((value) {
      clientList.value = value;
      change(clientList, status: RxStatus.success());
    });
    if (clientList.length > 0) {
      for (int i = 0; i < clientList.length; i++) {
        ClientModel model = clientList.obs.value[i];
        cModel.add(model);
      }
      if (cModel.isNotEmpty) {
        if (cModel.length <= 20) {
          listValueStart.value = 1;
          listValueEnd.value = cModel.length + 1;
          isEnabled.value = false;
        } else if (cModel.length > 20) {
          listValueStart.value = 21;
          listValueEnd.value = cModel.length + 1;
          isEnabled.value = true;
        }
      } else {
        listValueStart.value = 0;
        listValueEnd.value = 0;
      }
    }
  }

  void navigateAddClientScreen({int? arguments}) {
    Get.toNamed(AddClientScreen.routeName, arguments: arguments)?.then((value) {
      change(null, status: RxStatus.loading());
      toGetTheClientList().then((value) {
        clientList.value = value;
        if (clientList.length > 0) {
          for (int i = 0; i < clientList.length; i++) {
            ClientModel model = clientList.obs.value[i];
            cModel.add(model);
          }
        }
        change(clientList, status: RxStatus.success());
      });
    });
    Get.lazyPut(() => AddClientController());
  }
}
