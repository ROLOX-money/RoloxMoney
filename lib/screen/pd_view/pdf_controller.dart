import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:internet_file/internet_file.dart';
import 'package:internet_file/storage_io.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:roloxmoney/utils/app_utils.dart';
import 'package:share_plus/share_plus.dart';

/*Chinnadurai Viswanathan*/
class PDFController extends GetxController with StateMixin {
  RxString url =
      'https://339rrq5qm1.execute-api.ap-south-1.amazonaws.com/download/invoices.vm.rstk.in/1/out.pdf'
          .obs;
  RxMap apiKey = {'x-api-key': 'WiToRbqXh44fTzRn0RhQe3qoLTPplOwA7GUywDA0'}.obs;

  @override
  void onInit() async {
    change(null, status: RxStatus.success());
    super.onInit();
  }

  Future<void> downloadTheFile() async {
    change(null, status: RxStatus.loading());

    Dio dio = Dio();
    try {
      var response = await dio.get(
        url.value,
        options: Options(
            responseType: ResponseType.bytes,
            headers: {'x-api-key': 'WiToRbqXh44fTzRn0RhQe3qoLTPplOwA7GUywDA0'}),
      );
      Directory appDocDir = await getApplicationDocumentsDirectory();
      var appExDocDir = await getExternalStorageDirectory();


      // Get the platform-specific download directory.
      var directory = await getApplicationDocumentsDirectory();

      debugPrint('appDocDir-->${appDocDir.path}');
      debugPrint('appExDocDir-->${appExDocDir?.path}');

      String filePath =
          '${appExDocDir?.path}/rolox_invoice_project_name_project_number.pdf'; // Replace with your desired file name and extension.
      File file = File(filePath);
      await file.writeAsBytes(response.data).then((value) {
        debugPrint('File-->${value.path}');
        debugPrint('File-->${value.absolute.path}');
        AppUtils.showSnackBar(Get.context!,
            'rolox_invoice_project_name_project_number download has been completed');
      });
      try {
        await FlutterShare.shareFile(
          title: 'Rolox Invoice',
          text: 'Rolox Invoice',
          filePath: value.absolute.path,
        ).then((value) {
          debugPrint('Fie sharing values---> $value');
        });
      } catch (e) {
        AppUtils.showErrorSnackBar(
            Get.context!, 'Something Problem with file sharing',
            durations: 5000);
      }
    } catch (e) {
      AppUtils.showErrorSnackBar(
          Get.context!, 'Something went wrong...Please try again sometime',
          durations: 5000);
    }
    change(null, status: RxStatus.success());
  }

  Future<void> requestStoragePermission() async {
    if (await Permission.storage.isGranted) {
      downloadTheFile();
    } else {
      await Permission.storage.request().then((status) {
        if (status.isGranted) {
          downloadTheFile();
        } else {
          requestStoragePermission();
        }
      });
    }
  }
}
