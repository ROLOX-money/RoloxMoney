import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/languages/app_languages.dart';
import 'package:roloxmoney/screen/invoice_screen/add_invoice/add_invoice_controller.dart';
import 'package:roloxmoney/utils/color_resource.dart';
import 'package:roloxmoney/utils/image_resource.dart';
import 'package:roloxmoney/utils/widget_utils.dart';
import 'package:roloxmoney/widget/custom_button.dart';
import 'package:roloxmoney/widget/custom_text.dart';
import 'package:roloxmoney/widget/rolox_money_widget.dart';

class AddInvoiceScreenLarge extends StatefulWidget {
  AddInvoiceController? controller;
  GlobalKey<ScaffoldState>? scaffoldKey;

  AddInvoiceScreenLarge(
      {Key? key, required this.controller, required this.scaffoldKey})
      : super(key: key);

  @override
  State<AddInvoiceScreenLarge> createState() => _AddInvoiceScreenLargeState();
}

class _AddInvoiceScreenLargeState extends State<AddInvoiceScreenLarge> {
  @override
  Widget build(BuildContext context) {
    Get.put(AddInvoiceController());
    return RoloxMoneyWidgetState(
        rxStatus: widget.controller!.status,
        child: SafeArea(
            child: Scaffold(
                backgroundColor: Theme.of(context).backgroundColor,
                appBar: AppBar(
                    centerTitle: false,
                    backgroundColor: Colors.transparent,
                    title: Container(
                      padding: const EdgeInsets.only(left: 8.0, top: 20),
                      child: Image.asset(
                        ImageResource.rolox,
                        height: 30,
                      ),
                    ),
                    automaticallyImplyLeading: false,
                    shadowColor: Colors.grey,
                    elevation: 0.0),
                body: Center(
                    child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: MediaQuery.of(context).size.height / 1.2,
                        padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                        decoration: BoxDecoration(
                            color: ColorResource.buttonTextColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(24))),
                        alignment: Alignment.topLeft,
                        child: ListView(children: [
                          AppBar(
                            backgroundColor: ColorResource.buttonTextColor,
                            toolbarHeight: 80,
                            leading: IconButton(
                              icon: Icon(
                                Icons.arrow_back_sharp,
                                size: 30,
                              ),
                              onPressed: () {
                                Get.back();
                              },
                            ),
                            centerTitle: false,
                            title: CustomText(
                              text: '${Languages.of(context)?.addInvoice}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      fontSize: 21,
                                      fontWeight: FontWeight.w600),
                            ),
                            shadowColor: Colors.grey,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(24),
                                    topRight: Radius.circular(24))),
                          ),
                          Form(
                            key: widget.controller!.form,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 16, right: 16, bottom: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  WidgetUtils.genericTextFiled(
                                    height: 50,
                                    context: context,
                                    validationRules: ['required'],
                                    hintText: Languages.of(context)
                                        ?.invoiceNameHintText,
                                    keyBoardType: TextInputType.name,
                                    controller: widget
                                        .controller!.invoiceNameController,
                                    labelName:
                                        '${Languages.of(context)?.invoiceName}',
                                  ),
                                  WidgetUtils.genericTextFiled(
                                    height: 50,
                                    context: context,
                                    validationRules: ['required'],
                                    hintText: Languages.of(context)
                                        ?.invoiceNoHintText,
                                    controller: widget
                                        .controller!.invoiceNumberController,
                                    labelName:
                                        '${Languages.of(context)?.invoiceNumber}',
                                  ),
                                  WidgetUtils.genericTextFiled(
                                    height: 50,
                                    context: context,
                                    validationRules: ['required'],
                                    hintText:
                                        Languages.of(context)?.valueHintText,
                                    keyBoardType: TextInputType.name,
                                    controller: widget.controller!
                                        .invoiceValueWithoutGSTController,
                                    labelName:
                                        '${Languages.of(context)?.invoiceValueWithoutGST}',
                                  ),
                                  WidgetUtils.genericTextFiled(
                                    height: 50,
                                    context: context,
                                    validationRules: ['required'],
                                    hintText: Languages.of(context)
                                        ?.brandNameHintText,
                                    controller: widget
                                        .controller!.projectNameController,
                                    keyBoardType: TextInputType.emailAddress,
                                    suffixImagePath: ImageResource.searchSVG,
                                    labelName:
                                        '${Languages.of(context)?.projectName}',
                                  ),
                                  WidgetUtils.genericTextFiled(
                                    height: 50,
                                    context: context,
                                    hintText: "DD/MM/YYYY",
                                    validationRules: ['required'],
                                    controller: widget
                                        .controller!.invoiceDueDateController,
                                    keyBoardType: TextInputType.emailAddress,
                                    suffixImagePath: ImageResource.calendarSVG,
                                    labelName:
                                        '${Languages.of(context)?.invoiceDueDate}',
                                  ),
                                  WidgetUtils.genericTextFiled(
                                    height: 50,
                                    context: context,
                                    validationRules: ['required'],
                                    hintText:
                                        Languages.of(context)?.hsnCodeHintText,
                                    keyBoardType: TextInputType.phone,
                                    controller:
                                        widget.controller!.hsnController,
                                    labelName:
                                        '${Languages.of(context)?.hsnCode}',
                                  ),
                                  WidgetUtils.genericTextFiled(
                                    height: 50,
                                    context: context,
                                    validationRules: ['required'],
                                    hintText: Languages.of(context)?.gstCharges,
                                    keyBoardType: TextInputType.phone,
                                    controller:
                                        widget.controller!.gstChargesController,
                                    labelName:
                                        '${Languages.of(context)?.gstCharges}',
                                  ),

                                  const SizedBox(
                                    height: 15,
                                  ),
                                  PrimaryButton(
                                    '${Languages.of(context)!.paid}',
                                    context,
                                    cardShape: 1,
                                    isIcon: true,
                                    fontSize: 20,
                                    onTap: () {
                                      if (widget.controller!.form.currentState!
                                          .validate()) {
                                        Get.back();
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]))))));
  }
}
