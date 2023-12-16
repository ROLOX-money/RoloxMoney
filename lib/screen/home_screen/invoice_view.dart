import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:roloxmoney/languages/app_languages.dart';
import 'package:roloxmoney/screen/home_screen/home_controller.dart';
import 'package:roloxmoney/screen/home_screen/home_detail_screen.dart';
import 'package:roloxmoney/utils/color_resource.dart';
import 'package:roloxmoney/widget/custom_text.dart';

Widget invoiceView(
    {required BuildContext context,
    required GetxController controller,
    required GlobalKey<ScaffoldState>? scaffoldKey,
    bool isInboundView = true}) {
  return Column(
    children: [
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreenDetail(
                controller: controller as HomeController,
                scaffoldKey: scaffoldKey,
                invoiceType: InvoiceType.UPCOMING,
              ),
            ),
          );
        },
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  ColorResource.colorEC008C,
                  ColorResource.colorFFFFFF,
                ],
                stops: [0.2 / 8, 0.01],
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      CustomText(
                        text:
                            '${Languages.of(context)?.noOf} ${Languages.of(context)?.invoices}',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            height: 1.5,
                            color: ColorResource.colorA0A1A9),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(8.0),
                        margin: EdgeInsets.only(top: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          color: ColorResource.primaryColor.withOpacity(0.2),
                        ),
                        child: CustomText(
                          text: '17',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  height: 1.5,
                                  color: ColorResource.primaryColor),
                        ),
                      )
                    ],
                    crossAxisAlignment: CrossAxisAlignment.center,
                  ),
                ),
                Container(
                  height: 80,
                  width: 1,
                  color: ColorResource.colorA0A1A9,
                ),
                Expanded(
                  child: Column(
                    children: [
                      CustomText(
                        text: '${Languages.of(context)?.transactionWorth}',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            height: 1.5,
                            color: ColorResource.colorA0A1A9),
                      ),

                      SizedBox(height: 25),
                      CustomText(
                        text:
                            '₹ ${(controller as HomeController).upComingTransaction.toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: ColorResource.color000000,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      // Divider(height: 3, thickness: 5, color:Colors.green)
                      // ColorResource.color272727)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreenDetail(
                    controller: controller,
                    scaffoldKey: scaffoldKey,
                    invoiceType: InvoiceType.UPCOMING,
                  ),
                ),
              );
            },
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      ColorResource.orangeColor,
                      ColorResource.colorFFFFFF,
                    ],
                    stops: [0.42 / 8, 0.01],
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: ColorResource.orangeColor.withOpacity(0.2),
                          ),
                          child: CustomText(
                            text: '17',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                    height: 1.5,
                                    color: ColorResource.orangeColor),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CustomText(
                          text: '${Languages.of(context)?.due}',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  height: 1.5,
                                  color: ColorResource.color000000),
                        ),
                      ],
                    ),
                    Container(
                      height: 0.5,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      width: MediaQuery.of(context).size.width / 2.75,
                      color: ColorResource.colorA0A1A9,
                    ),
                    Column(
                      children: [
                        CustomText(
                          text: '${Languages.of(context)?.netAmount}',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  height: 1.5,
                                  color: ColorResource.colorA0A1A9),
                        ),
                        SizedBox(height: 5),
                        CustomText(
                          text:
                              '₹ ${(controller).upComingTransaction.toStringAsFixed(2)}',
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
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreenDetail(
                    controller: controller,
                    scaffoldKey: scaffoldKey,
                    invoiceType: InvoiceType.UPCOMING,
                  ),
                ),
              );
            },
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      ColorResource.colorB12424,
                      ColorResource.colorFFFFFF,
                    ],
                    stops: [0.42 / 8, 0.01],
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: ColorResource.colorB12424.withOpacity(0.2),
                          ),
                          child: CustomText(
                            text: '17',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                    height: 1.5,
                                    color: ColorResource.colorB12424),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CustomText(
                          text: '${Languages.of(context)?.overDue}',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  height: 1.5,
                                  color: ColorResource.color000000),
                        ),
                      ],
                    ),
                    Container(
                      height: 0.5,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      width: MediaQuery.of(context).size.width / 2.75,
                      color: ColorResource.colorA0A1A9,
                    ),
                    Column(
                      children: [
                        CustomText(
                          text: '${Languages.of(context)?.netAmount}',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  height: 1.5,
                                  color: ColorResource.colorA0A1A9),
                        ),
                        SizedBox(height: 5),
                        CustomText(
                          text:
                              '₹ ${(controller).upComingTransaction.toStringAsFixed(2)}',
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
        ],
      ),
    ],
  );
}
