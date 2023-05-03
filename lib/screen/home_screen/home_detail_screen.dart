import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/languages/app_languages.dart';
import 'package:roloxmoney/model/group_invoices_model.dart';
import 'package:roloxmoney/model/invoice_model.dart';
import 'package:roloxmoney/screen/home_screen/home_controller.dart';
import 'package:roloxmoney/utils/app_utils.dart';
import 'package:roloxmoney/utils/color_resource.dart';
import 'package:roloxmoney/utils/image_resource.dart';
import 'package:roloxmoney/widget/custom_text.dart';
import 'package:roloxmoney/widget/rolox_money_widget.dart';
import 'package:roloxmoney/widget/secondary_button.dart';

class HomeScreenDetail extends StatefulWidget {
  HomeController? controller;
  GlobalKey<ScaffoldState>? scaffoldKey;
  int? buttonNo;

  HomeScreenDetail(
      {Key? key,
      required this.controller,
      required this.scaffoldKey,
      required this.buttonNo})
      : super(key: key);

  @override
  State<HomeScreenDetail> createState() => _HomeScreenDetailState();
}

class _HomeScreenDetailState extends State<HomeScreenDetail> {
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
                    child: ListView(
                        shrinkWrap: true,
                        // physics: NeverScrollableScrollPhysics(),
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                AppBar(
                                  backgroundColor:
                                      Theme.of(context).backgroundColor,
                                  leading: GestureDetector(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Icon(
                                      Icons.arrow_back_sharp,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                  centerTitle: true,
                                  title: Text.rich(
                                      TextSpan(
                                          text: (widget.buttonNo == 1)
                                              ? '${Languages.of(context)?.upcomingInvoices} \n '
                                              : (widget.buttonNo == 2)
                                                  ? '${Languages.of(context)?.paidInvoices}'
                                                  : '${Languages.of(context)?.dueInvoices}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                  color:
                                                      ColorResource.colorFFFFFF,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600),
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
                                                            FontWeight.w600),
                                              )
                                          ]),
                                      textAlign: TextAlign.center),
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

Widget invoiceWidget({required GroupInvoices groupInvoices}) {
  return ListView.builder(
      // separatorBuilder: (BuildContext context, int index) =>
      //     Divider(height: 1, color: ColorResource.colorA0BCD0),
      itemCount: groupInvoices.invoiceList!.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        InvoiceModel invoiceModel = groupInvoices.invoiceList![index];
        return Card(
          color: ColorResource.color151515,
          child: Container(
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
                  color: ColorResource.color381D4E,
                ),
                child: CustomText(
                  text:
                      AppUtils.getInitials(invoiceModel.clientName).toString(),
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: ColorResource.colorE08AF4,
                      fontWeight: FontWeight.w700),
                ),
              ),
              trailing: CustomText(
                text: '₹ ${invoiceModel.amount!}',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: ColorResource.color00E94F,
                    fontSize: 16,
                    fontWeight: FontWeight.w800),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: '${invoiceModel.clientName}',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: ColorResource.colorFFFFFF,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CustomText(
                    text: '${invoiceModel.workName}',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: ColorResource.colorA0BCD0,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CustomText(
                    text: '${invoiceModel.date}',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: ColorResource.colorA0BCD0,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
