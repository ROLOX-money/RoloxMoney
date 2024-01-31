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

/*Chinnadurai Viswanathan*/
// ignore: must_be_immutable
class AddInvoiceScreenSmall extends StatefulWidget {
  AddInvoiceController? controller;
  GlobalKey<ScaffoldState>? scaffoldKey;

  AddInvoiceScreenSmall(
      {Key? key, required this.controller, required this.scaffoldKey})
      : super(key: key);

  @override
  AddInvoiceScreenSmallState createState() => AddInvoiceScreenSmallState();
}

class AddInvoiceScreenSmallState extends State<AddInvoiceScreenSmall> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(AddInvoiceController());
    return RoloxMoneyWidgetState(
      rxStatus: widget.controller!.status,
      child: Scaffold(
        body: Container(
          alignment: Alignment.topLeft,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 1, right: 1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppBar(
                    backgroundColor: ColorResource.buttonTextColor,
                    leading: IconButton(
                      icon: Icon(
                        Icons.arrow_back_sharp,
                        size: 30,
                        // color: Colors.white,
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
                                    '${widget.controller!.invoiceDetails!.invoiceNumber}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        fontSize: 21,
                                        fontWeight: FontWeight.w600),
                              ),
                              CustomText(
                                text: widget
                                    .controller!.invoiceDetails!.invoiceAmount
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
                            text: '${Languages.of(context)?.addInvoice}',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    fontSize: 21, fontWeight: FontWeight.w600),
                          ),
                    shadowColor: Colors.grey,
                    elevation: 0.75,
                  ),
                  Form(
                    key: widget.controller!.form,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          // WidgetUtils.genericAutoCompleteTextField(
                          //   textController:
                          //       widget.controller!.projectNameController,
                          //   context: context,
                          //   hintText: Languages.of(context)?.brandNameHintText,
                          //   suggestions: widget.controller!.projectList
                          //       .map((item) => item.projectName!)
                          //       .toList(),
                          //   labelName: Languages.of(context)?.projectName,
                          //   textSubmitted: (text) {
                          //     widget.controller!
                          //         .toSetClientId(searchingText: text);
                          //   },
                          //   textChanged: (text) {
                          //     widget.controller!.toSetClientId(isClear: true);
                          //   },
                          // ),
                          if (widget.controller!.invoiceDetails != null)
                            WidgetUtils.genericTextFiled(
                              context: context,
                              validationRules: ['required'],
                              isReadOnly: true,
                              hintText: Languages.of(context)!.projectName,
                              keyBoardType: TextInputType.name,
                              controller:
                                  widget.controller!.projectNameController,
                              labelName:
                                  '${Languages.of(context)?.projectName}',
                            ),
                          if (widget.controller!.invoiceDetails == null) ...[
                            CustomText(
                              text: Languages.of(context)!.projectName,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Card(
                              key: Key("projectName"),
                              // alignment: Alignment.center,
                              child: AutoComplete.autoComplete(
                                  hintText: Languages.of(context)!.projectName,
                                  value: null,
                                  suggestionValue: widget
                                      .controller!.projectList
                                      .map((item) => item.projectName!)
                                      .toList(),
                                  onFieldSubmitted: (value) {
                                    widget.controller!
                                        .toSetClientId(searchingText: value);
                                  }),
                            )
                          ],
                          WidgetUtils.genericTextFiled(
                            context: context,
                            validationRules: ['required'],
                            hintText:
                                Languages.of(context)?.invoiceNameHintText,
                            keyBoardType: TextInputType.name,
                            controller:
                                widget.controller!.invoiceNameController,
                            labelName: '${Languages.of(context)?.invoiceName}',
                          ),
                          WidgetUtils.genericTextFiled(
                            context: context,
                            validationRules: ['required'],
                            hintText: Languages.of(context)?.invoiceNoHintText,
                            controller:
                                widget.controller!.invoiceNumberController,
                            labelName:
                                '${Languages.of(context)?.invoiceNumber}',
                          ),
                          WidgetUtils.genericTextFiled(
                            context: context,
                            validationRules: ['required'],
                            hintText: Languages.of(context)?.valueHintText,
                            keyBoardType: TextInputType.name,
                            controller: widget
                                .controller!.invoiceValueWithoutGSTController,
                            labelName:
                                '${Languages.of(context)?.invoiceValueWithoutGST}',
                          ),
                          WidgetUtils.genericTextFiled(
                            context: context,
                            hintText: "DD/MM/YYYY",
                            validationRules: ['required'],
                            controller:
                                widget.controller!.invoiceDueDateController,
                            keyBoardType: TextInputType.datetime,
                            isReadOnly: true,
                            onTab: () {
                              widget.controller!.toSelectDate();
                            },
                            suffixImagePath: ImageResource.calendarSVG,
                            labelName:
                                '${Languages.of(context)?.invoiceDueDate}',
                          ),
                          WidgetUtils.genericTextFiled(
                            context: context,
                            validationRules: ['required'],
                            hintText: Languages.of(context)?.hsnCodeHintText,
                            keyBoardType: TextInputType.phone,
                            controller: widget.controller!.hsnController,
                            labelName: '${Languages.of(context)?.hsnCode}',
                          ),
                          WidgetUtils.genericTextFiled(
                            context: context,
                            validationRules: ['required'],
                            hintText:
                                '${Languages.of(context)?.gstCharges} (Optional)',
                            keyBoardType: TextInputType.phone,
                            controller: widget.controller!.gstChargesController,
                            labelName: '${Languages.of(context)?.gstCharges}',
                          ),
                          // WidgetUtils.genericTextFiled(
                          //   context: context,
                          //   validationRules: ['required'],
                          //   hintText: Languages.of(context)?.state,
                          //   keyBoardType: TextInputType.text,
                          //   controller: widget.controller!.stateController,
                          //   labelName: '${Languages.of(context)?.state}',
                          // ),
                          const SizedBox(
                            height: 15,
                          ),
                          PrimaryButton(
                            '${Languages.of(context)!.save}',
                            context,
                            cardShape: 1,
                            isIcon: true,
                            textColor: ColorResource.colorFFFFFF,
                            fontSize: 20,
                            onTap: () {
                              if (widget.controller!.form.currentState!
                                  .validate()) {
                                if (widget.controller!.projectId != null) {
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
                ],
              ),
            ),
          ),
        ),
        backgroundColor: ColorResource.buttonTextColor,
      ),
    );
  }
}
