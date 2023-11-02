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

class AddBankAccountScreenLarge extends StatefulWidget {
  AddBankAccountController? controller;
  GlobalKey<ScaffoldState>? scaffoldKey;

  AddBankAccountScreenLarge(
      {Key? key, required this.controller, required this.scaffoldKey})
      : super(key: key);

  @override
  State<AddBankAccountScreenLarge> createState() =>
      _AddBankAccountScreenLargeState();
}

class _AddBankAccountScreenLargeState extends State<AddBankAccountScreenLarge> {
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
                        color: Colors.black,
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
                          SizedBox(height: 20),
                          AppBar(
                              backgroundColor: ColorResource.buttonTextColor,
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
                                text:
                                    '${Languages.of(context)?.addBankAccount}',
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
                                      topRight: Radius.circular(24)))),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Form(
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
                                          ?.accountNoHintText,
                                      keyBoardType: TextInputType.name,
                                      controller: widget.controller!
                                          .bankAccountNumberController,
                                      labelName:
                                          '${Languages.of(context)?.bankAccountNumber}',
                                    ),
                                    WidgetUtils.genericTextFiled(
                                      height: 50,
                                      context: context,
                                      validationRules: ['required'],
                                      hintText: Languages.of(context)
                                          ?.accountHolderName,
                                      controller: widget.controller!
                                          .accountHolderNameController,
                                      labelName:
                                          '${Languages.of(context)?.accountHolderName}',
                                    ),
                                    WidgetUtils.genericTextFiled(
                                      height: 50,
                                      context: context,
                                      validationRules: ['required'],
                                      hintText: Languages.of(context)
                                          ?.accountIfscHintText,
                                      keyBoardType: TextInputType.name,
                                      controller: widget
                                          .controller!.bankIFSCCodeController,
                                      labelName:
                                          '${Languages.of(context)?.bankIFSCCode}',
                                    ),
                                    WidgetUtils.genericTextFiled(
                                      height: 50,
                                      context: context,
                                      validationRules: ['required'],
                                      hintText: Languages.of(context)
                                          ?.brandNameHintText,
                                      controller:
                                          widget.controller!.branchNameController,
                                      keyBoardType: TextInputType.emailAddress,
                                      labelName:
                                          '${Languages.of(context)?.branchName}',
                                    ),
                                    WidgetUtils.genericTextFiled(
                                      height: 50,
                                      context: context,
                                      validationRules: ['required'],
                                      hintText:
                                          '${Languages.of(context)?.enter} ${Languages.of(context)?.cityName}',
                                      controller:
                                          widget.controller!.cityNameController,
                                      keyBoardType: TextInputType.emailAddress,
                                      labelName:
                                          '${Languages.of(context)?.cityName}',
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    PrimaryButton(
                                      '${Languages.of(context)!.save}',
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
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ]))))));
  }
}
