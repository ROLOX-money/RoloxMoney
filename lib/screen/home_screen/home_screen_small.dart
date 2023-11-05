import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:roloxmoney/languages/app_languages.dart';
import 'package:roloxmoney/screen/home_screen/home_controller.dart';
import 'package:roloxmoney/screen/home_screen/home_detail_screen.dart';
import 'package:roloxmoney/utils/color_resource.dart';
import 'package:roloxmoney/utils/image_resource.dart';
import 'package:roloxmoney/widget/custom_button.dart';
import 'package:roloxmoney/widget/custom_text.dart';
import 'package:roloxmoney/widget/rolox_money_widget.dart';
import 'package:roloxmoney/widget/secondary_button.dart';

enum Widgets { Upcoming, Paid, Due }

/*Chinnadurai Viswanathan*/
// ignore: must_be_immutable
class HomeScreenSmall extends StatefulWidget {
  HomeController? controller;
  GlobalKey<ScaffoldState>? scaffoldKey;

  HomeScreenSmall(
      {Key? key, required this.controller, required this.scaffoldKey})
      : super(key: key);

  @override
  HomeScreenSmallState createState() => HomeScreenSmallState();
}

class HomeScreenSmallState extends State<HomeScreenSmall> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return RoloxMoneyWidgetState(
      rxStatus: widget.controller!.status,
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            primary: true,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  // Account Balance
                  Card(
                    // decoration: BoxDecoration(
                    //     border: Border.all(color: Colors.grey, width: 0.15),
                    //     color: Colors.white),
                    // padding: EdgeInsets.all(15.0),
                    elevation: 10,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: Image.asset(
                              ImageResource.withdrawImage,
                              height: 40,
                              width: 40,
                            ),
                          ),
                          Column(
                            children: [
                              CustomText(
                                text: '${Languages.of(context)?.accountBalance}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        color: ColorResource.colorA0A1A9,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                              ),
                              // SizedBox(height: 10),
                              MediaQuery.removePadding(
                                context: context,
                                removeTop: true,
                                child: Row(
                                  children: [
                                    CustomText(
                                      text: '₹ 50000',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                              color: ColorResource.color000000,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.visibility_off,
                                          color: ColorResource.color8B8B8B,
                                        ))
                                  ],
                                ),
                              )
                            ],
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                          Container(
                            width: 130,
                            height: 40,
                            child: SecondaryButton(
                              '${Languages.of(context)!.withdraw}',
                              context,
                              backgroundColor: ColorResource.colorF5F5F5,
                              textColor: ColorResource.color0D0D0D,
                              fontSize: 16,
                              onTap: () {},
                            ),
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // All Invoices
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreenDetail(
                            controller: widget.controller,
                            scaffoldKey: widget.scaffoldKey,
                            invoiceType: InvoiceType.ALL,
                          ),
                        ),
                      );
                    },
                    child: Row(children: [
                      CustomText(
                        text: '${Languages.of(context)?.allInvoices}',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: ColorResource.color000000,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.arrow_forward,
                        color: ColorResource.color000000,
                      ),
                    ]),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreenDetail(
                                    controller: widget.controller,
                                    scaffoldKey: widget.scaffoldKey,
                                    invoiceType: InvoiceType.UPCOMING,
                                  )));
                    },
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 0.15),
                            borderRadius: BorderRadius.circular(8),
                            gradient: LinearGradient(
                              colors: [
                                ColorResource.colorEC008C,
                                ColorResource.colorFFFFFF,
                              ],
                              stops: [0.2 / 6, 0.2 / 6],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            color: ColorResource.colorFFFFFF),
                        padding: EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Flexible(
                              child: Text.rich(
                                TextSpan(
                                    text:
                                        '${Languages.of(context)?.upcoming}               ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600,
                                            height: 1.5,
                                            color: ColorResource.color000000),
                                    children: [
                                      TextSpan(
                                        text:
                                            '\n${Languages.of(context)?.inNext1Week}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                                color: ColorResource.colorA0A1A9,
                                                height: 1.5,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                      )
                                    ]),
                                maxLines: 2,
                                softWrap: true,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Column(
                              children: [
                                CustomText(
                                  text:
                                      '${Languages.of(context)?.noOf} ${Languages.of(context)?.invoices}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                          color: ColorResource.colorA0A1A9,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: 5),
                                //p0.paid == isPaid
                                CustomText(
                                  text: widget.controller!.invoicesList
                                      .where((p0) =>
                                          DateFormat("dd/MM/yyyy")
                                              .parse(p0.dueDate!)
                                              .isBefore(DateTime.now()
                                                  .add(Duration(days: 7))) &&
                                          p0.paid == false)
                                      .length
                                      .toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                          color: ColorResource.color000000,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                ),
                                // SizedBox(height: 5),
                                Container(
                                  height: 20,
                                  width: 120,
                                  child: Divider(
                                    color: ColorResource.colorA0A1A9,
                                    thickness: 0.5,
                                  ),
                                ),
                                CustomText(
                                  text:
                                      '${Languages.of(context)?.transactionWorth}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                          color: ColorResource.colorA0A1A9,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: 5),
                                CustomText(
                                  text:
                                      '₹ ${widget.controller!.upComingTransaction.toStringAsFixed(2)}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                          color: ColorResource.color000000,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                ),
                                // Divider(height: 3, thickness: 5, color:Colors.green)
                                // ColorResource.color272727)
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                          onTap: () {
                            /// fixme
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreenDetail(
                                  controller: widget.controller,
                                  scaffoldKey: widget.scaffoldKey,
                                  invoiceType: InvoiceType.PAID,
                                ),
                              ),
                            );
                          },
                          child:
                              paidCardWidget('${Languages.of(context)?.paid}')),
                      SizedBox(width: 5),
                      GestureDetector(
                          onTap: () {
                            /// fixme
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreenDetail(
                                          controller: widget.controller,
                                          scaffoldKey: widget.scaffoldKey,
                                          invoiceType: InvoiceType.DUE,
                                        )));
                          },
                          child: paidCardWidget('${Languages.of(context)?.due}',
                              isPaid: false))
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }

  Widget paidCardWidget(String title, {bool isPaid = true}) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      // shadowColor:
      //     isPaid ? ColorResource.color5AB570 : ColorResource.colorF58220,
      child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 0.15),
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
              colors: [
                (title == Languages.of(context)?.paid)
                    ? ColorResource.color5AB570
                    : ColorResource.colorF58220,
                ColorResource.colorFFFFFF,
              ],
              stops: [0.2 / 6, 0.2 / 6],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 10),
              CustomText(
                text: title,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                    color: ColorResource.color000000),
              ),
              SizedBox(height: 10),
              CustomText(
                text:
                    '${Languages.of(context)?.noOf} ${Languages.of(context)?.invoices}',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: ColorResource.colorA0A1A9,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10),
              CustomText(
                text:
                    '${widget.controller!.invoicesList.where((p0) => p0.paid == isPaid).length}',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: isPaid
                        ? ColorResource.color000000
                        : ColorResource.colorF58220,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10),
              Container(
                height: 20,
                width: 120,
                child: Divider(
                  color: ColorResource.colorA0A1A9,
                  thickness: 0.5,
                ),
              ),
              SizedBox(height: 10),
              CustomText(
                text: '${Languages.of(context)?.transactionWorth}',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: ColorResource.colorA0A1A9,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10),
              CustomText(
                text:
                    '₹ ${isPaid ? widget.controller!.paidTransaction.toStringAsFixed(2) : widget.controller!.dueTransaction.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: isPaid
                        ? ColorResource.color000000
                        : ColorResource.colorF58220,
                    fontSize: 17,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10),
            ],
          )),
    );
  }

// switch (Widgets) { // Your Enum Value which you have passed
// case InvoiceWidgets.Upcoming:
// //Your validations for password;
// break;
// case  InvoiceWidgets.Paid:
// //Your validations for email
// break;
// case InvoiceWidgets.Paid:
// //Your validations for username
// break;
// }
}
