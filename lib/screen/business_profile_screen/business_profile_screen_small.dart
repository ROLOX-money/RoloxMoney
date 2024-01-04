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
import '../dashboard_screen/dashboard_controller.dart';

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
            color: ColorResource.colorFFFFFF,
            margin: EdgeInsets.only(bottom: 40),
            alignment: Alignment.topLeft,
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppBar(
                      backgroundColor: ColorResource.colorFFFFFF,
                      leading: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.arrow_back_sharp,
                          size: 30,
                          color: ColorResource.color0D0D0D,
                        ),
                      ),
                      centerTitle: true,
                      title: Text.rich(TextSpan(
                          text:
                              '${Languages.of(context)?.profile} ${Languages.of(context)?.page} ',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  color: ColorResource.color0D0D0D,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                          children: <InlineSpan>[
                            TextSpan(
                              text: '(${Languages.of(context)?.business})',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      color: ColorResource.color0D0D0D,
                                      fontSize: 18,
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
                                    '${Languages.of(context)?.profileScreenFreeContent}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        color: ColorResource.color8B8B8B,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  // Role
                                  WidgetUtils.dropDown(
                                      context: context,
                                      lableName:
                                          '${Languages.of(context)?.role}',
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
                                  // Type of Business
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey, width: 0.25),
                                        color: ColorResource.colorFFFFFF),
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
                                                '${Languages.of(context)?.modeOfWork}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                    color: ColorResource
                                                        .color020e36,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w600),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
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
                                                          .colorEC008C,
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
                                                                  .color8B8B8B,
                                                              fontSize: 14,
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
                                                          .colorEC008C,
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
                                                                  .color8B8B8B,
                                                              fontSize: 14,
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
                                  SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Theme(
                                        data: Theme.of(context).copyWith(
                                          unselectedWidgetColor:
                                              ColorResource.color020e36,
                                        ),
                                        child: Checkbox(
                                          value: widget
                                              .controller!
                                              .iDontHaveBusiness
                                              .obs
                                              .value
                                              .value,
                                          activeColor:
                                              ColorResource.colorEC008C,
                                          checkColor: ColorResource.colorFFFFFF,
                                          onChanged: (value) {
                                            widget.controller!
                                                .noBusinessCheckBox(
                                                    values: value);
                                          },
                                        ),
                                      ),
                                      CustomText(
                                        text:
                                            '${Languages.of(context)?.iHaveABusiness}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                                color:
                                                    ColorResource.color020e36,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  // business Name

                                  if (widget.controller!.iDontHaveBusiness.obs
                                      .value.value)
                                    Column(
                                      children: [
                                        WidgetUtils.genericTextFiled(
                                          context: context,
                                          controller: widget.controller!
                                              .businessNameController,
                                          labelName:
                                              '${Languages.of(context)?.businessName}',
                                          labelStyle: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                  color:
                                                      ColorResource.color020e36,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  // nature of business
                                  WidgetUtils.dropDown(
                                      context: context,
                                      lableName:
                                          '${Languages.of(context)?.natureOfBusiness}',
                                      dropDownList: widget.controller!
                                          .natureOfBusiness.obs.value,
                                      selectedValues: widget.controller!
                                          .natureOfBusinessValue.value,
                                      onChanged: (value) {
                                        widget.controller!
                                            .updateNatureOfBusinessValue(value);
                                      }),
                                  SizedBox(height: 5),
                                  if (widget.controller!.natureOfBusinessValue
                                          .value
                                          .toLowerCase() ==
                                      'others')
                                    WidgetUtils.genericTextFiled(
                                      context: context,
                                      controller: widget.controller!
                                          .plsIfSpecifyControllerForNatureOfBusiness,
                                      labelName:
                                          '${Languages.of(context)?.plsIfSpecify}',
                                      labelStyle: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                              color: ColorResource.color020e36,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                    ),
                                  // nature of work
                                  WidgetUtils.dropDown(
                                      context: context,
                                      lableName:
                                          '${Languages.of(context)?.natureOfWork}',
                                      dropDownList: widget
                                          .controller!.natureOfWork.obs.value,
                                      selectedValues: widget
                                          .controller!.natureOfWorkValue.value,
                                      onChanged: (value) {
                                        widget.controller!
                                            .updateNatureOfWork(value);
                                      }),
                                  SizedBox(height: 10),
                                  if (widget.controller!.natureOfWorkValue.value
                                          .toLowerCase() ==
                                      'others')
                                    WidgetUtils.genericTextFiled(
                                      context: context,
                                      controller: widget
                                          .controller!.plsIfSpecifyController,
                                      labelName:
                                          '${Languages.of(context)?.plsIfSpecify}',
                                      labelStyle: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                              color: ColorResource.color020e36,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                    ),
                                  CustomText(
                                    text:
                                        '${Languages.of(context)?.mobileNumber}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                            color: ColorResource.color020e36,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(height: 5),
                                  SizedBox(
                                    child: CustomTextField(
                                      widget.controller!.mobilNumberController,
                                      focusedBorder: Colors.grey,
                                      textColor: ColorResource.color020e36,
                                      enableColor: ColorResource.color020e36,
                                      borderColor: ColorResource.color020e36,
                                      disableColor: ColorResource.color020e36,
                                      isEnable: false,
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
                                                      width: 20,
                                                      height: 20,
                                                      child: Image.network(
                                                        'https://think360studio-media.s3.ap-south-1.amazonaws.com/download/india-flag-2021-wallpaper-1.png',
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 6),
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
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400),
                                              ),
                                              Icon(
                                                Icons.keyboard_arrow_down,
                                                size: 20,
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
                                  //email id
                                  WidgetUtils.genericTextFiled(
                                    context: context,
                                    keyBoardType: TextInputType.emailAddress,
                                    controller:
                                        widget.controller!.emailController,
                                    labelName:
                                        '${Languages.of(context)?.emailID}',
                                    labelStyle: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                            color: ColorResource.color020e36,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
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
          bottomNavigationBar: PrimaryButton(
            '${Languages.of(context)!.continueText}',
            context,
            cardShape: 1,
            isIcon: true,
            textColor: ColorResource.colorFFFFFF,
            fontSize: 20,
            onTap: () {
              widget.controller!.validatingProfile();
              // Get.put(DashboardController());
              // Get.offAll(DashboardScreen());
            },
          ),
        ),
      ),
    );
  }
}
