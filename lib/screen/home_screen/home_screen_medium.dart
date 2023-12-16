import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:roloxmoney/languages/app_languages.dart';
import 'package:roloxmoney/screen/home_screen/home_controller.dart';
import 'package:roloxmoney/screen/home_screen/home_detail_screen.dart';
import 'package:roloxmoney/screen/home_screen/home_detail_screen_large.dart';
import 'package:roloxmoney/utils/color_resource.dart';
import 'package:roloxmoney/widget/rolox_money_widget.dart';

class HomeScreenMedium extends StatefulWidget {
  HomeController? controller;
  GlobalKey<ScaffoldState>? scaffoldKey;

  HomeScreenMedium(
      {Key? key, required this.controller, required this.scaffoldKey})
      : super(key: key);

  @override
  State<HomeScreenMedium> createState() => _HomeScreenMediumState();
}

class _HomeScreenMediumState extends State<HomeScreenMedium> {
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return RoloxMoneyWidgetState(
        rxStatus: widget.controller!.status,
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
            ),
            alignment: Alignment.topLeft,
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing:
                  widget.controller!.isEmpty.value == true ? 20 : 30,
              crossAxisSpacing: 40,
              childAspectRatio:
                  widget.controller!.isEmpty.value == true ? 1.5 : 1.65,
              children: [
                if (widget.controller!.isEmpty.value == true) ...[
                  widget.controller!.paidCardWidgetLarge(
                    isWithdraw: false,
                    isWalletBalance: true,
                    headingString: '${Languages.of(context)!.upcomingInvoices}',
                    topColor: ColorResource.buttonTextColor,
                    context: context,
                    title: '${Languages.of(context)?.noInvoices}',
                    subTitleSecond: '${Languages.of(context)!.addInvoice}',
                    secondaryButtonOnTap: () {
                      widget.controller!.navigateProfile(1);
                    },
                  ),
                  widget.controller!.paidCardWidgetLarge(
                      isWalletBalance: true,
                      isWithdraw: true,
                      topColor: ColorResource.buttonTextColor,
                      context: context,
                      title: '${Languages.of(context)?.accountBalance}',
                      subTitleSecond: '${Languages.of(context)!.withdraw}',
                      secondaryButtonOnTap: () {
                        widget.controller!.navigateProfile(2);
                      },
                      amount: "₹ 50000"),
                  widget.controller!.paidCardWidgetLarge(
                    isWalletBalance: true,
                    isWithdraw: false,
                    headingString: '${Languages.of(context)!.paidInvoices}',
                    topColor: ColorResource.buttonTextColor,
                    context: context,
                    title: '${Languages.of(context)?.noInvoices}',
                    subTitleSecond: '${Languages.of(context)!.addInvoice}',
                    secondaryButtonOnTap: () {
                      widget.controller!.navigateProfile(1);
                    },
                  ),
                  widget.controller!.paidCardWidgetLarge(
                    isWalletBalance: true,
                    isWithdraw: false,
                    topColor: ColorResource.buttonTextColor,
                    headingString: '${Languages.of(context)!.dueInvoices}',
                    context: context,
                    title: '${Languages.of(context)?.noInvoices}',
                    subTitleSecond: '${Languages.of(context)!.addInvoice}',
                    secondaryButtonOnTap: () {
                      widget.controller!.navigateProfile(1);
                    },
                  )
                ],
                if (widget.controller!.isEmpty.value == false) ...[
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeDetailsScreenLarge(
                                      controller: widget.controller,
                                      scaffoldKey: widget.scaffoldKey,
                                      invoiceType: InvoiceType.UPCOMING,
                                    )));
                      },
                      child: widget.controller!.paidCardWidgetLarge(
                          isWalletBalance: false,
                          isWithdraw: false,
                          topColor: ColorResource.primaryColor,
                          context: context,
                          title:
                              "${Languages.of(context)!.upcomingInvoices} \n ${Languages.of(context)!.inNext1Week}",
                          subTitle:
                              "${Languages.of(context)!.noOf} ${Languages.of(context)!.invoices}",
                          count: widget.controller!.invoicesList
                              .where((p0) =>
                                  DateFormat("dd/MM/yyyy")
                                      .parse(p0.dueDate!)
                                      .isAfter(DateTime.now()
                                          .add(Duration(days: 7))) &&
                                  p0.paid == false)
                              .length
                              .toString(),
                          subTitleSecond:
                              Languages.of(context)!.transactionWorth,
                          amount: "₹ 50000")),
                  widget.controller!.paidCardWidgetLarge(
                      isWalletBalance: true,
                      isWithdraw: true,
                      topColor: ColorResource.buttonTextColor,
                      context: context,
                      title: Languages.of(context)!.accountBalance,
                      subTitleSecond: Languages.of(context)!.withdraw,
                      secondaryButtonOnTap: () {
                        widget.controller!.navigateProfile(2);
                      },
                      amount: "₹ 50000"),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeDetailsScreenLarge(
                                    controller: widget.controller,
                                    scaffoldKey: widget.scaffoldKey,
                                    invoiceType: InvoiceType.PAID,
                                  )));
                    },
                    child: widget.controller!.paidCardWidgetLarge(
                        isWalletBalance: false,
                        isWithdraw: false,
                        topColor: ColorResource.greenColor,
                        context: context,
                        title: Languages.of(context)!.paidInvoices,
                        subTitle:
                            "${Languages.of(context)!.noOf} ${Languages.of(context)!.invoices}",
                        count:
                            '${widget.controller!.invoicesList.where((p0) => p0.paid == true).length}',
                        subTitleSecond: Languages.of(context)!.transactionWorth,
                        amount: "₹ 50000"),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeDetailsScreenLarge(
                                    controller: widget.controller,
                                    scaffoldKey: widget.scaffoldKey,
                                    invoiceType: InvoiceType.DUE,
                                  )));
                    },
                    child: widget.controller!.paidCardWidgetLarge(
                        isWithdraw: false,
                        isWalletBalance: false,
                        topColor: ColorResource.orangeColor,
                        context: context,
                        title: Languages.of(context)!.dueInvoices,
                        subTitle:
                            "${Languages.of(context)!.noOf} ${Languages.of(context)!.invoices}",
                        count: widget.controller!.invoicesList
                            .where((p0) =>
                                DateFormat("dd/MM/yyyy")
                                    .parse(p0.dueDate!)
                                    .isBefore(DateTime.now()
                                        .add(Duration(days: 7))) &&
                                p0.paid == false)
                            .length
                            .toString(),
                        subTitleSecond: Languages.of(context)!.transactionWorth,
                        amount: "₹ 50000"),
                  ),
                ]
              ],
            )));
  }
}
