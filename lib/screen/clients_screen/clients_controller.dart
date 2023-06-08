import 'package:get/get.dart';
import 'package:roloxmoney/screen/clients_screen/add_client/add_client_controller.dart';
import 'package:roloxmoney/screen/clients_screen/add_client/add_client_screen.dart';
import 'package:roloxmoney/screen/clients_screen/entites/clinet_model.dart';
import 'package:roloxmoney/singleton.dart';
import 'package:roloxmoney/utils/RoloxKey.dart';

/*Chinnadurai Viswanathan*/
class ClientsController extends GetxController with StateMixin {
  RxList clientList = [].obs;

  @override
  void onInit() async {
    change(null, status: RxStatus.loading());
    super.onInit();
    toGetTheClientList();
  }

  void navigateAddClientScreen() {
    Get.put(AddClientController());
    Get.toNamed(AddClientScreen.routeName)?.then((value) {
      toGetTheClientList();
    });
  }

  toGetTheClientList() async {
    clientList.value = [];
    try {
      await Singleton.supabaseInstance.client
          .from(RoloxKey.supaBaseUserToClientMap)
          .select('''
    companyId,
    ${RoloxKey.supaBaseCompanyTable}!inner (
      *
    )
  ''').then((value) {
        value.forEach((element) {
          clientList.add(ClientModel.fromJson(element));
        });
      });
      change(clientList, status: RxStatus.success());
    } catch (e) {
      e.printError();
      change(clientList.value = [], status: RxStatus.success());
    }
  }
}
