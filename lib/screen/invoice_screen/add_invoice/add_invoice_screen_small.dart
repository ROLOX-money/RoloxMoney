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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBar(
                  backgroundColor: Theme.of(context).backgroundColor,
                  leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back_sharp,
                      size: 30,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  centerTitle: true,
                  title: CustomText(
                    text: '${Languages.of(context)?.addInvoice}',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: ColorResource.colorFFFFFF,
                        fontSize: 21,
                        fontWeight: FontWeight.w600),
                  ),
                  shadowColor: Colors.grey,
                  elevation: 0.75,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      WidgetUtils.genericTextFiled(
                        context: context,
                        keyBoardType: TextInputType.name,
                        controller: widget.controller!.invoiceNameController,
                        labelName: '${Languages.of(context)?.invoiceName}'
                            .toUpperCase(),
                      ),
                      WidgetUtils.genericTextFiled(
                        context: context,
                        controller: widget.controller!.invoiceNumberController,
                        labelName: '${Languages.of(context)?.invoiceNumber}'
                            .toUpperCase(),
                      ),
                      WidgetUtils.genericTextFiled(
                        context: context,
                        keyBoardType: TextInputType.name,
                        controller:
                            widget.controller!.invoiceValueWithoutGSTController,
                        labelName:
                            '${Languages.of(context)?.invoiceValueWithoutGST}'
                                .toUpperCase(),
                      ),
                      WidgetUtils.genericTextFiled(
                        context: context,
                        controller: widget.controller!.projectNameController,
                        keyBoardType: TextInputType.emailAddress,
                        suffixImagePath: ImageResource.searchSVG,
                        labelName: '${Languages.of(context)?.projectName}'
                            .toUpperCase(),
                      ),
                      WidgetUtils.genericTextFiled(
                        context: context,
                        controller: widget.controller!.invoiceDueDateController,
                        keyBoardType: TextInputType.emailAddress,
                        suffixImagePath: ImageResource.calendarSVG,
                        labelName: '${Languages.of(context)?.projectDueDate}'
                            .toUpperCase(),
                      ),
                      WidgetUtils.genericTextFiled(
                        context: context,
                        keyBoardType: TextInputType.phone,
                        controller: widget.controller!.gstChargesController,
                        labelName:
                            '${Languages.of(context)?.hsnCode}'.toUpperCase(),
                      ),
                      WidgetUtils.genericTextFiled(
                        context: context,
                        keyBoardType: TextInputType.phone,
                        controller: widget.controller!.gstChargesController,
                        labelName: '${Languages.of(context)?.gstCharges}'
                            .toUpperCase(),
                      ),
                      WidgetUtils.genericTextFiled(
                        context: context,
                        keyBoardType: TextInputType.phone,
                        controller: widget.controller!.stateController,
                        labelName:
                            '${Languages.of(context)?.state}'.toUpperCase(),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      PrimaryButton(
                        '${Languages.of(context)!.save}',
                        context,
                        cardShape: 1,
                        isIcon: true,
                        textColor: ColorResource.black,
                        fontSize: 20,
                        onTap: () {
                          Get.back();
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
