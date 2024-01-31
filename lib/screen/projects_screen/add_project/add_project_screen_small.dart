import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/languages/app_languages.dart';
import 'package:roloxmoney/screen/projects_screen/add_project/add_project_controller.dart';
import 'package:roloxmoney/utils/app_utils.dart';
import 'package:roloxmoney/utils/auto_complete.dart';
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
    return GetBuilder<AddProjectController>(
      assignId: true,
      builder: (controller) {
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
                      backgroundColor: ColorResource.buttonTextColor,
                      leading: IconButton(
                        icon: Icon(
                          Icons.arrow_back_sharp,
                          size: 30,
                          // color: Colors.white,
                        ),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                      centerTitle: true,
                      title: CustomText(
                        text: widget.controller!.projectDetails != null
                            ? widget.controller!.projectDetails!.projectName!
                            : '${Languages.of(context)?.addProject}',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            // color: ColorResource.colorFFFFFF,
                            fontSize: 21,
                            fontWeight: FontWeight.w600),
                      ),
                      // shadowColor: Colors.grey,
                      elevation: 0.3,
                    ),
                    Form(
                      key: widget.controller!.form,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            // WidgetUtils.genericAutoCompleteTextField(
                            //   textController:
                            //       widget.controller!.clientNameController,
                            //   context: context,
                            //   hintText: Languages.of(context)
                            //       ?.searchClientNameHintText,
                            //   suggestions: widget.controller!.clientList
                            //       .map((item) => item.companyDB!.companyName!)
                            //       .toList(),
                            //   labelName: Languages.of(context)?.clientName,
                            //   textSubmitted: (text) {
                            //     widget.controller!
                            //         .toSetClientId(searchingText: text);
                            //   },
                            //   textChanged: (text) {
                            //     widget.controller!.toSetClientId(isClear: true);
                            //   },
                            // ),
                            CustomText(
                              text: Languages.of(context)!.clientName,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Card(
                              key: Key("projectName"),
                              // alignment: Alignment.center,
                              child: AutoComplete.autoComplete(
                                  hintText: Languages.of(context)!
                                      .searchClientNameHintText,
                                  value: null,
                                  suggestionValue: widget.controller!.clientList
                                      .map((item) =>
                                          item.companyDB!.companyName!)
                                      .toList(),
                                  onFieldSubmitted: (value) {
                                    widget.controller!
                                        .toSetClientId(searchingText: value);
                                  }),
                            ),
                            WidgetUtils.genericTextFiled(
                              context: context,
                              validationRules: ['required'],
                              keyBoardType: TextInputType.name,
                              hintText:
                                  Languages.of(context)?.brandNameHintText,
                              controller:
                                  widget.controller!.projectNameController,
                              labelName:
                                  '${Languages.of(context)?.projectName}',
                            ),
                            WidgetUtils.genericTextFiled(
                              context: context,
                              validationRules: ['required'],
                              hintText:
                                  Languages.of(context)?.projectValueHintText,
                              keyBoardType: TextInputType.number,
                              controller:
                                  widget.controller!.projectValueController,
                              labelName:
                                  '${Languages.of(context)?.projectValue}',
                            ),
                            WidgetUtils.genericTextFiled(
                              context: context,
                              validationRules: [
                                'required',
                              ],
                              hintText: "DD/MM/YYYY",
                              isReadOnly: true,
                              onTab: () {
                                widget.controller!.toSelectDate();
                              },
                              controller:
                                  widget.controller!.projectDueDateDController,
                              keyBoardType: TextInputType.datetime,
                              suffixImagePath: ImageResource.calendarSVG,
                              labelName:
                                  '${Languages.of(context)?.projectDueDate}',
                            ),
                            WidgetUtils.genericTextFiled(
                              context: context,
                              validationRules: ['required', 'email'],
                              hintText: Languages.of(context)
                                  ?.projectsEmailIDHintText,
                              keyBoardType: TextInputType.emailAddress,
                              controller: widget.controller!.emailIDController,
                              labelName: '${Languages.of(context)?.emailID}',
                            ),
                            WidgetUtils.genericTextFiled(
                              context: context,
                              hintText: Languages.of(context)?.projectLink,
                              keyBoardType: TextInputType.name,
                              controller:
                                  widget.controller!.projectLinkDController,
                              labelName:
                                  '${Languages.of(context)?.projectLinkHint}',
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            PrimaryButton(
                              '${Languages.of(context)!.save}',
                              context,
                              cardShape: 1,
                              isIcon: true,
                              textColor: ColorResource.colorFFFFFF,
                              fontSize: 20,
                              onTap: () {
                                if (widget.controller!.form.currentState!
                                    .validate()) {
                                  if (widget.controller!.clientId != null) {
                                    widget.controller!.toAddProject();
                                  } else {
                                    AppUtils.showErrorSnackBar(
                                        context, 'Please selected your client');
                                  }
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
                  ],
                ),
              ),
            ),
            backgroundColor: ColorResource.buttonTextColor,
          ),
        );
      },
    );
  }
}
