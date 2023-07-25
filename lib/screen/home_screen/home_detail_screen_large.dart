import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/languages/app_languages.dart';
import 'package:roloxmoney/model/group_invoices_model.dart';
import 'package:roloxmoney/screen/home_screen/home_detail_screen.dart';
import 'package:roloxmoney/utils/color_resource.dart';
import 'package:roloxmoney/utils/image_resource.dart';
import 'package:roloxmoney/widget/custom_text.dart';
import 'package:roloxmoney/widget/rolox_money_widget.dart';

import 'home_controller.dart';

class HomeDetailsScreenLarge extends StatefulWidget {
  HomeController? controller;
  GlobalKey<ScaffoldState>? scaffoldKey;
  int? buttonNo;

  HomeDetailsScreenLarge(
      {Key? key,
      required this.controller,
      required this.scaffoldKey,
      required this.buttonNo})
      : super(key: key);

  @override
  State<HomeDetailsScreenLarge> createState() => _HomeDetailsScreenLargeState();
}

class _HomeDetailsScreenLargeState extends State<HomeDetailsScreenLarge> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return RoloxMoneyWidgetState(
        rxStatus: widget.controller!.status,
        child: SafeArea(
            child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Container(
                    alignment: Alignment.topLeft,
                    child: ListView(shrinkWrap: true,
                        // physics: NeverScrollableScrollPhysics(),
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                AppBar(
                                  backgroundColor: ColorResource.color383838,
                                  centerTitle: false,
                                  title: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text.rich(
                                          TextSpan(
                                              text: (widget.buttonNo == 1)
                                                  ? '${Languages.of(context)?.upcomingInvoices} '
                                                  : (widget.buttonNo == 2)
                                                      ? '${Languages.of(context)?.paidInvoices}'
                                                      : '${Languages.of(context)?.dueInvoices}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall!
                                                  .copyWith(
                                                      color: ColorResource
                                                          .colorFFFFFF,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w600),
                                              children: <InlineSpan>[
                                                if (widget.buttonNo == 1)
                                                  TextSpan(
                                                    text:
                                                        '(${Languages.of(context)?.inNext1Week})',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleSmall!
                                                        .copyWith(
                                                            color: ColorResource
                                                                .colorA0BCD0,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                  )
                                              ]),
                                          textAlign: TextAlign.center),
                                      Padding(
                                          padding: EdgeInsets.only(left: 150),
                                          child: Container(
                                              height: 40,
                                              decoration: BoxDecoration(
                                                color: ColorResource.black,
                                                borderRadius: BorderRadius.circular(8)
                                              ),
                                              padding: EdgeInsets.all(10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Container(
                                                    child: Image.asset(
                                                      ImageResource
                                                          .withdrawImage,
                                                      height: 30,
                                                      width: 30,
                                                    ),
                                                  ),
                                                  SizedBox(width: 30),
                                                  Text(
                                                    "Transaction worth :",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleSmall!
                                                        .copyWith(
                                                            color: ColorResource
                                                                .colorFFFFFF,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                  ),
                                                  SizedBox(width: 30),
                                                  Text(
                                                    "5000",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleSmall!
                                                        .copyWith(
                                                            color: ColorResource
                                                                .color00E94F,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                  )
                                                ],
                                              ))),
                                    ],
                                  ),
                                  shadowColor: Colors.grey,
                                  elevation: 0.75,
                                ),
                                SizedBox(height: 30),
                                ListTile(
                                  tileColor: ColorResource.color151515,
                                  visualDensity:
                                      VisualDensity(horizontal: 4, vertical: 4),
                                  shape: Border.all(
                                      color: Colors.grey, width: 0.15),
                                  leading: Container(
                                    child: Image.asset(
                                      ImageResource.withdrawImage,
                                      height: 40,
                                      width: 40,
                                    ),
                                  ),
                                  title: CustomText(
                                    text:
                                        '${Languages.of(context)?.youWalletBalance}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                            color: ColorResource.colorFFFFFF,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                  ),
                                  trailing: CustomText(
                                    text: '₹ 50000',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                            color: ColorResource.color00E94F,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                  ),
                                ),
                                SizedBox(height: 20),
                                ListView.builder(
                                    itemCount: (widget.buttonNo == 1)
                                        ? widget
                                            .controller!
                                            .upcomingInvoicesList
                                            .obs
                                            .value
                                            .value
                                            .length
                                        : (widget.buttonNo == 2)
                                            ? widget
                                                .controller!
                                                .paidInvoicesList
                                                .obs
                                                .value
                                                .value
                                                .length
                                            : widget.controller!.dueInvoicesList
                                                .obs.value.value.length,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      GroupInvoices groupInvoices =
                                          (widget.buttonNo == 1)
                                              ? widget
                                                  .controller!
                                                  .upcomingInvoicesList
                                                  .obs
                                                  .value
                                                  .value[index]
                                              : (widget.buttonNo == 2)
                                                  ? widget
                                                      .controller!
                                                      .paidInvoicesList
                                                      .obs
                                                      .value
                                                      .value[index]
                                                  : widget
                                                      .controller!
                                                      .dueInvoicesList
                                                      .obs
                                                      .value
                                                      .value[index];
                                      return Column(
                                        children: [
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            children: [
                                              CustomText(
                                                text:
                                                    '${groupInvoices.groupName}'
                                                        .toUpperCase(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall!
                                                    .copyWith(
                                                        color: ColorResource
                                                            .colorE08AF4,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Image.asset(
                                                  ImageResource.buttonArrow,
                                                  color:
                                                      ColorResource.colorE08AF4,
                                                  width: 20,
                                                  height: 10,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(1.0),
                                            margin:
                                                EdgeInsets.only(bottom: 15.0),
                                            child: Theme(
                                              data: Theme.of(context).copyWith(
                                                  unselectedWidgetColor:
                                                      Colors.grey,
                                                  disabledColor: ColorResource
                                                      .color00E94F),
                                              // child:
                                              child: invoiceWidget(
                                                  groupInvoices: (widget
                                                              .buttonNo ==
                                                          1)
                                                      ? widget
                                                          .controller!
                                                          .upcomingInvoicesList
                                                          .obs
                                                          .value
                                                          .value[index]
                                                      : (widget.buttonNo == 2)
                                                          ? widget
                                                              .controller!
                                                              .paidInvoicesList
                                                              .obs
                                                              .value
                                                              .value[index]
                                                          : widget
                                                              .controller!
                                                              .dueInvoicesList
                                                              .obs
                                                              .value
                                                              .value[index]),
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                              ])
                        ])))));
  }
}
