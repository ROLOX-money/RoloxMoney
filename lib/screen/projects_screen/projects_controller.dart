import 'dart:async';
import 'package:get/get.dart';
import 'package:roloxmoney/model/project_model.dart';
import 'package:roloxmoney/screen/projects_screen/add_project/add_project_controller.dart';
import 'package:roloxmoney/screen/projects_screen/add_project/add_project_screen.dart';

/*Chinnadurai Viswanathan*/
class ProjectsController extends GetxController with StateMixin {
  RxList<ProjectModel> projectInvoicesList = <ProjectModel>[].obs;

  @override
  void onInit() async {
    change(null, status: RxStatus.success());
    Future.delayed(const Duration(seconds: 5), () {
      projectInvoicesList.addAll([
        ProjectModel(
            amount: '25000',
            clientName: 'Target InfoTech',
            projectName: 'Target InfoTech',
            date: DateTime.now().toString(),
            noOfInvoice: 2),
        ProjectModel(
            amount: '25000',
            projectName: 'Target InfoTech',
            clientName: 'Target InfoTech',
            date: DateTime.now().toString(),
            noOfInvoice: 2),
        ProjectModel(
            amount: '25000',
            projectName: 'Target InfoTech',
            clientName: 'Target InfoTech',
            date: DateTime.now().toString(),
            noOfInvoice: 2),
      ]);
      change(projectInvoicesList);
    });

    super.onInit();
  }

  void navigateAddProjectScreen() {
    Get.put(AddProjectController());
    Get.toNamed(AddProjectScreen.routeName);
  }
}
