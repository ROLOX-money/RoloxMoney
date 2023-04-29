import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/languages/app_languages.dart';
import 'package:roloxmoney/screen/dashboard_screen/dashboard_controller.dart';
import 'package:roloxmoney/screen/dashboard_screen/dashboard_screen.dart';
import 'package:roloxmoney/screen/individual_profile_screen/individual_profile_controller.dart';
import 'package:roloxmoney/utils/color_resource.dart';
import 'package:roloxmoney/utils/widget_utils.dart';
import 'package:roloxmoney/widget/custom_button.dart';
import 'package:roloxmoney/widget/custom_text.dart';
import 'package:roloxmoney/widget/custom_textfield.dart';
import 'package:roloxmoney/widget/rolox_money_widget.dart';
import 'package:roloxmoney/widget/stepper_view.dart';

/*Chinnadurai Viswanathan*/
// ignore: must_be_immutable
class IndividualProfileScreenSmall extends StatefulWidget {
  IndividualProfileController? controller;
  GlobalKey<ScaffoldState>? scaffoldKey;

  IndividualProfileScreenSmall(
      {Key? key, required this.controller, required this.scaffoldKey})
      : super(key: key);

  @override
  IndividualProfileScreenSmallState createState() =>
      IndividualProfileScreenSmallState();
}

class IndividualProfileScreenSmallState
    extends State<IndividualProfileScreenSmall> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(IndividualProfileController());
    return RoloxMoneyWidgetState(
      rxStatus: widget.controller!.status,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            alignment: Alignment.topLeft,
            child: ListView(
              shrinkWrap: true,
              // physics: NeverScrollableScrollPhysics(),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppBar(
                      backgroundColor: Theme.of(context).backgroundColor,
                      leading: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.arrow_back_sharp,
                          size: 30,
                          color: Colors.white,
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
                                  color: ColorResource.colorFFFFFF,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                          children: <InlineSpan>[
                            TextSpan(
                              text: '(${Languages.of(context)?.individual})',
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
                    Container(
                      width: MediaQuery.of(context).size.width / 1.5,
                      alignment: Alignment.center,
                      child: NumberStepper(
                        totalSteps: 2,
                        width: MediaQuery.of(context).size.width,
                        currentStep:
                            widget.controller!.currentStep.obs.value.value,
                        stepCompleteColor: Colors.blue,
                        currentStepColor: Color(0xffdbecff),
                        inactiveColor: Color(0xffbababa),
                        lineWidth: 1,
                      ),
                    ),
                    Container(
                      // ignore: unrelated_type_equality_checks
                      child: widget.controller!.currentStep.obs.value == 1
                          ? firstPageForIndividual()
                          : secondPageForIndividual(),
                    ),
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
              if (widget.controller!.currentStep.obs.value.value != 2) {
                widget.controller!.stepCount(
                    values: widget.controller!.currentStep.obs.value.value + 1);
              } else {
                Get.put(DashboardController());
                Get.offAll(DashboardScreen());
              }
            },
          ),
        ),
      ),
    );
  }

  Widget firstPageForIndividual() {
    return ListView(
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              CustomText(
                text: '${Languages.of(context)?.profilePageContent}',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: ColorResource.colorFFFFFF,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  SizedBox(height: 10),

                  // mode of work
                  WidgetUtils.dropDown(
                      context: context,
                      lableName:
                          '${Languages.of(context)?.modelOfWork}'.toLowerCase(),
                      dropDownList: widget.controller!.modelOfWork.obs.value,
                      selectedValues: widget.controller!.modelOfWorkValue.value,
                      onChanged: (value) {
                        widget.controller!.updateValuesOnUI(
                            value: value,
                            variableName: widget.controller!.modelOfWorkValue);
                      }),
                  SizedBox(height: 20),

                  // // I have GST no
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   crossAxisAlignment:
                  //   CrossAxisAlignment.center,
                  //   children: <Widget>[
                  //     Theme(
                  //       data: Theme.of(context).copyWith(
                  //         unselectedWidgetColor:
                  //         ColorResource.color00E94F,
                  //       ),
                  //       child: Checkbox(
                  //         value: widget
                  //             .controller!
                  //             .iDontHaveBusiness
                  //             .obs
                  //             .value
                  //             .value,
                  //         activeColor: Colors.blue,
                  //         checkColor: ColorResource.color151515,
                  //         onChanged: (value) {
                  //           widget.controller!
                  //               .noBusinessCheckBox(
                  //               values: value);
                  //         },
                  //       ),
                  //     ),
                  //     CustomText(
                  //       text:
                  //       '${Languages.of(context)?.iHaveAGSTNumber}',
                  //       style: Theme.of(context)
                  //           .textTheme
                  //           .titleSmall!
                  //           .copyWith(
                  //           color:
                  //           ColorResource.colorFFFFFF,
                  //           fontSize: 16,
                  //           fontWeight: FontWeight.w400),
                  //     ),
                  //   ],
                  // ),
                  // WidgetUtils.genericTextFiled(
                  //   context: context,
                  //   controller: widget
                  //       .controller!.gstController,
                  //   labelName:
                  //   '${Languages.of(context)?.gstNumber}',
                  //   labelStyle: Theme.of(context)
                  //       .textTheme
                  //       .titleSmall!
                  //       .copyWith(
                  //       color:
                  //       ColorResource.colorE08AF4,
                  //       fontSize: 14,
                  //       fontWeight: FontWeight.w500),
                  // ),

                  // nature of business
                  WidgetUtils.dropDown(
                      context: context,
                      lableName:
                      '${Languages.of(context)?.natureOfBusiness}',
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
                  SizedBox(height: 10),
                  if (widget.controller!.natureOfWorkValue.value.toLowerCase() == 'other')
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
                          color: ColorResource.colorE08AF4,
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
                        widget.controller!.updateValuesOnUI(
                            value: value,
                            variableName: widget
                                .controller!.natureOfWorkValue);
                      }),
                  SizedBox(height: 10),
                  if (widget.controller!.natureOfWorkValue.value
                      .toLowerCase() ==
                      'other')
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
                          color: ColorResource.colorE08AF4,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),

                  // mobile no
                  CustomText(
                    text:
                    '${Languages.of(context)?.mobileNumber}',
                    style:  Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(
                        color: ColorResource.colorE08AF4,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),

                  ),
                  const SizedBox(height: 5),
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
                              const SizedBox(width: 5),
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

                  // // nature of work
                  // WidgetUtils.dropDown(
                  //     context: context,
                  //     lableName: '${Languages.of(context)?.natureOfWork}'
                  //         .toLowerCase(),
                  //     dropDownList: widget.controller!.natureOfWork.obs.value,
                  //     selectedValues:
                  //         widget.controller!.natureOfWorkValue.value,
                  //     onChanged: (value) {
                  //       widget.controller!.updateValuesOnUI(
                  //           value: value,
                  //           variableName: widget.controller!.natureOfWorkValue);
                  //     }),
                  // if (widget.controller!.natureOfWorkValue.value.toLowerCase() == 'other')
                  //   Column(
                  //     children: [
                  //       SizedBox(
                  //         height: 20,
                  //       ),
                  //       WidgetUtils.genericTextFiled(
                  //         context: context,
                  //         controller: widget.controller!.otherNatureController,
                  //         labelName:
                  //             '${Languages.of(context)?.otherNatureOfWork}'
                  //                 .toUpperCase(),
                  //       ),
                  //       Row(
                  //         crossAxisAlignment: CrossAxisAlignment.center,
                  //         children: <Widget>[
                  //           Theme(
                  //             data: Theme.of(context).copyWith(
                  //               unselectedWidgetColor:
                  //                   ColorResource.color00E94F,
                  //             ),
                  //             child: Checkbox(
                  //               value: widget.controller!.iDontHaveBusiness.obs
                  //                   .value.value,
                  //               activeColor: Colors.blue,
                  //               checkColor: ColorResource.color151515,
                  //               onChanged: (value) {
                  //                 widget.controller!
                  //                     .noBusinessCheckBox(values: value);
                  //               },
                  //             ),
                  //           ),
                  //           CustomText(
                  //             text:
                  //                 '${Languages.of(context)?.iHaveABusiness}',
                  //             style: Theme.of(context)
                  //                 .textTheme
                  //                 .titleSmall!
                  //                 .copyWith(
                  //                     color: ColorResource.colorFFFFFF,
                  //                     fontSize: 16,
                  //                     fontWeight: FontWeight.w400),
                  //           ),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // SizedBox(height: 10),
                  //
                  // //industry of work
                  // WidgetUtils.dropDown(
                  //     context: context,
                  //     lableName: '${Languages.of(context)?.industryOfWork}'
                  //         .toLowerCase(),
                  //     dropDownList: widget.controller!.industryOfWork.obs.value,
                  //     selectedValues:
                  //         widget.controller!.industryOfWorkValue.value,
                  //     onChanged: (value) {
                  //       widget.controller!.updateValuesOnUI(
                  //           value: value,
                  //           variableName:
                  //               widget.controller!.industryOfWorkValue);
                  //     }),
                  // if (widget.controller!.industryOfWorkValue.value.toLowerCase() == 'other')
                  //   Column(
                  //     children: [
                  //       SizedBox(
                  //         height: 20,
                  //       ),
                  //       WidgetUtils.genericTextFiled(
                  //         context: context,
                  //         controller:
                  //             widget.controller!.otherIndustryOfWorkController,
                  //         labelName:
                  //             '${Languages.of(context)?.otherIndustryOfWork}'
                  //                 .toUpperCase(),
                  //       ),
                  //     ],
                  //   ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget secondPageForIndividual() {
    return ListView(
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: '${Languages.of(context)?.profileSecondPageContent}',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: ColorResource.colorFFFFFF,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 10),

              // PAN No
              WidgetUtils.genericTextFiled(
                context: context,
                controller: widget.controller!.panNumberController,
                labelName: '${Languages.of(context)?.panNumber}',
                labelStyle: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(
                    color:
                    ColorResource.colorE08AF4,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 5),

              // // Aadhaar No
              // WidgetUtils.genericTextFiled(
              //   context: context,
              //   controller: widget.controller!.aadharNoController,
              //   labelName: '${Languages.of(context)?.aadhaarNumber}',
              //   labelStyle: Theme.of(context)
              //       .textTheme
              //       .titleSmall!
              //       .copyWith(
              //       color:
              //       ColorResource.colorE08AF4,
              //       fontSize: 14,
              //       fontWeight: FontWeight.w500),
              // ),
              // SizedBox(height: 5),

              /// I have GST no
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
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
                      checkColor: ColorResource.color151515,
                      onChanged: (value) {
                        widget.controller!
                            .noBusinessCheckBox(
                            values: value);
                      },
                    ),
                  ),
                  CustomText(
                    text:
                    '${Languages.of(context)?.iHaveAGSTNumber}',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(
                        color:
                        ColorResource.colorFFFFFF,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              WidgetUtils.genericTextFiled(
                context: context,
                controller: widget
                    .controller!.gstController,
                labelName:
                '${Languages.of(context)?.gstNumber}',
                labelStyle: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(
                    color:
                    ColorResource.colorE08AF4,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 5),

              // Full Address
              WidgetUtils.genericTextFiled(
                context: context,
                controller: widget
                    .controller!.gstController,
                labelName:
                '${Languages.of(context)?.fullAddress}',
                labelStyle: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(
                    color:
                    ColorResource.colorE08AF4,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 5),

              // PinCode
              WidgetUtils.genericTextFiled(
                  context: context,
                  controller: widget.controller!.pincodeController,
                  labelName: '${Languages.of(context)?.pincode}',
                  labelStyle: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(
                      color:
                      ColorResource.colorE08AF4,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                  keyBoardType: TextInputType.number),

              // type of address
              WidgetUtils.dropDown(
                  context: context,
                  lableName:
                  '${Languages.of(context)?.typeOfAddress}',
                  dropDownList: widget.controller!.typeOfAddress.obs.value,
                  selectedValues: widget.controller!.typeOfAddressValue.value,
                  onChanged: (value) {
                    widget.controller!.updateValuesOnUI(
                        value: value,
                        variableName: widget.controller!.typeOfAddressValue);
                  }),
              SizedBox(height: 10),

              //  Full Address
              // WidgetUtils.genericTextFiled(
              //     context: context,
              //     controller: widget.controller!.addressController,
              //     labelName:
              //         '${Languages.of(context)?.fullAddress}'.toUpperCase(),
              //     keyBoardType: TextInputType.streetAddress),
              // WidgetUtils.genericTextFiled(
              //     context: context,
              //     controller: widget.controller!.gstController,
              //     labelName:
              //         '${Languages.of(context)?.gstNumber}'.toUpperCase(),
              //     keyBoardType: TextInputType.streetAddress),


              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: <Widget>[
              //     Theme(
              //       data: Theme.of(context).copyWith(
              //         unselectedWidgetColor: ColorResource.color00E94F,
              //       ),
              //       child: Checkbox(
              //         value: widget.controller!.gstNumber.obs.value.value,
              //         activeColor: Colors.blue,
              //         checkColor: ColorResource.color151515,
              //         onChanged: (value) {
              //           widget.controller!.noGSTCheckBox(values: value);
              //         },
              //       ),
              //     ),
              //     CustomText(
              //       text: '${Languages.of(context)?.iHaveAGSTNumber}',
              //       style: Theme.of(context).textTheme.titleSmall!.copyWith(
              //           color: ColorResource.colorFFFFFF,
              //           fontSize: 16,
              //           fontWeight: FontWeight.w400),
              //     ),
              //   ],
              // ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ],
    );
  }
}
