import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:roloxmoney/languages/app_languages.dart';
import 'package:roloxmoney/screen/projects_screen/projects_controller.dart';
import 'package:roloxmoney/singleton.dart';
import 'package:roloxmoney/utils/app_utils.dart';
import 'package:roloxmoney/utils/color_resource.dart';
import 'package:roloxmoney/utils/image_resource.dart';
import 'package:roloxmoney/utils/widget_utils.dart';
import 'package:roloxmoney/widget/custom_button.dart';
import 'package:roloxmoney/widget/custom_text.dart';
import 'package:roloxmoney/widget/rolox_money_widget.dart';
import 'package:roloxmoney/widget/secondary_button.dart';

class ProjectScreenLarge extends StatefulWidget {
  ProjectsController? controller;
  GlobalKey<ScaffoldState>? scaffoldKey;

  ProjectScreenLarge(
      {Key? key, required this.controller, required this.scaffoldKey})
      : super(key: key);

  @override
  State<ProjectScreenLarge> createState() => _ProjectScreenLargeState();
}

class _ProjectScreenLargeState extends State<ProjectScreenLarge> {
  @override
  Widget build(BuildContext context) {
    Get.put(ProjectsController());
    return RoloxMoneyWidgetState(
        rxStatus: widget.controller!.status,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: ColorResource.mediumScreenAppBarBgColor,
            centerTitle: false,
            title: Text.rich(
                TextSpan(
                  text: '${Languages.of(context)?.projects} ',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                textAlign: TextAlign.center),
            actions: [
              Container(
                  height: 30,
                  width: 120,
                  padding: EdgeInsets.only(top: 8, bottom: 8),
                  child: PrimaryButton(
                    '${Languages.of(context)!.addProject}',
                    context,
                    borderRadius: 12,
                    onTap: () {
                      widget.controller!.navigateAddProjectScreen();
                    },
                  )),
              SizedBox(width: 10),
              Container(
                  width: 150,
                  height: 30,
                  padding: EdgeInsets.only(top: 8, bottom: 8),
                  child: SecondaryButton(
                    onTap: () {},
                    DateFormat("dd/MM/yyyy").format(DateTime.now()).toString(),
                    context,
                    backgroundColor: ColorResource.dividerColor,
                    isLeading: true,
                    borderRadius: 12,
                    leadingWidget: Container(
                      height: 40,
                      width: 40,
                      child: IconButton(
                          onPressed: () {}, icon: Icon(Icons.calendar_month)),
                    ),
                  )),
              SizedBox(width: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                      text:
                          '${widget.controller!.listValueStart} - ${widget.controller!.listValueEnd} of 20'),
                  SizedBox(width: 5),
                  AppUtils.pageNationButton(
                      icon: Icons.arrow_back_ios,
                      onPressed: () {},
                      enabled: true),
                  SizedBox(width: 5),
                  AppUtils.pageNationButton(
                      icon: Icons.arrow_forward_ios,
                      onPressed: () {},
                      enabled: widget.controller!.isEnabled.value),
                  SizedBox(width: 5),
                  AppUtils.pageNationButton(
                      icon: Icons.double_arrow_rounded,
                      onPressed: () {},
                      enabled: widget.controller!.isEnabled.value),
                ],
              ),
              SizedBox(width: 20)
            ],
            shadowColor: Colors.grey,
            elevation: 0.75,
          ),
          body: widget.controller!.projectInvoicesList.obs.value.length > 0
              ? Padding(
                  padding: const EdgeInsets.only(
                      top: 30, bottom: 60, right: 30, left: 30),
                  child: WidgetUtils.customTableWidget(
                    context: context,
                    isProjectTap: true,
                    listLength:
                        widget.controller!.projectInvoicesList.obs.value.length,
                    // listLength: Singleton.projectList.obs.value.length,
                    projectList:
                        widget.controller!.projectInvoicesList.obs.value,
                    // projectList: Singleton.projectList.obs.value,
                  ))
              : AppUtils.emptyViewWidget(
                  context: Get.context!,
                  buttonName: Languages.of(context)!.addProject,
                  contentString: "No Projects are there",
                  imagePath: ImageResource.emptyProject,
                  callBack: () {
                    widget.controller!.navigateAddProjectScreen();
                  }),
        ));
  }
}
