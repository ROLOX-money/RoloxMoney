import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/languages/app_languages.dart';
import 'package:roloxmoney/screen/bank_list_screen/bank_list_controller.dart';
import 'package:roloxmoney/screen/bank_list_screen/bank_list_screen.dart';
import 'package:roloxmoney/screen/payment_screen/payment_controller.dart';
import 'package:roloxmoney/utils/app_utils.dart';
import 'package:roloxmoney/utils/color_resource.dart';
import 'package:roloxmoney/utils/image_resource.dart';
import 'package:roloxmoney/utils/widget_utils.dart';
import 'package:roloxmoney/widget/custom_button.dart';
import 'package:roloxmoney/widget/custom_text.dart';
import 'package:roloxmoney/widget/rolox_money_widget.dart';
import 'package:roloxmoney/widget/secondary_button.dart';

class PaymentScreenLarge extends StatefulWidget {
  PaymentController? controller;
  GlobalKey<ScaffoldState>? scaffoldKey;

  PaymentScreenLarge(
      {Key? key, required this.controller, required this.scaffoldKey})
      : super(key: key);

  @override
  State<PaymentScreenLarge> createState() => _PaymentScreenLargeState();
}

class _PaymentScreenLargeState extends State<PaymentScreenLarge> {
  @override
  Widget build(BuildContext context) {
    Get.put(PaymentController());
    return RoloxMoneyWidgetState(
        rxStatus: widget.controller!.status,
        child: SafeArea(
            child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: false,
            backgroundColor: ColorResource.mediumScreenAppBarBgColor,
            title: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomText(
                  text: '${Languages.of(context)?.payments}',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontSize: 20, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                Spacer(),
                SizedBox(
                  height: 40,
                  width: 150,
                  child: PrimaryButton(
                    widget.controller!.bankListController.bankList.length == 0
                        ? '${Languages.of(context)!.addBankAccount}'
                        : '${Languages.of(context)!.viewBankAccount}',
                    context,
                    borderRadius: 12,
                    onTap: () {
                      if (widget
                              .controller!.bankListController.bankList.length ==
                          0) {
                        widget.controller!.navigateAddPaymentScreen();
                      } else {
                        Get.put(BankListController());
                        Get.toNamed(BankListScreen.routeName);
                      }
                    },
                  ),
                ),
                SizedBox(width: 10),
                Container(
                    width: 150,
                    height: 40,
                    child: SecondaryButton(
                      onTap: () {},
                      "27/08/23",
                      context,
                      backgroundColor: ColorResource.dividerColor,
                      isLeading: true,
                      borderRadius: 12,
                      leadingWidget: Container(
                        height: 40,
                        width: 40,
                        child: IconButton(
                            onPressed: () {}, icon: Icon(Icons.calendar_month)),
                      ),
                    )),
                SizedBox(width: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(text: '1-8 of 20'),
                    SizedBox(width: 5),
                    // AppUtils.pageNationButton(
                    //     icon: Icons.arrow_back_ios, onPressed: () {}),
                    // SizedBox(width: 5),
                    // AppUtils.pageNationButton(
                    //     icon: Icons.arrow_forward_ios, onPressed: () {}),
                    // SizedBox(width: 5),
                    // AppUtils.pageNationButton(
                    //     icon: Icons.double_arrow_rounded, onPressed: () {}),
                  ],
                ),
              ],
            ),
            shadowColor: Colors.grey,
            elevation: 0.75,
          ),
          body: widget.controller!.projectInvoicesList.obs.value.length > 0
              ? Padding(
                  padding: const EdgeInsets.only(
                      top: 30, bottom: 60, right: 30, left: 30),
                  child: WidgetUtils.customTableWidget(
                    context: context,
                    listLength:
                        widget.controller!.projectInvoicesList.obs.value.length,
                    projectList: widget.controller!.projectInvoicesList.value,
                    isPaymentTap: true,
                  ))
              : AppUtils.emptyViewWidget(
                  context: Get.context!,
                  buttonName: Languages.of(context)!.addBankAccount,
                  contentString: "No Payment are there",
                  buttonWidth: 150,
                  imagePath: ImageResource.emptyPayment,
                  callBack: () {
                    widget.controller!.navigateAddPaymentScreen();
                  }),
        )));
  }
}
