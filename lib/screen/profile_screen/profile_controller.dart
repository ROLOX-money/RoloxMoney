import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:roloxmoney/singleton.dart';
import 'package:roloxmoney/utils/RoloxKey.dart';
import 'package:roloxmoney/utils/app_utils.dart';

enum ModelOfWork { fullTime, partTime }

/*Chinnadurai Viswanathan*/
class ProfileController extends GetxController with StateMixin {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController mobilNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController businessNameController = TextEditingController();
  TextEditingController bankAccountController = TextEditingController();
  TextEditingController bankIFSCController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  RxBool isFreelancer = false.obs;
  RxBool isLogo = false.obs;
  final form = GlobalKey<FormState>();
  Rx<ModelOfWork> modelOfWork = ModelOfWork.fullTime.obs;
  RxList<String> roleDropDown = [
    'Founder',
    'CEO',
    'Admin',
  ].obs;
  RxString roleDropDownValue = 'Founder'.obs;
  RxList<String> natureOfWork = [
    'Software',
    'Driver',
    'Auditor',
    'Other',
  ].obs;
  RxString natureOfWorkValue = 'Software'.obs;

  RxBool iDontHaveBusiness = true.obs;

  RxList<String> industryOfWork = [
    'Telecom',
    'Cinema',
    'Account',
    'Banking',
    'Other',
  ].obs;
  RxString industryOfWorkValue = 'Telecom'.obs;

  RxList<String> typeOfAddress = [
    'Work',
    'Home',
    'Current',
    'Residence',
  ].obs;
  RxString typeOfAddressValue = 'Home'.obs;
  RxBool gstNumber = true.obs;
  RxInt currentStep = 1.obs;

  @override
  void onInit() async {
    Singleton.supabaseInstance.client
        .from(RoloxKey.supaBaseUserTable)
        .select('*')
        .eq('id', Singleton.mobileUserId)
        .then((userResponse) {
      firstNameController.text = userResponse[0]['name'];
      emailController.text = userResponse[0]['email'];
      isFreelancer.value = userResponse[0]['profiletype'] == 1;
      mobilNumberController.text = userResponse[0]['phone']
          .toString()
          .substring(userResponse[0]['phone'].toString().contains('+91')
              ? 3
              : userResponse[0]['phone'].toString().contains('91')
                  ? 2
                  : userResponse[0]['phone'].toString().contains('1')
                      ? 1
                      : 0);

      Singleton.supabaseInstance.client
          .from(RoloxKey.supaBaseCompanyTable)
          .select('companyName')
          .eq('userid', [Singleton.mobileUserId]).then((value) {
        if (value is List && value.isNotEmpty) {
          businessNameController.text = value[0]['companyName'] ?? '';
        }
      });
      change(null, status: RxStatus.success());
    });
    super.onInit();
  }

  filePickerDialog() async {
    await ImagePicker().pickImage(source: ImageSource.gallery).then((value) {
      uploadFile(filePath: value!.path);
    });
  }

  Future<void> filePicker() async {
    // if (await Permission.storage.isGranted) {
    //   filePickerDialog();
    // } else {
    //   await Permission.storage.request().then((status) {
    //     if (status.isGranted) {
    //       filePickerDialog();
    //     } else {
    //       filePicker();
    //     }
    //   });
    // }
    filePickerDialog();
  }

  Future<void> uploadFile({required String filePath}) async {
    change(null, status: RxStatus.loading());
    debugPrint('file values--> $filePath');
    try {
      File file = File(filePath);
      var request = http.MultipartRequest(
        'PUT',
        Uri.parse(
            '${Singleton.imageUploadURL + Singleton.mobileUserId}.${file.path.split('.').last}'),
      );
      request.files.add(
          await http.MultipartFile.fromPath(Singleton.mobileUserId, file.path));
      try {
        await request.send().then((response) async {
          String responseString = await response.stream.bytesToString();
          debugPrint('File uploaded successfully. Response: $responseString');
          AppUtils.showSnackBar(Get.context!, 'File uploaded successfully');
        });
      } catch (e) {
        AppUtils.showErrorSnackBar(
            Get.context!, 'Error file convert into MultipartRequest',
            durations: 5000);
      }
    } catch (e) {
      AppUtils.showErrorSnackBar(
          Get.context!, 'Error file convert into MultipartRequest',
          durations: 5000);
      debugPrint('Error file convert into MultipartRequest: $e');
    }
    change(null, status: RxStatus.success());
  }

  void updateValuesOnUI({String? value, RxString? variableName}) {
    if (variableName == this.roleDropDownValue) {
      roleDropDownValue = value!.obs;
      change(roleDropDownValue);
    } else if (variableName == this.natureOfWorkValue) {
      natureOfWorkValue = value!.obs;
      change(natureOfWorkValue);
    } else if (variableName == this.industryOfWorkValue) {
      industryOfWorkValue = value!.obs;
      change(industryOfWorkValue);
    } else if (variableName == this.typeOfAddressValue) {
      typeOfAddressValue = value!.obs;
      change(typeOfAddressValue);
    }
  }

  void modelOfWorkToggle({ModelOfWork? value}) {
    modelOfWork = value!.obs;
    change(modelOfWork);
  }

  void noBusinessCheckBox({bool? values}) {
    iDontHaveBusiness = values!.obs;
    change(iDontHaveBusiness);
  }

  void noGSTCheckBox({bool? values}) {
    gstNumber = values!.obs;
    change(gstNumber);
  }

  void stepCount({required int values}) {
    currentStep = values.obs;
    change(currentStep);
  }
}
