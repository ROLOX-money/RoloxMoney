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

/*Chinnadurai Viswanathan*/
// ignore: must_be_immutable
class BankListScreenSmall extends StatefulWidget {
  BankListController? controller;
  GlobalKey<ScaffoldState>? scaffoldKey;

  BankListScreenSmall(
      {Key? key, required this.controller, required this.scaffoldKey})
      : super(key: key);

  @override
  BankListScreenSmallState createState() => BankListScreenSmallState();
}

class BankListScreenSmallState extends State<BankListScreenSmall> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(BankListController());
    return RoloxMoneyWidgetState(
      rxStatus: widget.controller!.status,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: ListView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              AppBar(
                backgroundColor: Colors.white,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_sharp,
                    size: 30,
                    color:  ColorResource.color181B28,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
                centerTitle: true,
                title: CustomText(
                  text: 'View Bank Account',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: ColorResource.color181B28,
                      fontSize: 19,
                      fontWeight: FontWeight.w600),
                ),
                shadowColor: Colors.grey,
                elevation: 0.75,
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  widget.controller!.bankList.obs.value.length > 0
                      ? Column(
                          children: [
                            ListView.builder(
                                itemCount: widget.controller!.bankList.obs.value
                                    .length,
                                shrinkWrap: true,
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                itemBuilder: (BuildContext context, int index) {
                                  BankModel bankModel = widget.controller!
                                      .bankList.obs.value[index];
                                  return Container(
                                    margin: EdgeInsets.only(top: 25),
                                    alignment: Alignment.centerLeft,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: bankModel.isPrimary
                                            ? ColorResource.colorA0A1A9
                                            : ColorResource.color383838,
                                        style: BorderStyle.solid,
                                        width: 1.0,
                                      ),
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    padding: EdgeInsets.symmetric(vertical: 15),
                                    child: ListTile(
                                      onTap: () {
                                        widget.controller!
                                            .changedThePrimaryAccount(
                                                selectedIndex: index);
                                      },
                                      leading: Container(
                                        height: 40,
                                        width: 40,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                          color: ColorResource.color381D4E,
                                        ),
                                        child: CustomText(
                                          text: AppUtils.getInitials(
                                                  bankModel.bankName)
                                              .toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(
                                                  color:
                                                      ColorResource.colorEC008C,
                                                  fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                      title: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                            text:
                                                '${bankModel.bankName!} *****3456',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                    color: ColorResource
                                                        .color181B28,
                                                    overflow: TextOverflow.fade,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600),
                                          ),
                                          SizedBox(height: 10),
                                          CustomText(
                                            text: bankModel.holderName!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                    color: ColorResource
                                                        .colorA0A1A9
                                                        .withOpacity(0.6),
                                                    overflow: TextOverflow.fade,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w600),
                                          ),
                                          if (bankModel.isPrimary)
                                            Column(
                                              children: [
                                                SizedBox(height: 5),
                                                CustomText(
                                                  text: 'Primary',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall!
                                                      .copyWith(
                                                          color: ColorResource
                                                              .colorA0A1A9
                                                              .withOpacity(0.6),
                                                          overflow:
                                                              TextOverflow.fade,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                ),
                                              ],
                                            )
                                        ],
                                      ),
                                      trailing: Checkbox(
                                        value: bankModel.isPrimary,
                                        checkColor: ColorResource.colorFFFFFF,
                                        shape: CircleBorder(),
                                        // tristate: true,
                                        activeColor: ColorResource.colorEC008C,
                                        onChanged: (bool? value) {},
                                      ),
                                    ),
                                  );
                                }),
                            SizedBox(
                              height: 10,
                            ),

                            Container(
                              margin: EdgeInsets.symmetric(vertical: 25,horizontal: 10),
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: ColorResource.color60616B,
                                  style: BorderStyle.solid,
                                  width: 1.0,
                                ),
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 15, ),
                              child: ListTile(
                                onTap: () {},
                                leading: Container(
                                  height: 45,
                                  width: 45,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: ColorResource.color60616B,
                                      style: BorderStyle.solid,
                                      width: 1.0,
                                    ),
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(40.0),
                                  ),
                                  child: Image.asset(
                                    ImageResource.bank,
                                    height: 25,
                                    color: ColorResource.color60616B,
                                    width: 25,
                                  ),
                                ),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: 'Add Bank Account',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                              color: ColorResource.color60616B,
                                              overflow: TextOverflow.fade,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                trailing: Icon(
                                  Icons.add,
                                  color: ColorResource.color60616B,
                                  size: 30.0,
                                ),
                              ),
                            ),
                          ],
                        )
                      : AppUtils.emptyViewWidget(
                          context: Get.context!,
                          buttonName: 'Add Account',
                          contentString: "No Bank Account are there",
                          imagePath: ImageResource.emptyPayment,
                          callBack: () {
                            Get.put(AddBankAccountController());
                            Get.toNamed(AddBankAccountScreen.routeName);
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
