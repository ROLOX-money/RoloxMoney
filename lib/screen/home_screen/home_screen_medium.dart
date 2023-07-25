import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/languages/app_languages.dart';
import 'package:roloxmoney/screen/home_screen/home_controller.dart';
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
            decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
            alignment: Alignment.topLeft,
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 30,
              crossAxisSpacing: 40,
              childAspectRatio: 2,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeDetailsScreenLarge(
                                    controller: widget.controller,
                                    scaffoldKey: widget.scaffoldKey,
                                    buttonNo: 1,
                                  )));
                    },
                    child: widget.controller!.paidCardWidgetLarge(
                        isWalletBalance: false,
                        topColor: ColorResource.color0093FF,
                        context: context,
                        title:
                            "${Languages.of(context)!.upcomingInvoices} \n ${Languages.of(context)!.inNext1Week}",
                        subTitle:
                            "${Languages.of(context)!.noOf} ${Languages.of(context)!.invoices}",
                        count: "07",
                        subTitleSecond: Languages.of(context)!.transactionWorth,
                        amount: "₹ 50000")),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomeDetailsScreenLarge(
                                  controller: widget.controller,
                                  scaffoldKey: widget.scaffoldKey,
                                  buttonNo: 2,
                                )));
                  },
                  child: widget.controller!.paidCardWidgetLarge(
                      isWalletBalance: true,
                      topColor: ColorResource.color151515,
                      context: context,
                      title: Languages.of(context)!.accountBalance,
                      subTitleSecond: Languages.of(context)!.withdraw,
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
                                    buttonNo: 2,
                                  )));
                    },
                    child:  widget.controller!.paidCardWidgetLarge(
                      isWalletBalance: false,
                      topColor: ColorResource.color00D1B0,
                      context: context,
                      title: Languages.of(context)!.paidInvoices,
                      subTitle:
                          "${Languages.of(context)!.noOf} ${Languages.of(context)!.invoices}",
                      count: "07",
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
                                    buttonNo: 3,
                                  )));
                    },
                    child: widget.controller!.paidCardWidgetLarge(
                      isWalletBalance: false,
                      topColor: ColorResource.colorE08AF4,
                      context: context,
                      title: Languages.of(context)!.dueInvoices,
                      subTitle:
                          "${Languages.of(context)!.noOf} ${Languages.of(context)!.invoices}",
                      count: "07",
                      subTitleSecond: Languages.of(context)!.transactionWorth,
                      amount: "₹ 50000"),
                    ),
              ],
            )));
  }
}