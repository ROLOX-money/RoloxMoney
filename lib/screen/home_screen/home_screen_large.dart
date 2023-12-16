import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/languages/app_languages.dart';
import 'package:roloxmoney/screen/home_screen/home_detail_screen.dart';
import 'package:roloxmoney/utils/color_resource.dart';
import 'package:roloxmoney/widget/rolox_money_widget.dart';

import 'home_controller.dart';
import 'home_detail_screen_large.dart';

class HomeScreenLarge extends StatefulWidget {
  HomeController? controller;
  GlobalKey<ScaffoldState>? scaffoldKey;

  HomeScreenLarge(
      {Key? key, required this.controller, required this.scaffoldKey})
      : super(key: key);

  @override
  State<HomeScreenLarge> createState() => _HomeScreenLargeState();
}

class _HomeScreenLargeState extends State<HomeScreenLarge> {
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return RoloxMoneyWidgetState(
        rxStatus: widget.controller!.status,
        child: SafeArea(
          child: Scaffold(
            body: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.only(top: 30),
                decoration: BoxDecoration(color: Colors.red),
                alignment: Alignment.topLeft,
                child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 30,
                    childAspectRatio: 2.5,
                    children: [
                      if (widget.controller!.isEmpty.value == true) ...[
                        widget.controller!.paidCardWidgetLarge(
                            isWalletBalance: true,
                            isWithdraw: false,
                            topColor: ColorResource.red,
                            context: context,
                            title: "'${Languages.of(context)?.accountBalance}'",
                            subTitleSecond: "'${Languages.of(context)!.withdraw}'",
                            amount: "₹ 50000"),
                        widget.controller!.paidCardWidgetLarge(
                            isWalletBalance: true,
                            isWithdraw: true,
                            topColor: ColorResource.red,
                            context: context,
                            title: "'${Languages.of(context)?.accountBalance}'",
                            subTitleSecond:
                                "'${Languages.of(context)!.withdraw}'",
                            amount: "₹ 50000"),
                        widget.controller!.paidCardWidgetLarge(
                            isWalletBalance: true,
                            isWithdraw: false,
                            topColor: ColorResource.red,
                            context: context,
                            title: "'${Languages.of(context)?.accountBalance}'",
                            subTitleSecond:
                                "'${Languages.of(context)!.withdraw}'",
                            amount: "₹ 50000"),
                        widget.controller!.paidCardWidgetLarge(
                            isWalletBalance: true,
                            isWithdraw: false,
                            topColor: ColorResource.red,
                            context: context,
                            title: "'${Languages.of(context)?.accountBalance}'",
                            subTitleSecond: "'${Languages.of(context)!.withdraw}'",
                            amount: "₹ 50000")
                      ],
                      if (widget.controller!.isEmpty.value == false) ...[
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        HomeDetailsScreenLarge(
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
                                  "'${Languages.of(context)?.upcomingInvoices} ${Languages.of(context)?.inNext1Week}'",
                              subTitle:
                                  "${Languages.of(context)?.noOf} ${Languages.of(context)?.invoices}",
                              count: "07",
                              subTitleSecond:
                                  "${Languages.of(context)?.transactionWorth}",
                              amount: "₹ 50000"),
                        ),
                        widget.controller!.paidCardWidgetLarge(
                            isWalletBalance: true,
                            isWithdraw: true,
                            topColor: ColorResource.red,
                            context: context,
                            title: '${Languages.of(context)?.accountBalance}',
                            subTitleSecond:
                                '${Languages.of(context)!.withdraw}',
                            amount: "₹ 50000"),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        HomeDetailsScreenLarge(
                                          controller: widget.controller,
                                          scaffoldKey: widget.scaffoldKey,
                                          invoiceType: InvoiceType.PAID,
                                        )));
                          },
                          child: widget.controller!.paidCardWidgetLarge(
                              isWalletBalance: false,
                              isWithdraw: false,
                              topColor: ColorResource.red,
                              context: context,
                              title: "${Languages.of(context)?.paidInvoices}",
                              subTitle: "${Languages.of(context)?.noOf} ${Languages.of(context)?.invoices}",
                              count: "07",
                              subTitleSecond: "${Languages.of(context)?.transactionWorth}",
                              amount: "₹ 50000"),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        HomeDetailsScreenLarge(
                                          controller: widget.controller,
                                          scaffoldKey: widget.scaffoldKey,
                                          invoiceType: InvoiceType.DUE,
                                        )));
                          },
                          child: widget.controller!.paidCardWidgetLarge(
                              isWalletBalance: false,
                              isWithdraw: false,
                              topColor: ColorResource.red,
                              context: context,
                              title: "${Languages.of(context)?.dueInvoices}}",
                              subTitle:
                                  "${Languages.of(context)?.noOf} ${Languages.of(context)?.invoices}",
                              count: "07",
                              subTitleSecond:
                                  "${Languages.of(context)?.transactionWorth}",
                              amount: "₹ 50000"),
                        ),
                      ],
                    ])),
          ),
        ));
  }
}
