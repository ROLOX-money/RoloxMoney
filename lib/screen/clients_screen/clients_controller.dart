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
    }
  }

  void navigateAddClientScreen() {
    Get.put(AddClientController());
    Get.toNamed(AddClientScreen.routeName)?.then((value) {
      change(null, status: RxStatus.loading());
      toGetTheClientList().then((value) {
        clientList.value = value;
        change(clientList, status: RxStatus.success());
      });
    });
  }
}
