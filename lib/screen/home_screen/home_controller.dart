import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:roloxmoney/languages/app_languages.dart';
import 'package:roloxmoney/model/group_invoices_model.dart';
import 'package:roloxmoney/model/invoice_model.dart';
import 'package:roloxmoney/utils/color_resource.dart';
import 'package:roloxmoney/utils/image_resource.dart';
import 'package:roloxmoney/widget/custom_text.dart';
import 'package:roloxmoney/widget/secondary_button.dart';

/*Chinnadurai Viswanathan*/
class HomeController extends GetxController with StateMixin {
  RxList groupInvoicesList = [].obs;
  RxList upcomingInvoicesList = [].obs;
  RxList dueInvoicesList = [].obs;
  RxList paidInvoicesList = [].obs;

  @override
  void onInit() async {
    change(null, status: RxStatus.success());
    Future.delayed(const Duration(seconds: 5), () {});
    upcomingInvoicesList.addAll([
      GroupInvoices(
          boarderColor: ColorResource.colorE08AF4,
          groupName: Languages.of(Get.context!)!.upcomingInvoices,
          invoiceList: [
            InvoiceModel(
                amount: '25000',
                clientName: 'Target InfoTech',
                date: DateTime.now().toString(),
                workName: 'Brochure Design'),
            InvoiceModel(
                amount: '25000',
                clientName: 'Target InfoTech',
                date: DateFormat('yyyy MM dd').format(DateTime.now()),
                workName: 'Brochure Design'),
            InvoiceModel(
                amount: '25000',
                clientName: 'Target InfoTech',
                date: DateTime.now().toString(),
                workName: 'Brochure Design'),
            InvoiceModel(
                amount: '25000',
                clientName: 'Target InfoTech',
                date: DateTime.now().toString(),
                workName: 'Brochure Design'),
          ]),
    ]);
    dueInvoicesList.addAll([
      GroupInvoices(
          boarderColor: ColorResource.colorF27C6C,
          groupName: Languages.of(Get.context!)!.dueInvoices,
          invoiceList: [
            InvoiceModel(
                amount: '25000',
                clientName: 'Target InfoTech',
                date: DateTime.now().toString(),
                workName: 'Brochure Design'),
            InvoiceModel(
                amount: '25000',
                clientName: 'Target InfoTech',
                date: DateTime.now().toString(),
                workName: 'Brochure Design'),
            InvoiceModel(
                amount: '25000',
                clientName: 'Target InfoTech',
                date: DateTime.now().toString(),
                workName: 'Brochure Design'),
            InvoiceModel(
                amount: '25000',
                clientName: 'Target InfoTech',
                date: DateTime.now().toString(),
                workName: 'Brochure Design'),
          ])
    ]);
    paidInvoicesList.addAll([
      GroupInvoices(
          boarderColor: ColorResource.color4A89D1,
          groupName: Languages.of(Get.context!)!.paidInvoices,
          invoiceList: [
            InvoiceModel(
                amount: '25000',
                clientName: 'Target InfoTech',
                date: DateTime.now().toString(),
                workName: 'Brochure Design'),
            InvoiceModel(
                amount: '25000',
                clientName: 'Target InfoTech',
                date: DateTime.now().toString(),
                workName: 'Brochure Design'),
            InvoiceModel(
                amount: '25000',
                clientName: 'Target InfoTech',
                date: DateTime.now().toString(),
                workName: 'Brochure Design'),
            InvoiceModel(
                amount: '25000',
                clientName: 'Target InfoTech',
                date: DateTime.now().toString(),
                workName: 'Brochure Design'),
          ]),
    ]);
    groupInvoicesList.addAll([
      GroupInvoices(
          boarderColor: ColorResource.colorE08AF4,
          groupName: Languages.of(Get.context!)!.upcomingInvoices,
          invoiceList: [
            InvoiceModel(
                amount: '25000',
                clientName: 'Target InfoTech',
                date: DateTime.now().toString(),
                workName: 'Brochure Design'),
            InvoiceModel(
                amount: '25000',
                clientName: 'Target InfoTech',
                date: DateFormat('yyyy MM dd').format(DateTime.now()),
                workName: 'Brochure Design'),
            InvoiceModel(
                amount: '25000',
                clientName: 'Target InfoTech',
                date: DateTime.now().toString(),
                workName: 'Brochure Design'),
            InvoiceModel(
                amount: '25000',
                clientName: 'Target InfoTech',
                date: DateTime.now().toString(),
                workName: 'Brochure Design'),
          ]),
      GroupInvoices(
          boarderColor: ColorResource.colorF27C6C,
          groupName: Languages.of(Get.context!)!.dueInvoices,
          invoiceList: [
            InvoiceModel(
                amount: '25000',
                clientName: 'Target InfoTech',
                date: DateTime.now().toString(),
                workName: 'Brochure Design'),
            InvoiceModel(
                amount: '25000',
                clientName: 'Target InfoTech',
                date: DateTime.now().toString(),
                workName: 'Brochure Design'),
            InvoiceModel(
                amount: '25000',
                clientName: 'Target InfoTech',
                date: DateTime.now().toString(),
                workName: 'Brochure Design'),
            InvoiceModel(
                amount: '25000',
                clientName: 'Target InfoTech',
                date: DateTime.now().toString(),
                workName: 'Brochure Design'),
          ]),
      GroupInvoices(
          boarderColor: ColorResource.color4A89D1,
          groupName: Languages.of(Get.context!)!.paidInvoices,
          invoiceList: [
            InvoiceModel(
                amount: '25000',
                clientName: 'Target InfoTech',
                date: DateTime.now().toString(),
                workName: 'Brochure Design'),
            InvoiceModel(
                amount: '25000',
                clientName: 'Target InfoTech',
                date: DateTime.now().toString(),
                workName: 'Brochure Design'),
            InvoiceModel(
                amount: '25000',
                clientName: 'Target InfoTech',
                date: DateTime.now().toString(),
                workName: 'Brochure Design'),
            InvoiceModel(
                amount: '25000',
                clientName: 'Target InfoTech',
                date: DateTime.now().toString(),
                workName: 'Brochure Design'),
          ]),
    ]);
    change(groupInvoicesList);
    super.onInit();
  }

  Widget paidCardWidget(String title, BuildContext context) {
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
                  text: '07',
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
                  text: '₹ 50000',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: ColorResource.color00E94F,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 10),
              ],
            )));
  }

  Widget paidCardWidgetLarge(
      {String title = "",
      required BuildContext context,
      String subTitle = "",
      String count = "",
      String subTitleSecond = "",
      String amount = "",
      Color topColor = ColorResource.colorE08AF4,
      required bool isWalletBalance}) {
    return Container(
        height: MediaQuery.of(context).size.height / 3,
        width: MediaQuery.of(context).size.width / 3,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 0.15),
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            colors: [
              topColor,
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
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (isWalletBalance == false) ...[
                  SizedBox(height: 30),
                  CustomText(
                    text: title,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        height: 1.5,
                        foreground: Paint()
                          ..shader = ColorResource.linearGradient),
                  ),
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          CustomText(
                            text: subTitle,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    color: ColorResource.colorFFFFFF,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 10),
                          CustomText(
                            text: count,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    color: ColorResource.color00E94F,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                      SizedBox(width: 10),
                      Container(
                        height: 80,
                        width: 120,
                        child: VerticalDivider(
                          color: ColorResource.color272727,
                          thickness: 1.0,
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                        children: [
                          CustomText(
                            text: subTitleSecond,
                            // '${Languages.of(context)?.transactionWorth}',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    color: ColorResource.colorFFFFFF,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 10),
                          CustomText(
                            text: amount,
                            // '₹ 50000',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    color: ColorResource.color00E94F,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 10),
                        ],
                      )
                    ],
                  ),
                ],
                if (isWalletBalance == true) ...[
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      ImageResource.withdrawImage,
                      height: 40,
                      width: 40,
                    ),
                  ),
                  SizedBox(height: 20),
                  CustomText(
                    text: title,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: ColorResource.colorFFFFFF,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: amount,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
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
                  Container(
                    width: 130,
                    height: 40,
                    child: SecondaryButton(
                      subTitleSecond,
                      context,
                      textColor: ColorResource.color00E94F,
                      fontSize: 20,
                      onTap: () {},
                    ),
                  ),
                ]
              ],
            )));
  }
}
