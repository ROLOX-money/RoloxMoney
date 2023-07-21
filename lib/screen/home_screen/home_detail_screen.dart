import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:roloxmoney/languages/app_languages.dart';
import 'package:roloxmoney/model/group_invoices_model.dart';
import 'package:roloxmoney/model/invoice_model.dart';
import 'package:roloxmoney/screen/dashboard_screen/entities/dashboard_model.dart';
import 'package:roloxmoney/screen/home_screen/home_controller.dart';
import 'package:roloxmoney/utils/app_utils.dart';
import 'package:roloxmoney/utils/color_resource.dart';
import 'package:roloxmoney/utils/image_resource.dart';
import 'package:roloxmoney/widget/custom_text.dart';
import 'package:roloxmoney/widget/rolox_money_widget.dart';
import 'package:roloxmoney/widget/secondary_button.dart';

enum InvoiceType { UPCOMING, PAID, DUE, ALL }

class HomeScreenDetail extends StatefulWidget {
  HomeController? controller;
  GlobalKey<ScaffoldState>? scaffoldKey;
  InvoiceType invoiceType;

  HomeScreenDetail(
      {Key? key,
      required this.controller,
      required this.scaffoldKey,
      required this.invoiceType})
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
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AppBar(
                          backgroundColor: Theme.of(context).backgroundColor,
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
                                  text: widget.invoiceType == InvoiceType.ALL
                                      ? '${Languages.of(context)?.allInvoices}'
                                      : widget.invoiceType ==
                                              InvoiceType.UPCOMING
                                          ? '${Languages.of(context)?.upcomingInvoices} \n '
                                          : widget.invoiceType ==
                                                  InvoiceType.PAID
                                              ? '${Languages.of(context)?.paidInvoices}'
                                              : '${Languages.of(context)?.dueInvoices}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                          color: ColorResource.colorFFFFFF,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600),
                                  children: <InlineSpan>[
                                    if (widget.invoiceType ==
                                        InvoiceType.UPCOMING)
                                      TextSpan(
                                        text:
                                            '(${Languages.of(context)?.inNext1Week})',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                                color:
                                                    ColorResource.colorA0BCD0,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
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
                          shape: Border.all(color: Colors.grey, width: 0.15),
                          leading: Container(
                            child: Image.asset(
                              ImageResource.withdrawImage,
                              height: 40,
                              width: 40,
                            ),
                          ),
                          title: CustomText(
                            text: '${Languages.of(context)?.youWalletBalance}',
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
                            itemCount: widget.invoiceType == InvoiceType.ALL
                                ? widget.controller!.invoicesList.length
                                : widget.controller!.invoicesList
                                    .where((p0) => widget.invoiceType ==
                                            InvoiceType.UPCOMING
                                        ? DateFormat("dd/MM/yyyy")
                                                .parse(p0.dueDate!)
                                                .isBefore(DateTime.now()
                                                    .add(Duration(days: 2))) &&
                                            p0.paid == false
                                        : p0.paid ==
                                            (widget.invoiceType ==
                                                InvoiceType.PAID))
                                    .length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              DashBoardInvoice invoiceModel = widget
                                          .invoiceType ==
                                      InvoiceType.ALL
                                  ? widget.controller!.invoicesList[index]
                                  : widget.controller!.invoicesList
                                      .where((p0) => widget.invoiceType ==
                                              InvoiceType.UPCOMING
                                          ? DateFormat("dd/MM/yyyy")
                                                  .parse(p0.dueDate!)
                                                  .isBefore(DateTime.now().add(
                                                      Duration(days: 2))) &&
                                              p0.paid == false
                                          : p0.paid ==
                                              (widget.invoiceType ==
                                                  InvoiceType.PAID))
                                      .toList()[index] as DashBoardInvoice;
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
                                        text: AppUtils.getInitials(
                                                invoiceModel.invoiceName)
                                            .toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                                color:
                                                    ColorResource.colorE08AF4,
                                                fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    trailing: CustomText(
                                      text: '₹ ${invoiceModel.invoiceAmount!}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                              color: ColorResource.color00E94F,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w800),
                                    ),
                                    title: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          text:
                                              'Invoice No #${invoiceModel.invoiceNumber}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                  color:
                                                      ColorResource.colorFFFFFF,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        CustomText(
                                          text: '${invoiceModel.invoiceName}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                  color:
                                                      ColorResource.colorA0BCD0,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        CustomText(
                                          text: '${invoiceModel.dueDate}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                  color:
                                                      ColorResource.colorA0BCD0,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ])
                ]),
          ),
        ),
      ),
    );
  }
}
