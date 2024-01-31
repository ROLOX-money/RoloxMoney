/*Chinnadurai Viswanathan*/
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:roloxmoney/model/project_model.dart';
import 'package:roloxmoney/screen/invoice_screen/entities/invoice_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Singleton {
  //1 = real device, 2= Testing device
  int deviceType = 1;
  static String mobileUserId = '1bcf7890-52c3-4d9c-87c9-287b606b7cc4';
  static String imageUploadURL =
      'https://2bcgkzypx4.execute-api.ap-south-1.amazonaws.com/dev/logo.vm.rstk.in/';
  static String invoiceDownloadURL =
      'https://339rrq5qm1.execute-api.ap-south-1.amazonaws.com/download/invoices.vm.rstk.in/1/out.pdf';
  static Map<String, dynamic> imageUploadHeaders = {
    'x-api-key': 'WiToRbqXh44fTzRn0RhQe3qoLTPplOwA7GUywDA0'
  };
  static final Singleton _singleton = Singleton._internal();

  static late final Supabase supabaseInstance;

  static RxList<Invoice> invoiceList = <Invoice>[].obs;
  static RxList<Invoice> updatedInvoiceList = <Invoice>[].obs;
  static RxList<ProjectModel> projectList = <ProjectModel>[].obs;
  static RxList<ProjectModel> updatedProjectList = <ProjectModel>[].obs;

  factory Singleton() {
    return _singleton;
  }

  Singleton._internal();

  static Singleton get instance => _singleton;
}
