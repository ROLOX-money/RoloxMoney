import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/languages/app_languages.dart';
import 'package:roloxmoney/screen/invoice_screen/add_invoice/add_invoice_controller.dart';
import 'package:roloxmoney/utils/app_utils.dart';
import 'package:roloxmoney/utils/auto_complete.dart';
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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
                            centerTitle: true,
                            title: widget.controller!.invoiceDetails != null
                                ? Column(
                                    children: [
                                      CustomText(
                                        text:
                                            '${widget.controller!.invoiceDetails!.invoiceName}'
                                            ' #'
                                            '${widget.controller!.invoiceDetails!.invoiceNumber}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                                fontSize: 21,
                                                fontWeight: FontWeight.w600),
                                      ),
                                      CustomText(
                                        text: widget.controller!.invoiceDetails!
                                            .invoiceValueWithoutGst
                                            .toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                                fontSize: 21,
                                                fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  )
                                : CustomText(
                                    text:
                                        '${Languages.of(context)?.addInvoice}',
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
                                  // project Name
                                  if (widget.controller!.invoiceDetails ==
                                      null) ...[
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    CustomText(
                                      text: Languages.of(context)!.projectName,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                              fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Card(
                                      key: Key("projectName"),
                                      // alignment: Alignment.center,
                                      child: AutoComplete.autoComplete(
                                          hintText: Languages.of(context)!
                                              .projectName,
                                          value: null,
                                          width: 830,
                                          suggestionValue: widget
                                              .controller!.projectList
                                              .map((item) => item.projectName!)
                                              .toList(),
                                          onFieldSubmitted: (value) {
                                            widget.controller!.toSetClientId(
                                                searchingText: value);
                                          }),
                                    )
                                  ],
                                  if (widget.controller!.invoiceDetails != null)
                                    WidgetUtils.genericTextFiled(
                                      context: context,
                                      validationRules: ['required'],
                                      isReadOnly:
                                          widget.controller!.isReadOnly.value,
                                      hintText:
                                          Languages.of(context)!.projectName,
                                      keyBoardType: TextInputType.name,
                                      controller: widget
                                          .controller!.projectNameController,
                                      labelName:
                                          '${Languages.of(context)?.projectName}',
                                    ),
                                  // invoice Name
                                  WidgetUtils.genericTextFiled(
                                    height: 50,
                                    context: context,
                                    isReadOnly:
                                        widget.controller!.isReadOnly.value,
                                    validationRules: ['required'],
                                    hintText: Languages.of(context)
                                        ?.invoiceNameHintText,
                                    keyBoardType: TextInputType.name,
                                    controller: widget
                                        .controller!.invoiceNameController,
                                    labelName:
                                        '${Languages.of(context)?.invoiceName}',
                                  ),
                                  // invoice No
                                  WidgetUtils.genericTextFiled(
                                    height: 50,
                                    context: context,
                                    validationRules: ['required'],
                                    isReadOnly:
                                        widget.controller!.isReadOnly.value,
                                    hintText: Languages.of(context)
                                        ?.invoiceNoHintText,
                                    controller: widget
                                        .controller!.invoiceNumberController,
                                    labelName:
                                        '${Languages.of(context)?.invoiceNumber}',
                                  ),
                                  // invoice amount
                                  WidgetUtils.genericTextFiled(
                                    height: 50,
                                    context: context,
                                    validationRules: ['required'],
                                    isReadOnly:
                                        widget.controller!.isReadOnly.value,
                                    hintText:
                                        Languages.of(context)?.valueHintText,
                                    keyBoardType: TextInputType.name,
                                    controller: widget.controller!
                                        .invoiceValueWithoutGSTController,
                                    labelName:
                                        '${Languages.of(context)?.invoiceValueWithoutGST}',
                                  ),

                                  // Due Date

//                                   WidgetUtils.genericTextFiled(
//                                     height: 50,
//                                     context: context,
//                                     validationRules: ['required'],
//                                     hintText: Languages.of(context)?.gstCharges,
//                                     keyBoardType: TextInputType.phone,
//                                     controller:
//                                         widget.controller!.gstChargesController,
//                                     labelName:
//                                         '${Languages.of(context)?.gstCharges}',
//                                   ),
//                                   WidgetUtils.genericTextFiled(
//                                     height: 50,
//                                     context: context,
//                                     validationRules: ['required'],
//                                     hintText: Languages.of(context)
//                                         ?.brandNameHintText,
//                                     controller: widget
//                                         .controller!.projectNameController,
//                                     keyBoardType: TextInputType.emailAddress,
//                                     suffixImagePath: ImageResource.searchSVG,
//                                     labelName:
//                                         '${Languages.of(context)?.projectName}',
//                                   ),
                                  WidgetUtils.genericTextFiled(
                                    height: 50,
                                    context: context,
                                    hintText: "DD/MM/YYYY",
                                    validationRules: ['required'],
                                    isReadOnly:
                                        widget.controller!.isReadOnly.value,
                                    controller: widget
                                        .controller!.invoiceDueDateController,
                                    keyBoardType: TextInputType.emailAddress,
                                    suffixImagePath: ImageResource.calendarSVG,
                                    labelName:
                                        '${Languages.of(context)?.invoiceDueDate}',
                                  ),
                                  // HSN value
                                  WidgetUtils.genericTextFiled(
                                    height: 50,
                                    context: context,
                                    validationRules: ['required'],
                                    isReadOnly:
                                        widget.controller!.isReadOnly.value,
                                    hintText:
                                        Languages.of(context)?.hsnCodeHintText,
                                    keyBoardType: TextInputType.phone,
                                    controller:
                                        widget.controller!.hsnController,
                                    labelName:
                                        '${Languages.of(context)?.hsnCode}',
                                  ),

                                  // gst charge
//                                   WidgetUtils.genericTextFiled(
//                                     height: 50,
//                                     context: context,
//                                     validationRules: ['required'],
//                                     isReadOnly:
//                                         widget.controller!.isReadOnly.value,
//                                     hintText: Languages.of(context)?.gstCharges,
//                                     keyBoardType: TextInputType.phone,
//                                     controller:
//                                         widget.controller!.gstChargesController,
//                                     labelName:
//                                         '${Languages.of(context)?.gstCharges}',
//                                   ),


                                  const SizedBox(
                                    height: 15,
                                  ),
                                  PrimaryButton(
                                    (widget.controller!.invoiceDetails != null)
                                        ? '${Languages.of(context)!.paid}'
                                        : '${Languages.of(context)!.save}',
                                    context,
                                    cardShape: 1,
                                    isIcon: true,
                                    fontSize: 20,
                                    onTap: () {
                                      if (widget.controller!.form.currentState!
                                          .validate()) {
                                        if (widget.controller!.projectId !=
                                            null) {
                                          widget.controller!.toAddInvoice();
                                        } else {
                                          AppUtils.showErrorSnackBar(context,
                                              'Please select at least one project ',
                                              durations: 2000);
                                        }
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
