import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/languages/app_languages.dart';
import 'package:roloxmoney/screen/invoice_screen/entities/invoice_model.dart';
import 'package:roloxmoney/utils/app_utils.dart';
import 'package:roloxmoney/utils/color_resource.dart';
import 'package:roloxmoney/utils/image_resource.dart';
import 'package:roloxmoney/widget/custom_button.dart';
import 'package:roloxmoney/widget/custom_text.dart';
import 'package:roloxmoney/widget/rolox_money_widget.dart';
import 'package:roloxmoney/widget/secondary_button.dart';

import 'invoice_controller.dart';

/*Chinnadurai Viswanathan*/
// ignore: must_be_immutable
class InvoiceScreenSmall extends StatefulWidget {
  InvoiceController? controller;
  GlobalKey<ScaffoldState>? scaffoldKey;

  InvoiceScreenSmall(
      {Key? key, required this.controller, required this.scaffoldKey})
      : super(key: key);

  @override
  InvoiceScreenSmallState createState() => InvoiceScreenSmallState();
}

class InvoiceScreenSmallState extends State<InvoiceScreenSmall> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(InvoiceController());
    return RoloxMoneyWidgetState(
      rxStatus: widget.controller!.status,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: ListView(
            physics: ScrollPhysics(),
            children: [
              SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  widget.controller!.invoicesList.obs.value.length > 0
                      ? Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: '${Languages.of(context)!.invoiceDetails}'
                                    .toUpperCase(),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        color: ColorResource.color000000,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                              ),
                              Container(
                                width: 110,
                                height: 40,
                                child: PrimaryButton(
                                  '${Languages.of(context)!.addInvoice}',
                                  context,
                                  fontWeight: FontWeight.w500,
                                  textColor: ColorResource.colorFFFFFF,
                                  fontSize: 14,
                                  onTap: () {
                                    widget.controller!
                                        .navigateAddInvoiceScreen();
                                  },
                                ),
                              )
                            ],
                          ),
                        )
                      : SizedBox(),
                  SizedBox(
                    height: 15,
                  ),
                  widget.controller!.invoicesList.obs.value.length > 0
                      ? ListView.separated(
                          separatorBuilder: (BuildContext context, int index) =>
                              Divider(
                                  height: 1,
                                  color: Theme.of(context).dividerColor),
                          itemCount:
                              widget.controller!.invoicesList.obs.value.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            Invoice invoice = widget
                                .controller!.invoicesList.obs.value[index];
                            return Container(
                              color: ColorResource.colorFFFFFF,
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.symmetric(vertical: 15),
                              child: ListTile(
                                leading: Container(
                                  height: 40,
                                  width: 40,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                    color: ColorResource.initialBgColor,
                                  ),
                                  child: CustomText(
                                    text: AppUtils.getInitials(
                                            invoice.invoiceName)
                                        .toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                            color:
                                                ColorResource.initialTextColor,
                                            fontWeight: FontWeight.w700),
                                  ),
                                ),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text.rich(
                                      TextSpan(
                                          text: invoice.invoiceName ?? '',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                  color: ColorResource
                                                      .textSecondaryColor,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600),
                                          children: <InlineSpan>[
                                            TextSpan(
                                              text:
                                                  ' #${invoice.invoiceNumber}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall!
                                                  .copyWith(
                                                      color: ColorResource
                                                          .textSecondaryColor,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500),
                                            )
                                          ]),
                                      maxLines: 2,
                                      softWrap: true,
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    CustomText(
                                      text:
                                          '${invoice.invoiceValueWithoutGst!.toStringAsFixed(2) ?? ''}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                              color: ColorResource.textColor,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        CustomText(
                                          text: invoice.projectName ?? "",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          height: 5,
                                          width: 5,
                                          decoration: BoxDecoration(
                                            color: ColorResource.colorA0A1A9,
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(40.0),
                                                bottomRight:
                                                    Radius.circular(40.0),
                                                topLeft: Radius.circular(40.0),
                                                bottomLeft:
                                                    Radius.circular(40.0)),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        CustomText(
                                          text: '${invoice.invoiceDueDate}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                  color: ColorResource
                                                      .hintTextColor,
                                                  overflow: TextOverflow.fade,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: 110,
                                      height: 40,
                                      child: SecondaryButton(
                                        '${Languages.of(context)!.viewMore}',
                                        context,
                                        backgroundColor:
                                            ColorResource.colorF5F5F5,
                                        textColor: ColorResource.textColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        onTap: () {
                                          print("invoice pass arguments");
                                          print("invoice arguments  : $index");
                                          widget.controller!
                                              .navigateAddInvoiceScreen(
                                                  arguments: index);
                                          // Get.toNamed(PDFScreen.routeName);
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          })
                      : AppUtils.emptyViewWidget(
                          context: Get.context!,
                          buttonName: Languages.of(context)!.addInvoice,
                          contentString: "No Invoice are there",
                          imagePath: ImageResource.emptyInvoice,
                          callBack: () {
                            widget.controller!.navigateAddInvoiceScreen();
                          }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
