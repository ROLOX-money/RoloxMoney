import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/languages/app_languages.dart';
import 'package:roloxmoney/screen/business_profile_screen/business_profile_controller.dart';
import 'package:roloxmoney/screen/dashboard_screen/dashboard_screen.dart';
import 'package:roloxmoney/utils/color_resource.dart';
import 'package:roloxmoney/utils/widget_utils.dart';
import 'package:roloxmoney/widget/custom_button.dart';
import 'package:roloxmoney/widget/custom_text.dart';
import 'package:roloxmoney/widget/custom_textfield.dart';
import 'package:roloxmoney/widget/rolox_money_widget.dart';
import 'package:roloxmoney/widget/stepper_view.dart';

/*Chinnadurai Viswanathan*/
// ignore: must_be_immutable
class BusinessProfileScreenSmall extends StatefulWidget {
  BusinessProfileController? controller;
  GlobalKey<ScaffoldState>? scaffoldKey;

  BusinessProfileScreenSmall(
      {Key? key, required this.controller, required this.scaffoldKey})
      : super(key: key);

  @override
  BusinessProfileScreenSmallState createState() =>
      BusinessProfileScreenSmallState();
}

class BusinessProfileScreenSmallState
    extends State<BusinessProfileScreenSmall> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(BusinessProfileController());
    return RoloxMoneyWidgetState(
      rxStatus: widget.controller!.status,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            margin: EdgeInsets.only(bottom: 40),
            alignment: Alignment.topLeft,
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppBar(
                      backgroundColor: Theme.of(context).backgroundColor,
                      leading: Icon(
                        Icons.arrow_back_sharp,
                        size: 30,
                        color: Colors.white,
                      ),
                      centerTitle: true,
                      title: Text.rich(TextSpan(
                          text:
                              '${Languages.of(context)?.profile} ${Languages.of(context)?.page} ',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  color: ColorResource.colorFFFFFF,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                          children: <InlineSpan>[
                            TextSpan(
                              text: '(${Languages.of(context)?.business})',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      color: ColorResource.color00E94F,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                            )
                          ])),
                      shadowColor: Colors.grey,
                      elevation: 0.75,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              CustomText(
                                text:
                                    '${Languages.of(context)?.profilePageContent}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        color: ColorResource.colorFFFFFF,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  WidgetUtils.dropDown(
                                      context: context,
                                      lableName:
                                          '${Languages.of(context)?.role}'
                                              .toLowerCase(),
                                      dropDownList: widget
                                          .controller!.roleDropDown.obs.value,
                                      selectedValues: widget
                                          .controller!.roleDropDownValue.value,
                                      onChanged: (value) {
                                        widget.controller!.updateValuesOnUI(
                                            value: value,
                                            variableName: widget
                                                .controller!.roleDropDownValue);
                                      }),
                                  SizedBox(
                                    height: 20,
                                  ),

                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey, width: 0.25),
                                        color: ColorResource.color151515),
                                    padding: EdgeInsets.all(10.0),
                                    child: Theme(
                                      data: Theme.of(context).copyWith(
                                          unselectedWidgetColor: Colors.grey,
                                          disabledColor:
                                              ColorResource.color00E94F),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                            text:
                                                '${Languages.of(context)?.typeOfBusiness}'
                                                    .toUpperCase(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                    color: ColorResource
                                                        .colorFFFFFF,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w600),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  widget.controller!
                                                      .modelOfWorkToggle(
                                                          value: ModelOfWork
                                                              .partTime);
                                                },
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Radio(
                                                      value:
                                                          ModelOfWork.partTime,
                                                      groupValue: widget
                                                          .controller!
                                                          .modelOfWork
                                                          .obs
                                                          .value
                                                          .value,
                                                      activeColor: ColorResource
                                                          .color00E94F,
                                                      onChanged:
                                                          (ModelOfWork? value) {
                                                        widget.controller!
                                                            .modelOfWorkToggle(
                                                                value: ModelOfWork
                                                                    .partTime);
                                                      },
                                                    ),
                                                    CustomText(
                                                      text:
                                                          '${Languages.of(context)?.partTime}',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleSmall!
                                                          .copyWith(
                                                              color: ColorResource
                                                                  .colorFFFFFF,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  widget.controller!
                                                      .modelOfWorkToggle(
                                                          value: ModelOfWork
                                                              .fullTime);
                                                },
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Radio(
                                                      value:
                                                          ModelOfWork.fullTime,
                                                      groupValue: widget
                                                          .controller!
                                                          .modelOfWork
                                                          .obs
                                                          .value
                                                          .value,
                                                      activeColor: ColorResource
                                                          .color00E94F,
                                                      onChanged:
                                                          (ModelOfWork? value) {
                                                        widget.controller!
                                                            .modelOfWorkToggle(
                                                                value: ModelOfWork
                                                                    .partTime);
                                                      },
                                                    ),
                                                    CustomText(
                                                      text:
                                                          '${Languages.of(context)?.fullTime}',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleSmall!
                                                          .copyWith(
                                                              color: ColorResource
                                                                  .colorFFFFFF,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),

                                  WidgetUtils.dropDown(
                                      context: context,
                                      lableName:
                                          '${Languages.of(context)?.natureOfWork}'
                                              .toLowerCase(),
                                      dropDownList: widget
                                          .controller!.natureOfWork.obs.value,
                                      selectedValues: widget
                                          .controller!.natureOfWorkValue.value,
                                      onChanged: (value) {
                                        widget.controller!.updateValuesOnUI(
                                            value: value,
                                            variableName: widget
                                                .controller!.natureOfWorkValue);
                                      }),
                                  if (widget.controller!.natureOfWorkValue.value
                                          .toLowerCase() ==
                                      'other')
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: 20,
                                        ),
                                        WidgetUtils.genericTextFiled(
                                          context: context,
                                          controller: widget.controller!
                                              .otherNatureController,
                                          labelName:
                                              '${Languages.of(context)?.otherNatureOfWork}'
                                                  .toUpperCase(),
                                        ),
                                      ],
                                    ),

                                  Column(
                                    children: [
                                      WidgetUtils.genericTextFiled(
                                        context: context,
                                        controller: widget
                                            .controller!.businessNameController,
                                        labelName:
                                            '${Languages.of(context)?.businessName}'
                                                .toUpperCase(),
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Theme(
                                            data: Theme.of(context).copyWith(
                                              unselectedWidgetColor:
                                                  ColorResource.color00E94F,
                                            ),
                                            child: Checkbox(
                                              value: widget
                                                  .controller!
                                                  .iDontHaveBusiness
                                                  .obs
                                                  .value
                                                  .value,
                                              activeColor: Colors.blue,
                                              checkColor:
                                                  ColorResource.color151515,
                                              onChanged: (value) {
                                                widget.controller!
                                                    .noBusinessCheckBox(
                                                        values: value);
                                              },
                                            ),
                                          ),
                                          CustomText(
                                            text:
                                                '${Languages.of(context)?.iDontHaveABusiness}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                    color: ColorResource
                                                        .colorFFFFFF,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  //industry of work
                                  WidgetUtils.dropDown(
                                      context: context,
                                      lableName:
                                          '${Languages.of(context)?.industryOfWork}'
                                              .toLowerCase(),
                                      dropDownList: widget
                                          .controller!.industryOfWork.obs.value,
                                      selectedValues: widget.controller!
                                          .industryOfWorkValue.value,
                                      onChanged: (value) {
                                        widget.controller!.updateValuesOnUI(
                                            value: value,
                                            variableName: widget.controller!
                                                .industryOfWorkValue);
                                      }),
                                  if (widget
                                          .controller!.industryOfWorkValue.value
                                          .toLowerCase() ==
                                      'other')
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: 20,
                                        ),
                                        WidgetUtils.genericTextFiled(
                                          context: context,
                                          controller: widget.controller!
                                              .otherIndustryOfWorkController,
                                          labelName:
                                              '${Languages.of(context)?.otherIndustryOfWork}'
                                                  .toUpperCase(),
                                        ),
                                      ],
                                    ),
                                  CustomText(
                                    text:
                                        '${Languages.of(context)?.mobileNumber}'
                                            .toUpperCase(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                            color: ColorResource.colorA0BCD0,
                                            fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(
                                    child: CustomTextField(
                                      widget.controller!.mobilNumberController
                                          .obs.value,
                                      focusedBorder: Colors.grey,
                                      textColor: Colors.white,
                                      enableColor: Colors.grey,
                                      borderColor: Colors.red,
                                      disableColor: Colors.red,
                                      keyBoardType: TextInputType.phone,
                                      prefixIcon: Container(
                                        width: 100,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              ClipOval(
                                                child: Material(
                                                  child: InkWell(
                                                    splashColor: Colors.red,
                                                    // Splash color
                                                    onTap: () {},
                                                    child: SizedBox(
                                                      width: 22,
                                                      height: 22,
                                                      child: Image.network(
                                                        'https://think360studio-media.s3.ap-south-1.amazonaws.com/download/india-flag-2021-wallpaper-1.png',
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              CustomText(
                                                text: '+91',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall!
                                                    .copyWith(
                                                        color: Theme.of(context)
                                                            .textTheme
                                                            .titleMedium!
                                                            .color,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w400),
                                              ),
                                              Icon(
                                                Icons.keyboard_arrow_down,
                                                size: 22,
                                                color: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium!
                                                    .color,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Container(
                                                width: 0.40,
                                                height: 20,
                                                color:
                                                    ColorResource.colorDDDDDD,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    height: 70,
                                  ),

                                  WidgetUtils.genericTextFiled(
                                    context: context,
                                    controller:
                                        widget.controller!.emailController,
                                    labelName:
                                        '${Languages.of(context)?.emailID}'
                                            .toUpperCase(),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          backgroundColor: Theme.of(context).backgroundColor,
          bottomNavigationBar: PrimaryButton(
            '${Languages.of(context)!.continueText}',
            context,
            cardShape: 1,
            isIcon: true,
            textColor: ColorResource.black,
            fontSize: 20,
            onTap: () {
              Get.offNamed(DashboardScreen.routeName);
            },
          ),
        ),
      ),
    );
  }
}
