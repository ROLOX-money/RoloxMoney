import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:roloxmoney/languages/app_languages.dart';
import 'package:roloxmoney/model/project_model.dart';
import 'package:roloxmoney/screen/bank_list_screen/bank_list_controller.dart';
import 'package:roloxmoney/screen/bank_list_screen/bank_list_screen.dart';
import 'package:roloxmoney/screen/payment_screen/payment_controller.dart';
import 'package:roloxmoney/utils/app_utils.dart';
import 'package:roloxmoney/utils/color_resource.dart';
import 'package:roloxmoney/utils/image_resource.dart';
import 'package:roloxmoney/widget/custom_button.dart';
import 'package:roloxmoney/widget/custom_text.dart';
import 'package:roloxmoney/widget/rolox_money_widget.dart';
import 'package:roloxmoney/widget/secondary_button.dart';

/*Chinnadurai Viswanathan*/
// ignore: must_be_immutable
class PaymentScreenSmall extends StatefulWidget {
  //Payment
  PaymentController? controller;
  GlobalKey<ScaffoldState>? scaffoldKey;

  PaymentScreenSmall(
      {Key? key, required this.controller, required this.scaffoldKey})
      : super(key: key);

  @override
  PaymentScreenSmallState createState() => PaymentScreenSmallState();
}

class PaymentScreenSmallState extends State<PaymentScreenSmall> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(PaymentController());
    return RoloxMoneyWidgetState(
      rxStatus: widget.controller!.status,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          child: ListView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text:
                              '${Languages.of(context)!.payments.capitalizeFirst}',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  color: ColorResource.color000000,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500),
                        ),
                        Container(
                          width: 161,
                          height: 40,
                          child: PrimaryButton(
                            'View Bank Account',
                            context,
                            fontWeight: FontWeight.w500,
                            textColor: ColorResource.colorFFFFFF,
                            fontSize: 14,
                            onTap: () {
                              // Get.put(AddBankAccountController());
                              // Get.toNamed(AddBankAccountScreen.routeName);
                              Get.put(BankListController());
                              Get.toNamed(BankListScreen.routeName);
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  widget.controller!.projectInvoicesList.obs.value.length > 0
                      ? ListView.separated(
                          separatorBuilder: (BuildContext context, int index) =>
                              Divider(
                                  height: 1, color: ColorResource.color181B28),
                          itemCount: widget
                              .controller!.projectInvoicesList.obs.value.length,
                          shrinkWrap: true,
                          // physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            ProjectModel projectModel = widget.controller!
                                .projectInvoicesList.obs.value[index];
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
                                            index == 1 ? 'Graphics' : 'UI')
                                        .toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                            color:
                                                ColorResource.initialTextColor,
                                            fontWeight: FontWeight.w700),
                                  ),
                                ),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            // border: Border.all(width: 3.0),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(
                                                    7.0) // <--- border radius here
                                                ),
                                            color: projectModel.isCredit ==
                                                    false
                                                ? ColorResource.pendingColor
                                                : ColorResource.creditedColor,
                                          ),
                                          child: CustomText(
                                            text: projectModel.isCredit == false
                                                ? 'Pending'.toUpperCase()
                                                : '${Languages.of(context)!.credit}ed'
                                                    .toUpperCase(),
                                            color: Colors.red,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                    color: projectModel.isCredit ==
                                                            false
                                                        ? ColorResource
                                                            .orangeColor
                                                        : ColorResource
                                                            .creditedTextColor,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w500),
                                          ),
                                        ),
                                        if (projectModel.isCredit == false)
                                          Container(
                                            height: 15,
                                            alignment: Alignment.center,
                                            child: CustomText(
                                              text: 'Reminder',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall!
                                                  .copyWith(
                                                      color: ColorResource
                                                          .primaryColor,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500),
                                            ),
                                          ),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    CustomText(
                                      text: '₹50,000',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                              color: ColorResource.textColor,
                                              overflow: TextOverflow.fade,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text.rich(
                                          TextSpan(
                                              text: 'Invoice Name',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall!
                                                  .copyWith(
                                                      color: ColorResource
                                                          .textColor,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400),
                                              children: <InlineSpan>[
                                                TextSpan(
                                                  text: ' #123',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall!
                                                      .copyWith(
                                                          color: ColorResource
                                                              .textSecondaryColor,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                )
                                              ]),
                                          maxLines: 2,
                                          softWrap: true,
                                          textAlign: TextAlign.center,
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
                                          text: DateFormat('MM/dd/yyyy').format(
                                              DateTime.parse(
                                                  DateTime.now().toString())),
                                          // '${projectModel.date}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                  color: ColorResource
                                                      .textSecondaryColor,
                                                  overflow: TextOverflow.fade,
                                                  fontSize: 12,
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
                                        fontWeight: FontWeight.w500,
                                        textColor: ColorResource.color181B28,
                                        fontSize: 14,
                                        backgroundColor:
                                            ColorResource.colorF5F5F5,
                                        onTap: () {},
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          })
                      : AppUtils.emptyViewWidget(
                          context: Get.context!,
                          buttonName: '${Languages.of(context)?.addPayments}',
                          buttonWidth: 130,
                          contentString: "No Payment are there",
                          imagePath: ImageResource.emptyPayment,
                          callBack: () {
                            widget.controller!.navigateAddPaymentScreen();
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
