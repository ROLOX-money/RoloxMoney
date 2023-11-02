import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/languages/app_languages.dart';
import 'package:roloxmoney/screen/withdraw_fund_screen/withdraw_controller.dart';
import 'package:roloxmoney/utils/color_resource.dart';
import 'package:roloxmoney/utils/image_resource.dart';
import 'package:roloxmoney/utils/widget_utils.dart';
import 'package:roloxmoney/widget/custom_button.dart';
import 'package:roloxmoney/widget/rolox_money_widget.dart';

class WithdrawFundScreenLarge extends StatefulWidget {
  WithdrawFundController? controller;
  GlobalKey<ScaffoldState>? scaffoldKey;

  WithdrawFundScreenLarge(
      {Key? key, required this.controller, required this.scaffoldKey})
      : super(key: key);

  @override
  WithdrawFundScreenLargeState createState() => WithdrawFundScreenLargeState();
}

class WithdrawFundScreenLargeState extends State<WithdrawFundScreenLarge> {
  @override
  Widget build(BuildContext context) {
    return RoloxMoneyWidgetState(
        rxStatus: widget.controller!.status,
        child: Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            appBar: AppBar(
                centerTitle: false,
                backgroundColor: Colors.transparent,
                title: Container(
                  padding: const EdgeInsets.only(left: 8.0, top: 20),
                  child: Image.asset(
                    ImageResource.rolox,
                    color: Colors.black,
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
              decoration: BoxDecoration(
                  color: ColorResource.buttonTextColor,
                  borderRadius: BorderRadius.all(Radius.circular(24))),
              alignment: Alignment.topLeft,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                children: [
                  SizedBox(height: 20),
                  AppBar(
                    backgroundColor: ColorResource.buttonTextColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24))),
                    leading: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back_sharp,
                        size: 30,
                      ),
                    ),
                    centerTitle: false,
                    title: Text.rich(TextSpan(
                      text:
                          '${Languages.of(context)?.withdraw}  ${Languages.of(context)?.funds}',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontSize: 20, fontWeight: FontWeight.w600),
                    )),
                    shadowColor: Colors.grey,
                    elevation: 0.0,
                  ),
                  SizedBox(height: 70),
                  Image(
                    image: AssetImage(
                      ImageResource.withDrawFunds,
                    ),
                    height: 226,
                    width: 232,
                  ),
                  SizedBox(height: 40),
                  Form(
                    key: widget.controller!.form,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Withdraw Fund
                          WidgetUtils.genericTextFiled(
                            height: 50,
                            context: context,
                            validationRules: ['required'],
                            keyBoardType: TextInputType.number,
                            hintText: Languages.of(context)?.withdrawFundsHint,
                            controller:
                                widget.controller!.withdrawAmountController,
                            labelName:
                                '${Languages.of(context)?.withdrawalAmount}',
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
                                widget.controller!
                                    .otpAlertDialogue(context: context);
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ))));
  }
}
