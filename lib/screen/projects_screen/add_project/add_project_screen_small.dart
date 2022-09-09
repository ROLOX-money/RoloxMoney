import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/languages/app_languages.dart';
import 'package:roloxmoney/screen/projects_screen/add_project/add_project_controller.dart';
import 'package:roloxmoney/utils/color_resource.dart';
import 'package:roloxmoney/utils/image_resource.dart';
import 'package:roloxmoney/utils/widget_utils.dart';
import 'package:roloxmoney/widget/custom_button.dart';
import 'package:roloxmoney/widget/custom_text.dart';
import 'package:roloxmoney/widget/rolox_money_widget.dart';

/*Chinnadurai Viswanathan*/
// ignore: must_be_immutable
class AddProjectScreenSmall extends StatefulWidget {
  AddProjectController? controller;
  GlobalKey<ScaffoldState>? scaffoldKey;

  AddProjectScreenSmall(
      {Key? key, required this.controller, required this.scaffoldKey})
      : super(key: key);

  @override
  AddProjectScreenSmallState createState() => AddProjectScreenSmallState();
}

class AddProjectScreenSmallState extends State<AddProjectScreenSmall> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(AddProjectController());
    return RoloxMoneyWidgetState(
      rxStatus: widget.controller!.status,
      child: Scaffold(
        body: Container(
          alignment: Alignment.topLeft,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBar(
                  backgroundColor: Theme.of(context).backgroundColor,
                  leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back_sharp,
                      size: 30,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  centerTitle: true,
                  title: CustomText(
                    text: '${Languages.of(context)?.addProject}',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: ColorResource.colorFFFFFF,
                        fontSize: 21,
                        fontWeight: FontWeight.w600),
                  ),
                  shadowColor: Colors.grey,
                  elevation: 0.75,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      WidgetUtils.genericTextFiled(
                        context: context,
                        keyBoardType: TextInputType.name,
                        controller: widget.controller!.projectNameController,
                        labelName: '${Languages.of(context)?.projectName}'
                            .toUpperCase(),
                      ),
                      WidgetUtils.genericTextFiled(
                        context: context,
                        suffixImagePath: ImageResource.searchSVG,
                        controller: widget.controller!.clientNameController,
                        labelName: '${Languages.of(context)?.clientName}'
                            .toUpperCase(),
                      ),
                      WidgetUtils.genericTextFiled(
                        context: context,
                        keyBoardType: TextInputType.name,
                        controller: widget.controller!.projectValueController,
                        labelName: '${Languages.of(context)?.projectValue}'
                            .toUpperCase(),
                      ),
                      WidgetUtils.genericTextFiled(
                        context: context,
                        controller:
                            widget.controller!.projectDueDateDController,
                        keyBoardType: TextInputType.emailAddress,
                        suffixImagePath: ImageResource.calendarSVG,
                        labelName: '${Languages.of(context)?.projectDueDate}'
                            .toUpperCase(),
                      ),
                      WidgetUtils.genericTextFiled(
                        context: context,
                        keyBoardType: TextInputType.phone,
                        controller: widget.controller!.emailIDController,
                        labelName:
                            '${Languages.of(context)?.emailID}'.toUpperCase(),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      PrimaryButton(
                        '${Languages.of(context)!.save}',
                        context,
                        cardShape: 1,
                        isIcon: true,
                        textColor: ColorResource.black,
                        fontSize: 20,
                        onTap: () {
                          Get.back();
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
    );
  }
}
