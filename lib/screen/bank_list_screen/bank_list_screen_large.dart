import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/model/bank_model.dart';
import 'package:roloxmoney/screen/bank_list_screen/bank_list_controller.dart';
import 'package:roloxmoney/screen/payment_screen/add_bank_account/add_bank_account_controller.dart';
import 'package:roloxmoney/screen/payment_screen/add_bank_account/add_bank_account_screen.dart';
import 'package:roloxmoney/utils/app_utils.dart';
import 'package:roloxmoney/utils/color_resource.dart';
import 'package:roloxmoney/utils/image_resource.dart';
import 'package:roloxmoney/widget/custom_text.dart';
import 'package:roloxmoney/widget/rolox_money_widget.dart';

class BankListLargeScreen extends StatefulWidget {
  BankListController? controller;
  GlobalKey<ScaffoldState>? scaffoldKey;

  BankListLargeScreen({Key? key, this.controller, required this.scaffoldKey})
      : super(key: key);

  @override
  State<BankListLargeScreen> createState() => _BankListLargeScreenState();
}

class _BankListLargeScreenState extends State<BankListLargeScreen> {
  @override
  Widget build(BuildContext context) {
    Get.put(BankListController());
    return RoloxMoneyWidgetState(
        rxStatus: widget.controller!.status,
        child: SafeArea(
            child: Scaffold(
                backgroundColor: Theme.of(context).backgroundColor,
                appBar: AppBar(
                    centerTitle: false,
                    backgroundColor: Theme.of(context).backgroundColor,
                    title: Container(
                      padding: const EdgeInsets.only(left: 8.0, top: 20),
                      child: Image.asset(
                        ImageResource.rolox,
                        height: 30,
                      ),
                    ),
                    shadowColor: Colors.grey,
                    elevation: 0.0),
                body: Center(
                    child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: MediaQuery.of(context).size.height / 1.3,
                        decoration: BoxDecoration(
                            color: ColorResource.color1B2023,
                            borderRadius: BorderRadius.all(Radius.circular(24))),
                        alignment: Alignment.topLeft,
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 30),
                            child: ListView(shrinkWrap: true, children: [
                              AppBar(
                                  backgroundColor: ColorResource.color1B2023,
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
                                  centerTitle: false,
                                  title: CustomText(
                                    text: 'View Bank Account',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                            color: ColorResource.colorFFFFFF,
                                            fontSize: 21,
                                            fontWeight: FontWeight.w600),
                                  ),
                                  shadowColor: Colors.grey,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(24),
                                          topRight: Radius.circular(24)))),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  widget.controller!.bankList.obs.value.value
                                              .length >
                                          0
                                      ? Column(
                                          children: [
                                            ListView.builder(
                                                itemCount: widget
                                                    .controller!
                                                    .bankList
                                                    .obs
                                                    .value
                                                    .value
                                                    .length,
                                                shrinkWrap: true,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  BankModel bankModel = widget
                                                      .controller!
                                                      .bankList
                                                      .obs
                                                      .value
                                                      .value[index];
                                                  return Container(
                                                    margin: EdgeInsets.only(
                                                        top: 25),
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color: bankModel
                                                                .isPrimary
                                                            ? ColorResource
                                                                .colorFFFFFF
                                                            : ColorResource
                                                                .color383838,
                                                        style:
                                                            BorderStyle.solid,
                                                        width: 1.0,
                                                      ),
                                                      color: Colors.transparent,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 15),
                                                    child: ListTile(
                                                      onTap: () {
                                                        widget.controller!
                                                            .changedThePrimaryAccount(
                                                                selectedIndex:
                                                                    index);
                                                      },
                                                      leading: Container(
                                                        height: 40,
                                                        width: 40,
                                                        alignment:
                                                            Alignment.center,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(20),
                                                          ),
                                                          color: ColorResource
                                                              .color381D4E,
                                                        ),
                                                        child: CustomText(
                                                          text: AppUtils
                                                                  .getInitials(
                                                                      bankModel
                                                                          .bankName)
                                                              .toString(),
                                                          style: Theme.of(
                                                                  context)
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
                                                          CustomText(
                                                            text:
                                                                '${bankModel.bankName!} *****3456',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .titleSmall!
                                                                .copyWith(
                                                                    color: ColorResource
                                                                        .colorF8F8F8,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .fade,
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                          ),
                                                          SizedBox(height: 10),
                                                          CustomText(
                                                            text: bankModel
                                                                .holderName!,
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .titleSmall!
                                                                .copyWith(
                                                                    color: ColorResource
                                                                        .colorFFFFFF
                                                                        .withOpacity(
                                                                            0.6),
                                                                    overflow:
                                                                        TextOverflow
                                                                            .fade,
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                          ),
                                                          if (bankModel
                                                              .isPrimary)
                                                            Column(
                                                              children: [
                                                                SizedBox(
                                                                    height: 5),
                                                                CustomText(
                                                                  text:
                                                                      'Primary',
                                                                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                                                      color: ColorResource
                                                                          .colorFFFFFF
                                                                          .withOpacity(
                                                                              0.6),
                                                                      overflow:
                                                                          TextOverflow
                                                                              .fade,
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                                ),
                                                              ],
                                                            )
                                                        ],
                                                      ),
                                                      trailing: Checkbox(
                                                        value:
                                                            bankModel.isPrimary,
                                                        checkColor:
                                                            ColorResource
                                                                .colorFFFFFF,
                                                        shape: CircleBorder(),
                                                        // tristate: true,
                                                        activeColor:
                                                            ColorResource
                                                                .color00E94F,
                                                        onChanged:
                                                            (bool? value) {},
                                                      ),
                                                    ),
                                                  );
                                                }),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 25),
                                              alignment: Alignment.centerLeft,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color:
                                                      ColorResource.color00E94F,
                                                  style: BorderStyle.solid,
                                                  width: 1.0,
                                                ),
                                                color: Colors.transparent,
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 15),
                                              child: ListTile(
                                                onTap: () {},
                                                leading: Container(
                                                  height: 45,
                                                  width: 45,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: ColorResource
                                                          .color383838,
                                                      style: BorderStyle.solid,
                                                      width: 1.0,
                                                    ),
                                                    color: Colors.transparent,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40.0),
                                                  ),
                                                  child: Image.asset(
                                                    ImageResource.bank,
                                                    height: 25,
                                                    width: 25,
                                                  ),
                                                ),
                                                title: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    CustomText(
                                                      text: 'Add Bank Account',
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
                                                  ],
                                                ),
                                                trailing: Icon(
                                                  Icons.add,
                                                  color:
                                                      ColorResource.color00E94F,
                                                  size: 30.0,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      : AppUtils.emptyViewWidget(
                                          context: Get.context!,
                                          buttonName: 'Add Account',
                                          contentString:
                                              "No Bank Account are there",
                                          imagePath: ImageResource.emptyPayment,
                                          callBack: () {
                                            Get.put(AddBankAccountController());
                                            Get.toNamed(
                                                AddBankAccountScreen.routeName);
                                          }),
                                ],
                              )
                            ])))))));
  }
}
