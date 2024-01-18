import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/languages/app_languages.dart';
import 'package:roloxmoney/screen/home_screen/home_controller.dart';
import 'package:roloxmoney/screen/home_screen/home_detail_screen.dart';
import 'package:roloxmoney/screen/home_screen/invoice_view.dart';
import 'package:roloxmoney/utils/color_resource.dart';
import 'package:roloxmoney/widget/custom_text.dart';
import 'package:roloxmoney/widget/rolox_money_widget.dart';

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
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: CustomText(
                      text: '${Languages.of(context)?.inboundInvoices}',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: ColorResource.color000000,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: invoiceView(
                      context: context,
                      controller: widget.controller!,
                      scaffoldKey: widget.scaffoldKey,
                      isSmallView: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: CustomText(
                      text: '${Languages.of(context)?.payableInvoice}',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: ColorResource.color000000,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: invoiceView(
                        context: context,
                        isInboundView: false,
                        controller: widget.controller!,
                        scaffoldKey: widget.scaffoldKey,
                        isSmallView: true),
                  ),
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
