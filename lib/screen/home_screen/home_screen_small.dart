import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/languages/app_languages.dart';
import 'package:roloxmoney/model/group_invoices_model.dart';
import 'package:roloxmoney/model/invoice_model.dart';
import 'package:roloxmoney/screen/home_screen/home_controller.dart';
import 'package:roloxmoney/screen/home_screen/home_detail_screen.dart';
import 'package:roloxmoney/utils/app_utils.dart';
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
                Row(children: [
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
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    /// fixme
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomeScreenDetail(
                                  controller: widget.controller,
                                  scaffoldKey: widget.scaffoldKey,
                                  buttonNo: 1,
                                )));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 0.15),
                        color: ColorResource.color151515),
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
                              maxLines: 2,
                              softWrap: true,
                              textAlign: TextAlign.center,
                            ),
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
                              CustomText(
                                text: '07',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        color: ColorResource.color00E94F,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                              ),
                              // SizedBox(height: 5),
                              Divider(
                                thickness: 1,
                                color: Colors.white,
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
                                text: '₹ 50000',
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
                        onTap: (){
                          /// fixme
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreenDetail(
                                    controller: widget.controller,
                                    scaffoldKey: widget.scaffoldKey,
                                    buttonNo: 2,
                                  )));
                        },
                        child: paidCardWidget('${Languages.of(context)?.paid}')),
                    GestureDetector(
                        onTap: (){
                          /// fixme
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreenDetail(
                                    controller: widget.controller,
                                    scaffoldKey: widget.scaffoldKey,
                                    buttonNo: 3,
                                  )));
                        },
                        child: paidCardWidget('${Languages.of(context)?.due}'))
                  ],
                )
              ],
            ),
          )),
    );
  }

  Widget paidCardWidget(String title) {
    return ClipRRect(
      child: Stack(children: [
        Container(
          color: ColorResource.color0093FF,
          height: 100,
          width: 100,
        ),
        Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 0.15),
                color: ColorResource.color151515),
            padding: EdgeInsets.all(8.0),
            child: Theme(
                data: Theme.of(context).copyWith(
                    unselectedWidgetColor: Colors.grey,
                    disabledColor: ColorResource.color00E94F),
                child: Column(
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
                      text: '07',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: ColorResource.color00E94F,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 10),
                    Divider(
                      color: Colors.white,
                    ),
                    CustomText(
                      text: '${Languages.of(context)?.transactionWorth}',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: ColorResource.colorFFFFFF,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 10),
                    CustomText(
                      text: '₹ 50000',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: ColorResource.color00E94F,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 10),
                  ],
                ))),
      ]),
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
