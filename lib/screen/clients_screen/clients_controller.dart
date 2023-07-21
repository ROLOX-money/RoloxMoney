import 'package:get/get.dart';
import 'package:roloxmoney/screen/clients_screen/add_client/add_client_controller.dart';
import 'package:roloxmoney/screen/clients_screen/add_client/add_client_screen.dart';
import 'package:roloxmoney/utils/supa_base_control.dart';

/*Chinnadurai Viswanathan*/
class ClientsController extends GetxController
    with StateMixin, SupaBaseController {
  RxList clientList = [].obs;

  @override
  void onInit() async {
    change(null, status: RxStatus.loading());
    super.onInit();
    toGetTheClientList().then((value) {
      clientList.value = value;
      change(clientList, status: RxStatus.success());
    });
  }

  void navigateAddClientScreen() {
    Get.put(AddClientController());
    Get.toNamed(AddClientScreen.routeName)?.then((value) {
      toGetTheClientList().then((value) {
        clientList.value = value;
        change(clientList, status: RxStatus.success());
      });
    });
  }
}
