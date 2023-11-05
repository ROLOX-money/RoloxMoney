import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/languages/app_languages.dart';
import 'package:roloxmoney/screen/invoice_screen/add_invoice/add_invoice_controller.dart';
import 'package:roloxmoney/screen/payment_screen/add_bank_account/add_bank_account_controller.dart';
import 'package:roloxmoney/utils/color_resource.dart';
import 'package:roloxmoney/utils/image_resource.dart';
import 'package:roloxmoney/utils/widget_utils.dart';
import 'package:roloxmoney/widget/custom_button.dart';
import 'package:roloxmoney/widget/custom_text.dart';
import 'package:roloxmoney/widget/rolox_money_widget.dart';

/*Chinnadurai Viswanathan*/
// ignore: must_be_immutable
class AddBankAccountScreenSmall extends StatefulWidget {
  AddBankAccountController? controller;
  GlobalKey<ScaffoldState>? scaffoldKey;

  AddBankAccountScreenSmall(
      {Key? key, required this.controller, required this.scaffoldKey})
      : super(key: key);

  @override
  AddBankAccountScreenSmallState createState() =>
      AddBankAccountScreenSmallState();
}

class AddBankAccountScreenSmallState extends State<AddBankAccountScreenSmall> {
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
                  backgroundColor: Theme.of(context)
                      .appBarTheme
                      .copyWith(backgroundColor: ColorResource.colorFFFFFF)
                      .backgroundColor,
                  leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back_sharp,
                      size: 30,
                      color: ColorResource.color000000,
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  centerTitle: true,
                  title: CustomText(
                    text: '${Languages.of(context)?.addBankAccount}',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: ColorResource.color000000,
                        fontSize: 19,
                        fontWeight: FontWeight.w600),
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
                        SizedBox(height: 10),
                        WidgetUtils.genericTextFiled(
                          context: context,
                          validationRules: ['required'],
                          hintText: Languages.of(context)?.accountNoHintText,
                          keyBoardType: TextInputType.name,
                          controller:
                              widget.controller!.bankAccountNumberController,
                          labelName:
                              '${Languages.of(context)?.bankAccountNumber}',
                        ),
                        WidgetUtils.genericTextFiled(
                          context: context,
                          validationRules: ['required'],
                          hintText: Languages.of(context)?.accountHolderName,
                          controller:
                              widget.controller!.accountHolderNameController,
                          labelName:
                              '${Languages.of(context)?.accountHolderName}',
                        ),
                        WidgetUtils.genericTextFiled(
                          context: context,
                          validationRules: ['required'],
                          hintText: Languages.of(context)?.accountIfscHintText,
                          keyBoardType: TextInputType.name,
                          controller: widget.controller!.bankIFSCCodeController,
                          labelName: '${Languages.of(context)?.bankIFSCCode}',
                        ),
                        WidgetUtils.genericTextFiled(
                          context: context,
                          validationRules: ['required'],
                          hintText: Languages.of(context)?.brandNameHintText,
                          controller: widget.controller!.branchNameController,
                          keyBoardType: TextInputType.emailAddress,
                          labelName: '${Languages.of(context)?.branchName}',
                        ),
                        WidgetUtils.genericTextFiled(
                          context: context,
                          validationRules: ['required'],
                          hintText:
                              '${Languages.of(context)?.enter} ${Languages.of(context)?.cityName}',
                          controller: widget.controller!.cityNameController,
                          keyBoardType: TextInputType.emailAddress,
                          labelName: '${Languages.of(context)?.cityName}'
                              .toUpperCase(),
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
                            if (widget.controller!.form.currentState!
                                .validate()) {
                              Get.back();
                            }
                          },
                        )
                      ],
                    ),
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
