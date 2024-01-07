import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:roloxmoney/languages/app_languages.dart';
import 'package:roloxmoney/screen/home_screen/home_detail_screen.dart';
import 'package:roloxmoney/screen/invoice_screen/entities/invoice_model.dart';
import 'package:roloxmoney/utils/app_utils.dart';
import 'package:roloxmoney/utils/color_resource.dart';
import 'package:roloxmoney/utils/image_resource.dart';
import 'package:roloxmoney/utils/widget_utils.dart';
import 'package:roloxmoney/widget/custom_text.dart';
import 'package:roloxmoney/widget/rolox_money_widget.dart';

import 'home_controller.dart';

class HomeDetailsScreenLarge extends StatefulWidget {
  HomeController? controller;
  GlobalKey<ScaffoldState>? scaffoldKey;
  InvoiceType invoiceType;

  HomeDetailsScreenLarge(
      {Key? key,
      required this.controller,
      required this.scaffoldKey,
      required this.invoiceType})
      : super(key: key);

  @override
  State<HomeDetailsScreenLarge> createState() => _HomeDetailsScreenLargeState();
}

class _HomeDetailsScreenLargeState extends State<HomeDetailsScreenLarge> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return RoloxMoneyWidgetState(
        rxStatus: widget.controller!.status,
        child: SafeArea(
            child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  backgroundColor: ColorResource.mediumScreenAppBarBgColor,
                  centerTitle: false,
                  title: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text.rich(
                          TextSpan(
                              text: (widget.invoiceType == InvoiceType.UPCOMING)
                                  ? '${Languages.of(context)?.upcomingInvoices} '
                                  : (widget.invoiceType == InvoiceType.PAID)
                                      ? '${Languages.of(context)?.paidInvoices}'
                                      : '${Languages.of(context)?.dueInvoices}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                              children: <InlineSpan>[
                                if ((widget.invoiceType ==
                                    InvoiceType.UPCOMING))
                                  TextSpan(
                                    text:
                                        '(${Languages.of(context)?.inNext1Week})',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                            color: ColorResource
                                                .textSecondaryColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                  )
                              ]),
                          textAlign: TextAlign.center),
                      Spacer(),
                      Padding(
                          padding: EdgeInsets.only(right: 70),
                          child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  color: ColorResource.buttonTextColor,
                                  borderRadius: BorderRadius.circular(8)),
                              padding: EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    child: Image.asset(
                                      ImageResource.withdrawImage,
                                      height: 30,
                                      width: 30,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "Transaction worth :",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "₹ 5000",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                  )
                                ],
                              ))),
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
                              icon: Icons.double_arrow_rounded,
                              onPressed: () {}),
                        ],
                      ),
                      SizedBox(width: 20)
                    ],
                  ),
                  shadowColor: Colors.grey,
                  elevation: 0.75,
                ),
                body: Padding(
                    padding: const EdgeInsets.only(
                        top: 30, bottom: 60, right: 30, left: 30),
                    child: WidgetUtils.customTableWidget(
                      context: context,
                      isHomeTap: true,
                      listLength: widget.controller!.invoicesList
                          .where((p0) =>
                              widget.invoiceType == InvoiceType.UPCOMING
                                  ? DateFormat("dd/MM/yyyy")
                                          .parse(p0.dueDate!)
                                          .isBefore(DateTime.now()
                                              .add(Duration(days: 2))) &&
                                      p0.paid == false
                                  : p0.paid ==
                                      (widget.invoiceType == InvoiceType.PAID))
                          .length,
                      invoiceList: widget.controller!.invoicesList
                          .where((p0) =>
                              widget.invoiceType == InvoiceType.UPCOMING
                                  ? DateFormat("dd/MM/yyyy")
                                          .parse(p0.dueDate!)
                                          .isBefore(DateTime.now()
                                              .add(Duration(days: 2))) &&
                                      p0.paid == false
                                  : p0.paid ==
                                      (widget.invoiceType == InvoiceType.PAID))
                          .toList() as List<Invoice>,
                    )))));
  }
}
