import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/languages/app_languages.dart';
import 'package:roloxmoney/model/project_model.dart';
import 'package:roloxmoney/screen/projects_screen/projects_controller.dart';
import 'package:roloxmoney/utils/app_utils.dart';
import 'package:roloxmoney/utils/color_resource.dart';
import 'package:roloxmoney/utils/image_resource.dart';
import 'package:roloxmoney/widget/custom_button.dart';
import 'package:roloxmoney/widget/custom_text.dart';
import 'package:roloxmoney/widget/rolox_money_widget.dart';
import 'package:roloxmoney/widget/secondary_button.dart';

/*Chinnadurai Viswanathan*/
// ignore: must_be_immutable
class ProjectsScreenSmall extends StatefulWidget {
  ProjectsController? controller;
  GlobalKey<ScaffoldState>? scaffoldKey;

  ProjectsScreenSmall(
      {Key? key, required this.controller, required this.scaffoldKey})
      : super(key: key);

  @override
  ProjectsScreenSmallState createState() => ProjectsScreenSmallState();
}

class ProjectsScreenSmallState extends State<ProjectsScreenSmall> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(ProjectsController());
    return RoloxMoneyWidgetState(
      rxStatus: widget.controller!.status,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView(
          physics: ScrollPhysics(),
          children: [
            SizedBox(
              height: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.controller!.projectInvoicesList.obs.value.length > 0
                    ? Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: '${Languages.of(context)!.projectDetails}'
                                  .toUpperCase(),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      color: ColorResource.color000000,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                            ),
                            Container(
                              width: 110,
                              height: 40,
                              child: PrimaryButton(
                                '${Languages.of(context)!.addProject}',
                                context,
                                fontWeight: FontWeight.w500,
                                textColor: ColorResource.colorFFFFFF,
                                fontSize: 14,
                                onTap: () {
                                  widget.controller!.navigateAddProjectScreen();
                                },
                              ),
                            )
                          ],
                        ),
                      )
                    : SizedBox(),
                SizedBox(
                  height: 15,
                ),
                widget.controller!.projectInvoicesList.obs.value.length > 0
                    ? ListView.separated(
                        separatorBuilder: (BuildContext context, int index) =>
                            Divider(
                                height: 1, color: ColorResource.color181B28),
                        itemCount: widget
                            .controller!.projectInvoicesList.obs.value.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          ProjectModel projectModel = widget
                              .controller!.projectInvoicesList.obs.value[index];
                          return Container(
                            color: ColorResource.colorFFFFFF,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: ListTile(
                              leading: Container(
                                height: 40,
                                width: 40,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  color: ColorResource.initialBgColor,
                                ),
                                child: CustomText(
                                  text: AppUtils.getInitials(
                                          projectModel.projectName!)
                                      .toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                          color: ColorResource.initialTextColor,
                                          fontWeight: FontWeight.w700),
                                ),
                              ),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text:
                                        projectModel.projectName!.capitalize ??
                                            "",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                            color: ColorResource.textColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        ImageResource.invoiceIcons,
                                        height: 20,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      CustomText(
                                        text:
                                            '${projectModel.noOfInvoice.toString()} ${Languages.of(context)?.invoices.capitalizeFirst}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                                color: ColorResource
                                                    .textSecondaryColor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        height: 5,
                                        width: 5,
                                        decoration: BoxDecoration(
                                          color: ColorResource.colorA0A1A9,
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(40.0),
                                              bottomRight:
                                                  Radius.circular(40.0),
                                              topLeft: Radius.circular(40.0),
                                              bottomLeft:
                                                  Radius.circular(40.0)),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Image.asset(
                                        ImageResource.calendar,
                                        height: 20,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      CustomText(
                                        text: '${projectModel.dueDate}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                                color: ColorResource
                                                    .textSecondaryColor,
                                                overflow: TextOverflow.fade,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: 110,
                                    height: 40,
                                    child: SecondaryButton(
                                      '${Languages.of(context)!.viewMore}',
                                      context,
                                      fontWeight: FontWeight.w500,
                                      backgroundColor:
                                          ColorResource.colorF5F5F5,
                                      textColor: ColorResource.textColor,
                                      fontSize: 16,
                                      onTap: () {
                                        widget.controller!
                                            .navigateAddProjectScreen(
                                                arguments: index);
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        })
                    : AppUtils.emptyViewWidget(
                        context: Get.context!,
                        buttonName: Languages.of(context)!.addProject,
                        contentString: "No Projects are there",
                        imagePath: ImageResource.emptyProject,
                        callBack: () {
                          widget.controller!.navigateAddProjectScreen();
                        }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
