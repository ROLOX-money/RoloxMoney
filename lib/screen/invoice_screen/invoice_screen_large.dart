import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/languages/app_languages.dart';
import 'package:roloxmoney/screen/invoice_screen/entities/invoice_model.dart';
import 'package:roloxmoney/screen/invoice_screen/invoice_controller.dart';
import 'package:roloxmoney/utils/app_utils.dart';
import 'package:roloxmoney/utils/color_resource.dart';
import 'package:roloxmoney/utils/image_resource.dart';
import 'package:roloxmoney/utils/widget_utils.dart';
import 'package:roloxmoney/widget/custom_button.dart';
import 'package:roloxmoney/widget/custom_text.dart';
import 'package:roloxmoney/widget/rolox_money_widget.dart';
import 'package:roloxmoney/widget/secondary_button.dart';

class InvoiceScreenLarge extends StatefulWidget {
  InvoiceController? controller;
  GlobalKey<ScaffoldState>? scaffoldKey;

  InvoiceScreenLarge(
      {Key? key, required this.controller, required this.scaffoldKey})
      : super(key: key);

  @override
  State<InvoiceScreenLarge> createState() => _InvoiceScreenLargeState();
}

class _InvoiceScreenLargeState extends State<InvoiceScreenLarge> {
  @override
  Widget build(BuildContext context) {
    Get.put(InvoiceController());
    return RoloxMoneyWidgetState(
        rxStatus: widget.controller!.status,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: ColorResource.mediumScreenAppBarBgColor,
            centerTitle: false,
            title: Text.rich(
                TextSpan(
                  text: '${Languages.of(context)?.invoices} ',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                textAlign: TextAlign.center),
            actions: [
              Container(
                  height: 30,
                  width: 120,
                  padding: EdgeInsets.only(top: 8, bottom: 8),
                  child: PrimaryButton(
                    '${Languages.of(context)!.addInvoice}',
                    context,
                    borderRadius: 12,
                    onTap: () {
                      widget.controller!.navigateAddInvoiceScreen();
                    },
                  )),
              SizedBox(width: 10),
              Container(
                  width: 120,
                  height: 30,
                  padding: EdgeInsets.only(top: 8, bottom: 8),
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
                  AppUtils.pageNationButton(
                      icon: Icons.arrow_back_ios, onPressed: () {}),
                  SizedBox(width: 5),
                  AppUtils.pageNationButton(
                      icon: Icons.arrow_forward_ios, onPressed: () {}),
                  SizedBox(width: 5),
                  AppUtils.pageNationButton(
                      icon: Icons.double_arrow_rounded, onPressed: () {}),
                ],
              ),
              SizedBox(width: 20)
            ],
            shadowColor: Colors.grey,
            elevation: 0.75,
          ),
          body: widget.controller!.invoicesList.obs.value.length > 0
              ? Padding(
                  padding: const EdgeInsets.only(
                      top: 30, bottom: 60, right: 30, left: 30),
                  child: WidgetUtils.customTableWidget(
                    context: context,
                    isInvoiceTap: true,
                    listLength: widget.controller!.invoicesList.obs.value.length,
                    invoiceList: widget.controller!.invoicesList.obs.value as List<Invoice>,

                  ))
              : AppUtils.emptyViewWidget(
                  context: Get.context!,
                  buttonName: Languages.of(context)!.addInvoice,
                  contentString: "No Invoice are there",
                  imagePath: ImageResource.emptyInvoice,
                  callBack: () {
                    widget.controller!.navigateAddInvoiceScreen();
                  }),
        ));
  }
}
