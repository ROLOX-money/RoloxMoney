import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/languages/app_languages.dart';
import 'package:roloxmoney/model/project_model.dart';
import 'package:roloxmoney/screen/bank_list_screen/bank_list_controller.dart';
import 'package:roloxmoney/screen/bank_list_screen/bank_list_screen.dart';
import 'package:roloxmoney/screen/payment_screen/payment_controller.dart';
import 'package:roloxmoney/utils/app_utils.dart';
import 'package:roloxmoney/utils/color_resource.dart';
import 'package:roloxmoney/utils/image_resource.dart';
import 'package:roloxmoney/widget/custom_text.dart';
import 'package:roloxmoney/widget/rolox_money_widget.dart';
import 'package:roloxmoney/widget/secondary_button.dart';

class PaymentScreenLarge extends StatefulWidget {
  PaymentController? controller;
  GlobalKey<ScaffoldState>? scaffoldKey;

  PaymentScreenLarge(
      {Key? key, required this.controller, required this.scaffoldKey})
      : super(key: key);

  @override
  State<PaymentScreenLarge> createState() => _PaymentScreenLargeState();
}

class _PaymentScreenLargeState extends State<PaymentScreenLarge> {
  @override
  Widget build(BuildContext context) {
    Get.put(PaymentController());
    return RoloxMoneyWidgetState(
        rxStatus: widget.controller!.status,
        child: SafeArea(
            child: Scaffold(
                backgroundColor: Theme.of(context).backgroundColor,
                appBar: AppBar(
                  centerTitle: false,
                  backgroundColor: Theme.of(context).backgroundColor,
                  title: CustomText(
                    text: '${Languages.of(context)?.rolox}',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: ColorResource.colorFFFFFF,
                        fontSize: 34,
                        fontWeight: FontWeight.w900),
                  ),
                  shadowColor: Colors.grey,
                  elevation: 0.75,
                ),
                body: Center(
                    child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: MediaQuery.of(context).size.height / 1.2,
                        decoration: BoxDecoration(
                            color: ColorResource.color1B2023,
                            borderRadius:
                                BorderRadius.all(Radius.circular(24))),
                        alignment: Alignment.topLeft,
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            child: ListView(children: [
                              SizedBox(
                                height: 15,
                              ),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomText(
                                            text:
                                                '${Languages.of(context)!.payments}'
                                                    .toUpperCase(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                    color: ColorResource
                                                        .colorE08AF4,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                          ),
                                          Container(
                                            width: 160,
                                            height: 40,
                                            child: SecondaryButton(
                                              'View Bank Account',
                                              context,
                                              backgroundColor:
                                                  ColorResource.color00E94F,
                                              fontWeight: FontWeight.w500,
                                              textColor:
                                                  ColorResource.color151515,
                                              fontSize: 14,
                                              onTap: () {
                                                // Get.put(AddBankAccountController());
                                                // Get.toNamed(AddBankAccountScreen.routeName);
                                                Get.put(BankListController());
                                                Get.toNamed(
                                                    BankListScreen.routeName);
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    widget.controller!.projectInvoicesList.obs
                                                .value.value.length >
                                            0
                                        ? ListView.separated(
                                            separatorBuilder: (BuildContext
                                                        context,
                                                    int index) =>
                                                Divider(
                                                    height: 1,
                                                    color: ColorResource
                                                        .colorA0BCD0),
                                            itemCount: widget
                                                .controller!
                                                .projectInvoicesList
                                                .obs
                                                .value
                                                .value
                                                .length,
                                            shrinkWrap: true,
                                            // physics: NeverScrollableScrollPhysics(),
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              ProjectModel projectModel = widget
                                                  .controller!
                                                  .projectInvoicesList
                                                  .obs
                                                  .value
                                                  .value[index];
                                              return Container(
                                                color:
                                                    ColorResource.color151515,
                                                alignment: Alignment.centerLeft,
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 15),
                                                child: ListTile(
                                                  leading: Container(
                                                    height: 40,
                                                    width: 40,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(20),
                                                      ),
                                                      color: ColorResource
                                                          .color381D4E,
                                                    ),
                                                    child: CustomText(
                                                      text: AppUtils.getInitials(
                                                              index == 1
                                                                  ? 'Graphics'
                                                                  : 'UI')
                                                          .toString(),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1!
                                                          .copyWith(
                                                              color: ColorResource
                                                                  .colorE08AF4,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                    ),
                                                  ),
                                                  title: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Container(
                                                            height: 15,
                                                            alignment: Alignment
                                                                .center,
                                                            color: projectModel
                                                                        .isCredit ==
                                                                    false
                                                                ? ColorResource
                                                                    .color4A3114
                                                                : ColorResource
                                                                    .color1C415C,
                                                            child: CustomText(
                                                              text: projectModel
                                                                          .isCredit ==
                                                                      false
                                                                  ? 'Pending'
                                                                      .toUpperCase()
                                                                  : '${Languages.of(context)!.credit}'
                                                                      .toUpperCase(),
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .titleSmall!
                                                                  .copyWith(
                                                                      color: projectModel
                                                                                  .isCredit ==
                                                                              false
                                                                          ? ColorResource
                                                                              .colorFFC700
                                                                          : ColorResource
                                                                              .color0093FF,
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                            ),
                                                          ),
                                                          Container(
                                                            height: 15,
                                                            alignment: Alignment
                                                                .center,
                                                            child: CustomText(
                                                              text: projectModel
                                                                          .isCredit ==
                                                                      false
                                                                  ? 'Reminder'
                                                                  : 'Received',
                                                              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                                                  color: projectModel.isCredit!
                                                                      ? ColorResource
                                                                          .color0093FF
                                                                      : ColorResource
                                                                          .colorFFC700,
                                                                  fontSize: 14,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .underline,
                                                                  decorationColor: projectModel.isCredit!
                                                                      ? ColorResource
                                                                          .color0093FF
                                                                      : ColorResource
                                                                          .colorFFC700,
                                                                  decorationThickness:
                                                                      4,
                                                                  decorationStyle:
                                                                      TextDecorationStyle
                                                                          .solid,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
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
                                                                color: ColorResource
                                                                    .color00E94F,
                                                                overflow:
                                                                    TextOverflow
                                                                        .fade,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                      ),
                                                      SizedBox(height: 5),
                                                      Row(
                                                        children: [
                                                          Text.rich(
                                                            TextSpan(
                                                                text:
                                                                    'Invoice Name',
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .titleSmall!
                                                                    .copyWith(
                                                                        color: ColorResource
                                                                            .colorFFFFFF,
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400),
                                                                children: <
                                                                    InlineSpan>[
                                                                  TextSpan(
                                                                    text:
                                                                        ' #123',
                                                                    style: Theme.of(
                                                                            context)
                                                                        .textTheme
                                                                        .titleSmall!
                                                                        .copyWith(
                                                                            color: ColorResource
                                                                                .colorA0BCD0,
                                                                            fontSize:
                                                                                14,
                                                                            fontWeight:
                                                                                FontWeight.w500),
                                                                  )
                                                                ]),
                                                            maxLines: 2,
                                                            softWrap: true,
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          Container(
                                                            height: 5,
                                                            width: 5,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: ColorResource
                                                                  .colorA0BCD0,
                                                              borderRadius: BorderRadius.only(
                                                                  topRight: Radius
                                                                      .circular(
                                                                          40.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          40.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          40.0),
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          40.0)),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          CustomText(
                                                            text:
                                                                '${projectModel.date}',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .titleSmall!
                                                                .copyWith(
                                                                    color: ColorResource
                                                                        .colorA0BCD0,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .fade,
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
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
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          textColor:
                                                              ColorResource
                                                                  .color00E94F,
                                                          fontSize: 14,
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
                                            buttonName: Languages.of(context)!
                                                .addInvoice,
                                            contentString:
                                                "No Payment are there",
                                            imagePath: ImageResource.emptyPayment,
                                            callBack: () {
                                              widget.controller!
                                                  .navigateAddPaymentScreen();
                                            }),
                                  ]),
                            ])))))));
  }
}
