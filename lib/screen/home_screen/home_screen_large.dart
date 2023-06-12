import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/languages/app_languages.dart';
import 'package:roloxmoney/utils/color_resource.dart';
import 'package:roloxmoney/widget/custom_text.dart';
import 'package:roloxmoney/widget/rolox_money_widget.dart';

import 'home_controller.dart';

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
                appBar: AppBar(
                  centerTitle: false,
                  backgroundColor: Theme.of(context).backgroundColor,
                  title: CustomText(
                    text: '${Languages.of(context)?.rolox}',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: ColorResource.colorFFFFFF,
                        fontSize: 34,
                        fontWeight: FontWeight.w900),
                  ),
                  shadowColor: Colors.grey,
                  elevation: 0.75,
                ),
                body: Center(
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        padding: EdgeInsets.only(top: 30),
                        decoration: BoxDecoration(
                            color: Theme.of(context).backgroundColor),
                        alignment: Alignment.topLeft,
                        child: GridView.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 30,
                          crossAxisSpacing: 30,
                          childAspectRatio: 2.5,
                          children: [
                            widget.controller!.paidCardWidgetLarge(
                              isWalletBalance: false,
                              topColor: ColorResource.color0093FF,
                                context: context,
                                title:
                                    "${Languages.of(context)?.upcomingInvoices} \n ${Languages.of(context)?.inNext1Week}",
                                subTitle:
                                    "${Languages.of(context)?.noOf} ${Languages.of(context)?.invoices}",
                                count: "07",
                                subTitleSecond:
                                    "${Languages.of(context)?.transactionWorth}",
                                amount: "₹ 50000"),
                            widget.controller!.paidCardWidgetLarge(
                              isWalletBalance: true,
                                topColor: ColorResource.color151515,
                                context: context,
                                title:
                                    "'${Languages.of(context)?.accountBalance}",
                                subTitleSecond:
                                    "'${Languages.of(context)!.withdraw}'",
                                amount: "₹ 50000"),
                            widget.controller!.paidCardWidgetLarge(
                              isWalletBalance: false,
                              topColor: ColorResource.color00D1B0,
                                context: context,
                                title:
                                    "${Languages.of(context)?.paidInvoices}",
                                subTitle:
                                    "${Languages.of(context)?.noOf} ${Languages.of(context)?.invoices}",
                                count: "07",
                                subTitleSecond:
                                    "${Languages.of(context)?.transactionWorth}",
                                amount: "₹ 50000"),
                            widget.controller!.paidCardWidgetLarge(
                              isWalletBalance: false,
                              topColor: ColorResource.colorE08AF4,
                                context: context,
                                title:
                                    "${Languages.of(context)?.dueInvoices}}",
                                subTitle:
                                    "${Languages.of(context)?.noOf} ${Languages.of(context)?.invoices}",
                                count: "07",
                                subTitleSecond:
                                    "${Languages.of(context)?.transactionWorth}",
                                amount: "₹ 50000"),
                          ],
                        ))))));
  }
}
