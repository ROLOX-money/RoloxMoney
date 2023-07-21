import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:roloxmoney/languages/app_languages.dart';
import 'package:roloxmoney/screen/home_screen/home_controller.dart';
import 'package:roloxmoney/screen/home_screen/home_detail_screen.dart';
import 'package:roloxmoney/utils/color_resource.dart';
import 'package:roloxmoney/utils/image_resource.dart';
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
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                // Account Balance
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 0.15),
                      color: ColorResource.color151515),
                  padding: EdgeInsets.all(15.0),
                  child: Theme(
                    data: Theme.of(context).copyWith(
                        unselectedWidgetColor: Colors.grey,
                        disabledColor: ColorResource.color00E94F),
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
                                      color: ColorResource.colorFFFFFF,
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
                                            color: ColorResource.color00E94F,
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
                            textColor: ColorResource.color00E94F,
                            fontSize: 20,
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
                          color: ColorResource.colorFFFFFF,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.arrow_forward,
                      color: ColorResource.colorFFFFFF,
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
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 0.15),
                      borderRadius: BorderRadius.circular(8),
                      gradient: LinearGradient(
                        colors: [
                          ColorResource.color0093FF,
                          ColorResource.color151515,
                        ],
                        stops: [0.2 / 6, 0.2 / 6],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    padding: EdgeInsets.all(15.0),
                    child: Theme(
                      data: Theme.of(context).copyWith(
                          unselectedWidgetColor: Colors.grey,
                          disabledColor: ColorResource.color00E94F),
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
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600,
                                          height: 1.5,
                                          foreground: Paint()
                                            ..shader =
                                                ColorResource.linearGradient),
                                  children: [
                                    TextSpan(
                                      text:
                                          '${Languages.of(context)?.inNext1Week}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                              color: ColorResource.colorFFFFFF,
                                              fontSize: 24,
                                              fontWeight: FontWeight.w600),
                                    )
                                  ]),
                              maxLines: 3,
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
                                        color: ColorResource.colorFFFFFF,
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
                                                .add(Duration(days: 2))) &&
                                        p0.paid == false)
                                    .length
                                    .toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        color: ColorResource.color00E94F,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                              ),
                              // SizedBox(height: 5),
                              Container(
                                height: 20,
                                width: 120,
                                child: Divider(
                                  color: ColorResource.color272727,
                                  thickness: 1.0,
                                ),
                              ),
                              CustomText(
                                text:
                                    '${Languages.of(context)?.transactionWorth}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        color: ColorResource.colorFFFFFF,
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
                                        color: ColorResource.color00E94F,
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
          )),
    );
  }

  Widget paidCardWidget(String title, {bool isPaid = true}) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 0.15),
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            colors: [
              (title == Languages.of(context)?.paid)
                  ? ColorResource.color00D1B0
                  : ColorResource.colorE08AF4,
              ColorResource.color151515,
            ],
            stops: [0.2 / 6, 0.2 / 6],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: EdgeInsets.all(8.0),
        child: Theme(
            data: Theme.of(context).copyWith(
                unselectedWidgetColor: Colors.grey,
                disabledColor: ColorResource.color00E94F),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 10),
                CustomText(
                  text: title,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                      foreground: Paint()
                        ..shader = ColorResource.linearGradient),
                ),
                SizedBox(height: 10),
                CustomText(
                  text:
                      '${Languages.of(context)?.noOf} ${Languages.of(context)?.invoices}',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: ColorResource.colorFFFFFF,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 10),
                CustomText(
                  text:
                      '${widget.controller!.invoicesList.where((p0) => p0.paid == isPaid).length}',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: ColorResource.color00E94F,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 10),
                Container(
                  height: 20,
                  width: 120,
                  child: Divider(
                    color: ColorResource.color272727,
                    thickness: 1.0,
                  ),
                ),
                SizedBox(height: 10),
                CustomText(
                  text: '${Languages.of(context)?.transactionWorth}',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: ColorResource.colorFFFFFF,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 10),
                CustomText(
                  text:
                      '₹ ${isPaid ? widget.controller!.paidTransaction.toStringAsFixed(2) : widget.controller!.dueTransaction.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: ColorResource.color00E94F,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 10),
              ],
            )));
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
