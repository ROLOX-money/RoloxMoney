import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/languages/app_languages.dart';
import 'package:roloxmoney/screen/home_screen/home_controller.dart';
import 'package:roloxmoney/utils/color_resource.dart';
import 'package:roloxmoney/utils/image_resource.dart';
import 'package:roloxmoney/widget/custom_text.dart';
import 'package:roloxmoney/widget/rolox_money_widget.dart';
import 'package:roloxmoney/widget/secondary_button.dart';

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
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: widget.controller!.typeOfBusiness.value == 1
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.start,
                crossAxisAlignment: widget.controller!.typeOfBusiness.value == 1
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,
                children: [
                  if (widget.controller!.typeOfBusiness.value == 1) ...[
                    widget.controller!.paidCardWidgetLarge2(
                      context: context,
                      noOfInvoices:
                          widget.controller!.allInvoiceCount.toString(),
                      amount: widget.controller!.allInvoiceAmount.obs.value
                          .toStringAsFixed(2),
                      dueAmount: widget.controller!.dueInvoiceAmount
                          .toStringAsFixed(2),
                      dueCount: widget.controller!.dueInvoiceCount.toString(),
                      overdueAmount: widget.controller!.overDueInvoiceAmount
                          .toStringAsFixed(2),
                      overdueCount:
                          widget.controller!.overDueInvoiceCount.toString(),
                    ),
                  ],
                  if (widget.controller!.typeOfBusiness.value == 2) ...[
                    CustomText(text: '${Languages.of(context)!.allInvoices}'),
                    SizedBox(height: 20),
                    CustomText(
                      text: '${Languages.of(context)!.inboundInvoices}',
                      fontWeight: FontWeight.w100,
                      fontSize: 12,
                    ),
                    SizedBox(height: 20),
                    widget.controller!.paidCardWidgetLarge2(
                      context: context,
                      noOfInvoices:
                          widget.controller!.allInvoiceCount.toString(),
                      amount: widget.controller!.allInvoiceAmount.obs.value
                          .toStringAsFixed(2),
                      dueAmount: widget.controller!.dueInvoiceAmount
                          .toStringAsFixed(2),
                      dueCount: widget.controller!.dueInvoiceCount.toString(),
                      overdueAmount: widget.controller!.overDueInvoiceAmount
                          .toStringAsFixed(2),
                      overdueCount:
                          widget.controller!.overDueInvoiceCount.toString(),
                    ),
                    SizedBox(height: 20),
                    CustomText(
                        text: '${Languages.of(context)!.payableInvoice}'),
                    SizedBox(height: 20),
                    widget.controller!.paidCardWidgetLarge2(
                      context: context,
                      noOfInvoices: "0",
                      amount: "0",
                      dueAmount: "0",
                      dueCount: '0',
                      overdueAmount: '0',
                      overdueCount: '0',
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(right: 28),
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 300,
                          child: Card(
                            color: ColorResource.buttonTextColor,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    ImageResource.withdrawImage,
                                    height: 100,
                                    width: 100,
                                  ),
                                ),
                                SizedBox(height: 10),
                                CustomText(
                                  text:
                                      '${Languages.of(context)?.youWalletBalance}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomText(
                                      text: "₹ 50000",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w600),
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.visibility_off,
                                          color:
                                              ColorResource.eyeVisibleIconColor,
                                        ))
                                  ],
                                ),
                                SizedBox(height: 10),
                                Container(
                                  width: 150,
                                  height: 40,
                                  child: SecondaryButton(
                                      '${Languages.of(context)!.withdraw}',
                                      context,
                                      textColor: ColorResource.black,
                                      fontSize: 14, onTap: () {
                                    widget.controller!.navigateProfile(2);
                                  }),
                                ),
                              ],
                            ),
                          )),
                    )
                  ]
                ],
              ),
            )

            // GridView.count(
            //   crossAxisCount: 2,
            //   mainAxisSpacing:
            //       widget.controller!.isEmpty.value == true ? 20 : 30,
            //   crossAxisSpacing: 40,
            //   childAspectRatio:
            //       widget.controller!.isEmpty.value == true ? 1.5 : 1.65,
            //   children: [
            //     if (widget.controller!.isEmpty.value == true) ...[
            //       widget.controller!.paidCardWidgetLarge2(
            //         isWithdraw: false,
            //         isWalletBalance: true,
            //         headingString: '${Languages.of(context)!.upcomingInvoices}',
            //         topColor: ColorResource.buttonTextColor,
            //         context: context,
            //         title: '${Languages.of(context)?.noInvoices}',
            //         subTitleSecond: '${Languages.of(context)!.addInvoice}',
            //         secondaryButtonOnTap: () {
            //           widget.controller!.navigateProfile(1);
            //         },
            //       ),
            //       widget.controller!.paidCardWidgetLarge2(
            //           isWalletBalance: true,
            //           isWithdraw: true,
            //           topColor: ColorResource.buttonTextColor,
            //           context: context,
            //           title: '${Languages.of(context)?.accountBalance}',
            //           subTitleSecond: '${Languages.of(context)!.withdraw}',
            //           secondaryButtonOnTap: () {
            //             widget.controller!.navigateProfile(2);
            //           },
            //           amount: "₹ 50000"),
            //       widget.controller!.paidCardWidgetLarge2(
            //         isWalletBalance: true,
            //         isWithdraw: false,
            //         headingString: '${Languages.of(context)!.paidInvoices}',
            //         topColor: ColorResource.buttonTextColor,
            //         context: context,
            //         title: '${Languages.of(context)?.noInvoices}',
            //         subTitleSecond: '${Languages.of(context)!.addInvoice}',
            //         secondaryButtonOnTap: () {
            //           widget.controller!.navigateProfile(1);
            //         },
            //       ),
            //       widget.controller!.paidCardWidgetLarge2(
            //         isWalletBalance: true,
            //         isWithdraw: false,
            //         topColor: ColorResource.buttonTextColor,
            //         headingString: '${Languages.of(context)!.dueInvoices}',
            //         context: context,
            //         title: '${Languages.of(context)?.noInvoices}',
            //         subTitleSecond: '${Languages.of(context)!.addInvoice}',
            //         secondaryButtonOnTap: () {
            //           widget.controller!.navigateProfile(1);
            //         },
            //       )
            //     ],
            //     if (widget.controller!.isEmpty.value == false) ...[
            //       GestureDetector(
            //           onTap: () {
            //             Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                     builder: (context) => HomeDetailsScreenLarge(
            //                           controller: widget.controller,
            //                           scaffoldKey: widget.scaffoldKey,
            //                           invoiceType: InvoiceType.UPCOMING,
            //                         )));
            //           },
            //           child: widget.controller!.paidCardWidgetLarge2(
            //               isWalletBalance: false,
            //               isWithdraw: false,
            //               topColor: ColorResource.primaryColor,
            //               context: context,
            //               title:
            //                   "${Languages.of(context)!.upcomingInvoices} \n ${Languages.of(context)!.inNext1Week}",
            //               subTitle:
            //                   "${Languages.of(context)!.noOf} ${Languages.of(context)!.invoices}",
            //               count: widget.controller!.invoicesList
            //                   .where((p0) =>
            //                       DateFormat("dd/MM/yyyy")
            //                           .parse(p0.dueDate!)
            //                           .isAfter(DateTime.now()
            //                               .add(Duration(days: 7))) &&
            //                       p0.paid == false)
            //                   .length
            //                   .toString(),
            //               subTitleSecond:
            //                   Languages.of(context)!.transactionWorth,
            //               amount: "₹ 50000")),
            //       widget.controller!.paidCardWidgetLarge2(
            //           isWalletBalance: true,
            //           isWithdraw: true,
            //           topColor: ColorResource.buttonTextColor,
            //           context: context,
            //           title: Languages.of(context)!.accountBalance,
            //           subTitleSecond: Languages.of(context)!.withdraw,
            //           secondaryButtonOnTap: () {
            //             widget.controller!.navigateProfile(2);
            //           },
            //           amount: "₹ 50000"),
            //       GestureDetector(
            //         onTap: () {
            //           Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                   builder: (context) => HomeDetailsScreenLarge(
            //                         controller: widget.controller,
            //                         scaffoldKey: widget.scaffoldKey,
            //                         invoiceType: InvoiceType.PAID,
            //                       )));
            //         },
            //         child: widget.controller!.paidCardWidgetLarge2(
            //             isWalletBalance: false,
            //             isWithdraw: false,
            //             topColor: ColorResource.greenColor,
            //             context: context,
            //             title: Languages.of(context)!.paidInvoices,
            //             subTitle:
            //                 "${Languages.of(context)!.noOf} ${Languages.of(context)!.invoices}",
            //             count:
            //                 '${widget.controller!.invoicesList.where((p0) => p0.paid == true).length}',
            //             subTitleSecond: Languages.of(context)!.transactionWorth,
            //             amount: "₹ 50000"),
            //       ),
            //       GestureDetector(
            //         onTap: () {
            //           Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                   builder: (context) => HomeDetailsScreenLarge(
            //                         controller: widget.controller,
            //                         scaffoldKey: widget.scaffoldKey,
            //                         invoiceType: InvoiceType.DUE,
            //                       )));
            //         },
            //         child: widget.controller!.paidCardWidgetLarge2(
            //             isWithdraw: false,
            //             isWalletBalance: false,
            //             topColor: ColorResource.orangeColor,
            //             context: context,
            //             title: Languages.of(context)!.dueInvoices,
            //             subTitle:
            //                 "${Languages.of(context)!.noOf} ${Languages.of(context)!.invoices}",
            //             count: widget.controller!.invoicesList
            //                 .where((p0) =>
            //                     DateFormat("dd/MM/yyyy")
            //                         .parse(p0.dueDate!)
            //                         .isBefore(DateTime.now()
            //                             .add(Duration(days: 7))) &&
            //                     p0.paid == false)
            //                 .length
            //                 .toString(),
            //             subTitleSecond: Languages.of(context)!.transactionWorth,
            //             amount: "₹ 50000"),
            //       ),
            //     ]
            //   ],
            // )
            ));
  }
}
