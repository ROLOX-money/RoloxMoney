import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:roloxmoney/languages/app_languages.dart';
import 'package:roloxmoney/model/group_invoices_model.dart';
import 'package:roloxmoney/model/invoice_model.dart';
import 'package:roloxmoney/network/get_connect.dart';
import 'package:roloxmoney/screen/invoice_screen/add_invoice/add_invoice_controller.dart';
import 'package:roloxmoney/screen/invoice_screen/add_invoice/add_invoice_screen.dart';
import 'package:roloxmoney/screen/invoice_screen/entities/invoice_model.dart';
import 'package:roloxmoney/screen/withdraw_fund_screen/withdraw_controller.dart';
import 'package:roloxmoney/screen/withdraw_fund_screen/withdraw_fund_screen.dart';
import 'package:roloxmoney/utils/color_resource.dart';
import 'package:roloxmoney/utils/image_resource.dart';
import 'package:roloxmoney/widget/custom_text.dart';
import 'package:roloxmoney/widget/secondary_button.dart';
import 'package:roloxmoney/screen/dashboard_screen/entities/dashboard_model.dart';
import 'package:roloxmoney/singleton.dart';
import 'package:roloxmoney/utils/RoloxKey.dart';

/*Chinnadurai Viswanathan*/
class HomeController extends GetxController with StateMixin {
  RxList invoicesList = [].obs;
  RxDouble paidTransaction = 0.0.obs;
  RxDouble dueTransaction = 0.0.obs;
  RxDouble upComingTransaction = 0.0.obs;
  RxList groupInvoicesList = [].obs;
  RxList upcomingInvoicesList = [].obs;
  RxList dueInvoicesList = [].obs;
  RxList paidInvoicesList = [].obs;
  RxList<InvoiceModel> upcomingInvoicesListLargeScreen = <InvoiceModel>[].obs;
  RxList<InvoiceModel> dueInvoicesListLargeScreen = <InvoiceModel>[].obs;
  RxList<InvoiceModel> paidInvoicesListLargeScreen = <InvoiceModel>[].obs;
  RxList<bool> isSelected = <bool>[].obs;
  RxBool isEmpty = true.obs;
  RxInt buttonNo = 0.obs;

  WithdrawFundController withdrawFundController =
      Get.put(WithdrawFundController());

  @override
  void onInit() async {
    change(null, status: RxStatus.success());
    Future.delayed(const Duration(seconds: 2), () {
      isEmpty.value = false;
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

      upcomingInvoicesListLargeScreen.addAll([
        InvoiceModel(
            amount: '25000',
            clientName: 'Target InfoTech',
            date: DateTime.now().toString(),
            workName: 'Brochure Design'),
        InvoiceModel(
            amount: '25000',
            clientName: 'Hyundai Corporation',
            date: DateTime.now().toString(),
            workName: 'Brochure Design'),
        InvoiceModel(
            amount: '25000',
            clientName: 'Target InfoTech',
            date: DateTime.now().toString(),
            workName: 'Brochure Design'),
        InvoiceModel(
            amount: '25000',
            clientName: 'Hyundai Corporation',
            date: DateTime.now().toString(),
            workName: 'Brochure Design'),
        InvoiceModel(
            amount: '25000',
            clientName: 'Target InfoTech',
            date: DateTime.now().toString(),
            workName: 'Brochure Design'),
        InvoiceModel(
            amount: '25000',
            clientName: 'Hyundai Corporation',
            date: DateTime.now().toString(),
            workName: 'Brochure Design'),
        InvoiceModel(
            amount: '25000',
            clientName: 'Target InfoTech',
            date: DateTime.now().toString(),
            workName: 'Brochure Design'),
        InvoiceModel(
            amount: '25000',
            clientName: 'Hyundai Corporation',
            date: DateTime.now().toString(),
            workName: 'Brochure Design'),
      ]);
      dueInvoicesListLargeScreen.addAll([
        InvoiceModel(
            amount: '25000',
            clientName: 'Target InfoTech',
            date: DateTime.now().toString(),
            workName: 'Brochure Design'),
        InvoiceModel(
            amount: '25000',
            clientName: 'Hyundai Corporation',
            date: DateTime.now().toString(),
            workName: 'Brochure Design'),
        InvoiceModel(
            amount: '25000',
            clientName: 'Target InfoTech',
            date: DateTime.now().toString(),
            workName: 'Brochure Design'),
        InvoiceModel(
            amount: '25000',
            clientName: 'Hyundai Corporation',
            date: DateTime.now().toString(),
            workName: 'Brochure Design'),
      ]);
      paidInvoicesListLargeScreen.addAll([
        InvoiceModel(
            amount: '25000',
            clientName: 'Target InfoTech',
            date: DateTime.now().toString(),
            workName: 'Brochure Design'),
        InvoiceModel(
            amount: '25000',
            clientName: 'Hyundai Corporation',
            date: DateTime.now().toString(),
            workName: 'Brochure Design'),
        InvoiceModel(
            amount: '25000',
            clientName: 'Target InfoTech',
            date: DateTime.now().toString(),
            workName: 'Brochure Design'),
        InvoiceModel(
            amount: '25000',
            clientName: 'Hyundai Corporation',
            date: DateTime.now().toString(),
            workName: 'Brochure Design'),
      ]);

      change(groupInvoicesList);
    });
    // toGetTheInvoiceList();
    super.onInit();
  }

  toGetTheInvoiceList() async {
    change(null, status: RxStatus.loading());
    try {
      await Singleton.supabaseInstance.client
          .from(RoloxKey.supaBaseUserToInvoiceTable)
          .select('''
    userid,
    ${RoloxKey.supaBaseInvoiceTable}!inner (
      *
    )
  ''')
          .eq('userid', Singleton.mobileUserId)
          .then((value) {
            value.forEach((element) {
              invoicesList.add(
                DashBoardInvoice(
                    invoiceAmount: element['invoice']['invoiceValueWithoutGst'],
                    invoiceNumber: element['invoice']['invoiceNumber'],
                    invoiceName: element['invoice']['invoiceName'],
                    paid: element['invoice']['paid'],
                    dueDate: element['invoice']['InvoiceDueDate']),
              );
            });
          });

      invoicesList.obs.value.toList().forEach((element) {
        DashBoardInvoice dashBoardInvoice = element as DashBoardInvoice;

        if (dashBoardInvoice.paid!) {
          paidTransaction.value =
              paidTransaction.value + dashBoardInvoice.invoiceAmount!;
        } else {
          dueTransaction.value =
              dueTransaction.value + dashBoardInvoice.invoiceAmount!;
        }
        if (DateFormat("dd/MM/yyyy").parse(dashBoardInvoice.dueDate!).isBefore(
                  DateTime.now().add(
                    Duration(days: 7),
                  ),
                ) &&
            element.paid == false) {
          upComingTransaction.value =
              upComingTransaction.value + dashBoardInvoice.invoiceAmount!;
        } else {}
      });
      change(upComingTransaction);
      change(paidTransaction);
      change(dueTransaction);
      change(null, status: RxStatus.success());
    } catch (e) {
      e.printError();
      return [];
    }
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
      String headingString = "",
      required Color topColor,
      required bool isWalletBalance,
      required bool isWithdraw,
      void Function()? secondaryButtonOnTap}) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      if (isEmpty.value == true)
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: headingString),
              SizedBox(width: 10),
              if (headingString != "") ...[
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Image.asset(
                    ImageResource.buttonArrow,
                    width: 20,
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: CustomText(
                    text: '${Languages.of(context)!.viewMore}',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                        ),
                    onTap: () {},
                  ),
                )
              ]
            ],
          ),
        ),
      Container(
          height: MediaQuery.of(context).size.height / 2.8,
          width: MediaQuery.of(context).size.width / 3,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 0.15),
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
              colors: [
                topColor,
                ColorResource.buttonTextColor,
              ],
              stops: [0.2 / 6, 0.2 / 6],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          padding: EdgeInsets.zero,
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
                    // SizedBox(height: 10),
                    CustomText(
                      text: title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            height: 1.5,
                          ),
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
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                            ),
                            SizedBox(height: 10),
                            CustomText(
                              text: count,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      fontSize: 24,
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
                            color: ColorResource.cardDividerColor,
                            thickness: 1.0,
                          ),
                        ),
                        SizedBox(width: 10),
                        Column(
                          children: [
                            CustomText(
                              text: subTitleSecond,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                            ),
                            SizedBox(height: 10),
                            CustomText(
                              text: amount,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 10),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 30),
                  ],
                  if (isWalletBalance == true) ...[
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        isWithdraw
                            ? ImageResource.withdrawImage
                            : ImageResource.noInvoice,
                        height: 100,
                        width: 100,
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomText(
                      text: title,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    if (amount != "")
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            text: amount,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    fontSize: 24, fontWeight: FontWeight.w600),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.visibility_off,
                                color: ColorResource.eyeVisibleIconColor,
                              ))
                        ],
                      ),
                    SizedBox(height: 20),
                    Container(
                      width: 150,
                      height: 40,
                      child: SecondaryButton(
                        subTitleSecond,
                        context,
                        textColor: ColorResource.black,
                        fontSize: 14,
                        onTap: secondaryButtonOnTap,
                      ),
                    ),
                  ],
                ],
              )))
    ]);
  }

  void navigateProfile(int buttonNo) {
    if (buttonNo == 2) {
      Get.put(WithdrawFundController());
      Get.toNamed(WithdrawFundScreen.routeName);
    } else {
      Get.put(AddInvoiceController());
      Get.toNamed(AddInvoiceScreen.routeName);
    }
  }
}
