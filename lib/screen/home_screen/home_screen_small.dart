import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/languages/app_languages.dart';
import 'package:roloxmoney/model/group_invoices_model.dart';
import 'package:roloxmoney/model/invoice_model.dart';
import 'package:roloxmoney/screen/home_screen/home_controller.dart';
import 'package:roloxmoney/utils/app_utils.dart';
import 'package:roloxmoney/utils/color_resource.dart';
import 'package:roloxmoney/utils/image_resource.dart';
import 'package:roloxmoney/widget/custom_text.dart';
import 'package:roloxmoney/widget/rolox_money_widget.dart';
import 'package:roloxmoney/widget/secondary_button.dart';

/*Chinnadurai Viswanathan*/
// ignore: must_be_immutable
class HomeScreenSmall extends StatefulWidget {
  HomeController? controller;
  GlobalKey<ScaffoldState>? scaffoldKey;

  HomeScreenSmall(
      {Key? key, required this.controller, required this.scaffoldKey})
      : super(key: key);

  @override
  HomeScreenSmallState createState() => HomeScreenSmallState();
}

class HomeScreenSmallState extends State<HomeScreenSmall> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return RoloxMoneyWidgetState(
      rxStatus: widget.controller!.status,
      child: Scaffold(
          backgroundColor: Colors.transparent,
          extendBody: true,
          body: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  // ListTile(
                  //   tileColor: ColorResource.color151515,
                  //   shape: RoundedRectangleBorder(
                  //     side: BorderSide(width: 2,color: Colors.grey),
                  //     borderRadius: BorderRadius.circular(20),
                  //   ),
                  //   leading: Image.asset(
                  //     ImageResource.withdrawImage,
                  //     height: 40,
                  //     width: 40,
                  //   ),
                  //   trailing: SizedBox(
                  //     width: 120,
                  //     child: SecondaryButton(
                  //       '${Languages.of(context)!.withdraw}',
                  //       context,
                  //       textColor: ColorResource.color00E94F,
                  //       fontSize: 20,
                  //       onTap: () {},
                  //     ),
                  //   ),
                  //   title: CustomText(
                  //     text: '${Languages.of(context)?.accountBalance}',
                  //     style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  //         color: ColorResource.colorFFFFFF,
                  //         fontSize: 16,
                  //         fontWeight: FontWeight.w400),
                  //   ),
                  //   subtitle: Row(
                  //     children: [
                  //       CustomText(
                  //         text: '₹ 50000',
                  //         style: Theme.of(context)
                  //             .textTheme
                  //             .titleSmall!
                  //             .copyWith(
                  //                 color: ColorResource.color00E94F,
                  //                 fontSize: 16,
                  //                 fontWeight: FontWeight.w600),
                  //       ),
                  //       IconButton(
                  //           onPressed: () {},
                  //           icon: Icon(
                  //             Icons.visibility_off,
                  //             color: ColorResource.color8B8B8B,
                  //           ))
                  //     ],
                  //   ),
                  // ),

                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 0.15),
                        color: ColorResource.color151515),
                    padding: EdgeInsets.all(15.0),
                    child: Theme(
                      data: Theme.of(context).copyWith(
                          unselectedWidgetColor: Colors.grey,
                          disabledColor: ColorResource.color00E94F),
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: Image.asset(
                              ImageResource.withdrawImage,
                              height: 40,
                              width: 40,
                            ),
                          ),
                          Column(
                            children: [
                              CustomText(
                                text:
                                    '${Languages.of(context)?.accountBalance}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        color: ColorResource.colorFFFFFF,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                              ),
                              // SizedBox(height: 10),
                              MediaQuery.removePadding(
                                context: context,
                                removeTop: true,
                                child: Row(
                                  children: [
                                    CustomText(
                                      text: '₹ 50000',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                              color: ColorResource.color00E94F,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.visibility_off,
                                          color: ColorResource.color8B8B8B,
                                        ))
                                  ],
                                ),
                              )
                            ],
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                          Container(
                            width: 130,
                            height: 40,
                            child: SecondaryButton(
                              '${Languages.of(context)!.withdraw}',
                              context,
                              textColor: ColorResource.color00E94F,
                              fontSize: 20,
                              onTap: () {},
                            ),
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // All Invoices
                  Row(children: [
                    CustomText(
                      text: '${Languages.of(context)?.allInvoices}',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: ColorResource.colorFFFFFF,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.arrow_forward,
                      color: ColorResource.colorFFFFFF,
                    ),
                  ]),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      print("onTapped");
                      oldBodyWidget();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 0.15),
                          color: ColorResource.color151515),
                      padding: EdgeInsets.all(15.0),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                            unselectedWidgetColor: Colors.grey,
                            disabledColor: ColorResource.color00E94F),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Flexible(
                              child: Text.rich(
                                TextSpan(
                                    text:
                                        '${Languages.of(context)?.upcoming}               ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w600,
                                            height: 1.5,
                                            foreground: Paint()
                                              ..shader =
                                                  ColorResource.linearGradient),
                                    children: [
                                      TextSpan(
                                        text:
                                            '${Languages.of(context)?.inNext1Week}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                                color:
                                                    ColorResource.colorFFFFFF,
                                                fontSize: 24,
                                                fontWeight: FontWeight.w600),
                                      )
                                    ]),
                                maxLines: 2,
                                softWrap: true,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Column(
                              children: [
                                CustomText(
                                  text:
                                      '${Languages.of(context)?.noOf} ${Languages.of(context)?.invoices}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                          color: ColorResource.colorFFFFFF,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: 5),
                                CustomText(
                                  text: '07',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                          color: ColorResource.color00E94F,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: 5),
                                CustomText(
                                  text:
                                      '${Languages.of(context)?.transactionWorth}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                          color: ColorResource.colorFFFFFF,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: 5),
                                CustomText(
                                  text: '₹ 50000',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                          color: ColorResource.color00E94F,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                ),
                                // Divider(height: 3, thickness: 5, color:Colors.green)
                                // ColorResource.color272727)
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      paidCardWidget('${Languages.of(context)?.paid}'),
                      paidCardWidget('${Languages.of(context)?.due}')
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          )),
    );
  }

  Widget invoiceWidget({required GroupInvoices groupInvoices}) {
    return ListView.builder(
        // separatorBuilder: (BuildContext context, int index) =>
        //     Divider(height: 1, color: ColorResource.colorA0BCD0),
        itemCount: groupInvoices.invoiceList!.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          InvoiceModel invoiceModel = groupInvoices.invoiceList![index];
          return Card(
            color: ColorResource.color151515,
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(vertical: 20),
              child: ListTile(
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
                    text: AppUtils.getInitials(invoiceModel.clientName)
                        .toString(),
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: ColorResource.colorE08AF4,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                trailing: CustomText(
                  text: '₹ ${invoiceModel.amount!}',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: ColorResource.color00E94F,
                      fontSize: 16,
                      fontWeight: FontWeight.w800),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: '${invoiceModel.clientName}',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: ColorResource.colorFFFFFF,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CustomText(
                      text: '${invoiceModel.workName}',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: ColorResource.colorA0BCD0,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CustomText(
                      text: '${invoiceModel.date}',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: ColorResource.colorA0BCD0,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget paidCardWidget(String title) {
    return ClipRRect(
      child: Stack(children: [
        Container(
          // color: Colors.green,
          color: ColorResource.color0093FF,
          height: 100,
          width: 100,
        ),
        Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 0.15),
                color: ColorResource.color151515),
            padding: EdgeInsets.all(8.0),
            child: Theme(
                data: Theme.of(context).copyWith(
                    unselectedWidgetColor: Colors.grey,
                    disabledColor: ColorResource.color00E94F),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    CustomText(
                      text: title,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          height: 1.5,
                          foreground: Paint()
                            ..shader = ColorResource.linearGradient),
                    ),
                    SizedBox(height: 10),
                    CustomText(
                      text:
                          '${Languages.of(context)?.noOf} ${Languages.of(context)?.invoices}',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: ColorResource.colorFFFFFF,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 10),
                    CustomText(
                      text: '07',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: ColorResource.color00E94F,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 10),
                    CustomText(
                      text: '${Languages.of(context)?.transactionWorth}',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: ColorResource.colorFFFFFF,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 10),
                    CustomText(
                      text: '₹ 50000',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: ColorResource.color00E94F,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 10),
                  ],
                ))),
      ]),
    );
  }

  Widget oldBodyWidget() {
    return ListView(
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 0.15),
              color: ColorResource.color151515),
          padding: EdgeInsets.all(15.0),
          child: Theme(
            data: Theme.of(context).copyWith(
                unselectedWidgetColor: Colors.grey,
                disabledColor: ColorResource.color00E94F),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        ImageResource.withdrawImage,
                        height: 40,
                        width: 40,
                      ),
                    ),
                    Column(
                      children: [
                        CustomText(
                          text: '${Languages.of(context)?.youWalletBalance}',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  color: ColorResource.colorFFFFFF,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomText(
                          text: '₹ 50000',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  color: ColorResource.color00E94F,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                        ),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                    Container(
                      width: 130,
                      height: 40,
                      child: SecondaryButton(
                        '${Languages.of(context)!.withdraw}',
                        context,
                        textColor: ColorResource.color00E94F,
                        fontSize: 20,
                        onTap: () {},
                      ),
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            ListView.builder(
                itemCount:
                    widget.controller!.groupInvoicesList.obs.value.value.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  GroupInvoices groupInvoices = widget
                      .controller!.groupInvoicesList.obs.value.value[index];
                  return Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          CustomText(
                            text: '${groupInvoices.groupName}'.toUpperCase(),
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    color: ColorResource.colorE08AF4,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Image.asset(
                              ImageResource.buttonArrow,
                              color: ColorResource.colorE08AF4,
                              width: 20,
                              height: 10,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        padding: EdgeInsets.all(1.0),
                        margin: EdgeInsets.only(bottom: 15.0),
                        child: Theme(
                          data: Theme.of(context).copyWith(
                              unselectedWidgetColor: Colors.grey,
                              disabledColor: ColorResource.color00E94F),
                          // child:
                          child: invoiceWidget(
                              groupInvoices: widget.controller!
                                  .groupInvoicesList.obs.value.value[index]),
                        ),
                      ),
                    ],
                  );
                }),
          ],
        ),
      ],
    );
  }
}
