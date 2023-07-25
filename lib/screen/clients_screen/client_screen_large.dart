import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/languages/app_languages.dart';
import 'package:roloxmoney/model/project_model.dart';
import 'package:roloxmoney/screen/clients_screen/clients_controller.dart';
import 'package:roloxmoney/utils/app_utils.dart';
import 'package:roloxmoney/utils/color_resource.dart';
import 'package:roloxmoney/utils/image_resource.dart';
import 'package:roloxmoney/widget/custom_text.dart';
import 'package:roloxmoney/widget/rolox_money_widget.dart';
import 'package:roloxmoney/widget/secondary_button.dart';

class ClientScreenLarge extends StatefulWidget {
  ClientsController? controller;
  GlobalKey<ScaffoldState>? scaffoldKey;

  ClientScreenLarge(
      {Key? key, required this.controller, required this.scaffoldKey})
      : super(key: key);

  @override
  State<ClientScreenLarge> createState() => _ClientScreenLargeState();
}

class _ClientScreenLargeState extends State<ClientScreenLarge> {
  @override
  Widget build(BuildContext context) {
    Get.put(ClientsController());
    return RoloxMoneyWidgetState(
        rxStatus: widget.controller!.status,
        child: Scaffold(
          backgroundColor: ColorResource.color151515,
          appBar: AppBar(
            backgroundColor: ColorResource.color383838,
            centerTitle: false,
            title: Text.rich(
                TextSpan(
                  text: '${Languages.of(context)?.clients} ',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: ColorResource.colorE08AF4,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                textAlign: TextAlign.center),
            actions: [
              Container(
                height: 30,
                width: 100,
                padding: EdgeInsets.only(top: 8, bottom: 8),
                child: SecondaryButton(
                  '${Languages.of(context)!.addClient}',
                  context,
                  backgroundColor: ColorResource.color00E94F,
                  fontWeight: FontWeight.w500,
                  textColor: ColorResource.black,
                  fontSize: 14,
                  onTap: () {
                    widget.controller!.navigateAddClientScreen();
                  },
                ),
              ),
              SizedBox(width: 10),
              Container(
                  width: 120,
                  height: 30,
                  padding: EdgeInsets.only(top: 8, bottom: 8),
                  child: SecondaryButton(
                    onTap: () {},
                    "27/08/23",
                    context,
                    backgroundColor: ColorResource.colorA0BCD0,
                    isLeading: true,
                    leadingWidget: Container(
                      height: 40,
                      width: 40,
                      child: IconButton(
                          onPressed: () {}, icon: Icon(Icons.calendar_month)),
                    ),
                  )),
              SizedBox(width: 20)
            ],
            shadowColor: Colors.grey,
            elevation: 0.75,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.controller!.projectInvoicesList.obs.value.value
                  .length >
                  0
                  ? ListView.separated(
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(
                          height: 1, color: ColorResource.colorA0BCD0),
                  itemCount: widget.controller!.projectInvoicesList.obs
                      .value.value.length,
                  shrinkWrap: true,
                  // physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    ProjectModel projectModel = widget.controller!
                        .projectInvoicesList.obs.value.value[index];
                    return Container(
                      color: ColorResource.color151515,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: ListTile(
                        leading: Container(
                          height: 40,
                          width: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                            color: ColorResource.color381D4E,
                          ),
                          child: CustomText(
                            text: AppUtils.getInitials('Client Name')
                                .toString(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                color: ColorResource.colorE08AF4,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: 'Client Name',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                  color: ColorResource.colorFFFFFF,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CustomText(
                              text: 'Naveen Business Card Projects',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                  color: ColorResource.colorA0BCD0,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
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
                                  '${projectModel.noOfInvoice} ${Languages.of(context)!.projects}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                      color:
                                      ColorResource.colorA0BCD0,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  height: 5,
                                  width: 5,
                                  decoration: BoxDecoration(
                                    color: ColorResource.colorA0BCD0,
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
                                  width: 5,
                                ),
                                // Image.asset(
                                //   ImageResource.calendar,
                                //   height: 20,
                                // ),
                                // SizedBox(
                                //   width: 5,
                                // ),
                                CustomText(
                                  text: '${projectModel.date}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                      color:
                                      ColorResource.colorA0BCD0,
                                      overflow: TextOverflow.fade,
                                      fontSize: 12,
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
                                textColor: ColorResource.color00E94F,
                                fontSize: 14,
                                onTap: () {},
                              ),
                            )
                          ],
                        ),
                      ),
                    );

                  })
                  : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AppUtils.emptyViewWidget(
                    context: Get.context!,
                    buttonName: Languages.of(context)!.addClient,
                    contentString: "No Clients are there",
                    imagePath: ImageResource.emptyClient,
                    callBack: () {
                      widget.controller!.navigateAddClientScreen();
                    }),
                  ),
            ],
          ),
        ));
  }
}