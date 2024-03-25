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

class AddProjectLargeScreen extends StatefulWidget {
  AddProjectController? controller;
  GlobalKey<ScaffoldState>? scaffoldKey;

  AddProjectLargeScreen(
      {Key? key, required this.controller, required this.scaffoldKey})
      : super(key: key);

  @override
  State<AddProjectLargeScreen> createState() => _AddProjectLargeScreenState();
}

class _AddProjectLargeScreenState extends State<AddProjectLargeScreen> {
  @override
  Widget build(BuildContext context) {
    Get.put(AddProjectController());
    return RoloxMoneyWidgetState(
        rxStatus: widget.controller!.status,
        child: SafeArea(
            child: Scaffold(
                backgroundColor: Theme.of(context).backgroundColor,
                appBar: AppBar(
                    centerTitle: false,
                    backgroundColor: Colors.transparent,
                    title: Container(
                      padding: const EdgeInsets.only(left: 8.0, top: 20),
                      child: Image.asset(
                        ImageResource.rolox,
                        height: 30,
                        color: Colors.black,
                      ),
                    ),
                    automaticallyImplyLeading: false,
                    shadowColor: Colors.grey,
                    elevation: 0.0),
                body: Center(
                    child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: MediaQuery.of(context).size.height / 1.2,
                        padding: EdgeInsets.symmetric(horizontal: 16,vertical: 12),
                        decoration: BoxDecoration(
                            color: ColorResource.buttonTextColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(24))),
                        alignment: Alignment.topLeft,
                        child: ListView(children: [
                          SizedBox(height: 20),
                          AppBar(
                            backgroundColor: ColorResource.buttonTextColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(24),
                                    topRight: Radius.circular(24))),
                            leading: IconButton(
                              icon: Icon(
                                Icons.arrow_back_sharp,
                                size: 30,
                              ),
                              onPressed: () {
                                Get.back();
                              },
                            ),
                            centerTitle: false,
                            title: CustomText(
                              text: '${Languages.of(context)?.addProject}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      fontSize: 21,
                                      fontWeight: FontWeight.w600),
                            ),
                            elevation: 0,
                          ),
                          Form(
                            key: widget.controller!.form,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  WidgetUtils.genericTextFiled(
                                    height: 50,
                                    context: context,
                                    validationRules: ['required'],
                                    keyBoardType: TextInputType.name,
                                    hintText: Languages.of(context)
                                        ?.brandNameHintText,
                                    controller: widget
                                        .controller!.projectNameController,
                                    labelName:
                                        '${Languages.of(context)?.projectName}',
                                  ),
                                  WidgetUtils.genericTextFiled(
                                    height: 50,
                                    context: context,
                                    validationRules: ['required'],
                                    hintText: Languages.of(context)
                                        ?.searchClientNameHintText,
                                    suffixImagePath: ImageResource.searchSVG,
                                    controller:
                                        widget.controller!.clientNameController,
                                    labelName:
                                        '${Languages.of(context)?.clientName}',
                                  ),
                                  WidgetUtils.genericTextFiled(
                                    height: 50,
                                    context: context,
                                    validationRules: ['required'],
                                    hintText: Languages.of(context)
                                        ?.projectValueHintText,
                                    keyBoardType: TextInputType.name,
                                    controller: widget
                                        .controller!.projectValueController,
                                    labelName:
                                        '${Languages.of(context)?.projectValue}',
                                  ),
                                  WidgetUtils.genericTextFiled(
                                    height: 50,
                                    context: context,
                                    validationRules: [
                                      'required',
                                    ],
                                    hintText: "DD/MM/YYYY",
                                    controller: widget
                                        .controller!.projectDueDateDController,
                                    keyBoardType: TextInputType.emailAddress,
                                    suffixImagePath: ImageResource.calendarSVG,
                                    labelName:
                                        '${Languages.of(context)?.projectDueDate}',
                                  ),
                                  WidgetUtils.genericTextFiled(
                                    height: 50,
                                    context: context,
                                    validationRules: ['required', 'email'],
                                    hintText: Languages.of(context)
                                        ?.projectsEmailIDHintText,
                                    keyBoardType: TextInputType.phone,
                                    controller:
                                        widget.controller!.emailIDController,
                                    labelName:
                                        '${Languages.of(context)?.emailID}',
                                  ),
                                  WidgetUtils.genericTextFiled(
                                    height: 50,
                                    context: context,
                                    hintText:
                                        Languages.of(context)?.projectLinkHint,
                                    keyBoardType: TextInputType.phone,
                                    controller: widget
                                        .controller!.projectLinkController,
                                    labelName:
                                        "${Languages.of(context)?.projectLink} ${Languages.of(context)?.optional}",
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  PrimaryButton(
                                    '${Languages.of(context)!.save}',
                                    context,
                                    cardShape: 1,
                                    isIcon: true,
                                    fontSize: 20,
                                    onTap: () {
                                      if (widget.controller!.form.currentState!
                                          .validate()) {
                                        Get.back();
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]))))));
  }
}
