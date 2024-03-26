import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/languages/app_languages.dart';
import 'package:roloxmoney/screen/individual_profile_screen/individual_profile_controller.dart';
import 'package:roloxmoney/utils/app_utils.dart';
import 'package:roloxmoney/utils/color_resource.dart';
import 'package:roloxmoney/utils/image_resource.dart';
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
            backgroundColor: ColorResource.colorFFFFFF,
            resizeToAvoidBottomInset: true,
            body: Container(
              color: ColorResource.colorFFFFFF,
              alignment: Alignment.topLeft,
              child: ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  AppBar(
                      backgroundColor: ColorResource.colorFFFFFF,
                      leading: GestureDetector(
                        onTap: () {
                          if (widget.controller!.currentStep.obs.value == 2) {
                            widget.controller!.stepCount(values: 1);
                          } else {
                            Get.back();
                          }
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
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                          children: <InlineSpan>[
                            TextSpan(
                              text: '(${Languages.of(context)?.individual})',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      color: ColorResource.color0D0D0D,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                            )
                          ])),
                      shadowColor: Colors.grey,
                      elevation: 0.3),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    alignment: Alignment.center,
                    child: NumberStepper(
                      totalSteps: 2,
                      width: MediaQuery.of(context).size.width / 1.5,
                      currentStep:
                          widget.controller!.currentStep.obs.value.value,
                      stepCompleteColor: Colors.white,
                      currentStepColor: Color(0xffdbecff),
                      inactiveColor: Color(0xffbababa),
                      lineWidth: 0.5,
                    ),
                  ),
                  Form(
                    key: widget.controller!.form,
                    child: Container(
                      height: 650,
                      // ignore: unrelated_type_equality_checks
                      child: widget.controller!.currentStep.obs.value == 1
                          ? firstPageForIndividual()
                          : secondPageForIndividual(),
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(8.0),
              child: PrimaryButton(
                '${Languages.of(context)!.continueText}',
                context,
                cardShape: 1,
                isIcon: true,
                textColor: ColorResource.colorFFFFFF,
                fontSize: 20,
                onTap: () {
                  debugPrint(
                      'screen-->${widget.controller!.currentStep.obs.value}');

                  widget.controller!.validatingProfile();
                },
              ),
            )),
      ),
    );
  }

  Widget firstPageForIndividual() {
    String profileImage = "";
    return StatefulBuilder(builder: (context, setState) {
      return ListView(
        shrinkWrap: true,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                CustomText(
                  text: '${Languages.of(context)?.profileScreenFreeContent}',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    AppUtils.getPic("Camera").then((value) {
                      print("value is $value");
                      setState(() {
                        profileImage = value;
                      });
                    });
                  },
                  child: Center(
                    child: Container(
                      height: 120,
                      width: 120,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: ColorResource.dividerColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(60)),
                      child: profileImage.isNotEmpty
                          ? Image.file(File(profileImage))
                          : Stack(children: [
                              Center(
                                  child: Image.asset(
                                ImageResource.contactAddIcon,
                                color: ColorResource.buttonTextColor,
                              )),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(ImageResource.addPhotoIcon,
                                      color: ColorResource.textSecondaryColor,
                                      height: 30,
                                      width: 30),
                                  SizedBox(height: 10),
                                  Text(
                                    '${Languages.of(context)!.addProfilePhoto}'
                                        .capitalizeFirst!,
                                    style: TextStyle(
                                      color: ColorResource.textSecondaryColor,
                                    ),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),

                              // )
                            ], alignment: Alignment.center),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30),
                    // model of work
                    WidgetUtils.dropDown(
                        context: context,
                        lableName: '${Languages.of(context)?.modelOfWork}',
                        dropDownList: widget.controller!.modelOfWork.obs.value,
                        selectedValues:
                            widget.controller!.modelOfWorkValue.value,
                        onChanged: (value) {
                          widget.controller!.updatedModelOfWorkValue(value);
                        }),
                    SizedBox(height: 20),
                    // nature of business
                    WidgetUtils.dropDown(
                        context: context,
                        lableName: '${Languages.of(context)?.natureOfBusiness}',
                        dropDownList:
                            widget.controller!.natureOfBusiness.obs.value,
                        selectedValues:
                            widget.controller!.natureOfBusinessValue.value,
                        onChanged: (value) {
                          widget.controller!.updateNatureOfBusinessValue(value);
                        }),
                    SizedBox(height: 10),
                    if (widget.controller!.natureOfBusinessValue.value
                            .toLowerCase() ==
                        'others')
                      WidgetUtils.genericTextFiled(
                          context: context,
                          validationRules: ['required'],
                          controller: widget.controller!.plsIfSpecifyController,
                          labelName: '${Languages.of(context)?.plsIfSpecify}',
                          labelStyle: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  color: ColorResource.color020e36,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                          hintText: '${Languages.of(context)!.enterYourWork}'),
                    // nature of work
                    WidgetUtils.dropDown(
                        context: context,
                        lableName: '${Languages.of(context)?.natureOfWork}',
                        dropDownList: widget.controller!.natureOfWork.obs.value,
                        selectedValues:
                            widget.controller!.natureOfWorkValue.value,
                        onChanged: (value) {
                          widget.controller!.updateNatureOfWork(value);
                        }),
                    SizedBox(height: 10),
                    if (widget.controller!.natureOfWorkValue.value
                            .toLowerCase() ==
                        'others')
                      WidgetUtils.genericTextFiled(
                          context: context,
                          validationRules: ['required'],
                          controller: widget.controller!
                              .plsIfSpecifyControllerForNatureOfWork,
                          labelName: '${Languages.of(context)?.plsIfSpecify}',
                          labelStyle: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  color: ColorResource.color020e36,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                          hintText: '${Languages.of(context)!.enterYourWork}'),
                    // mobile no
                    CustomText(
                      text: '${Languages.of(context)?.mobileNumber}',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: ColorResource.colorEC008C,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  // mobile no
                  CustomText(
                    text:
                        '${Languages.of(context)?.alternate} ${Languages.of(context)?.mobileNumber}',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: ColorResource.colorEC008C,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    child: CustomTextField(
                      widget.controller!.mobilNumberController.obs.value,
                      focusedBorder: Colors.grey,
                      textColor: ColorResource.color020e36,
                      enableColor: Colors.grey,
                      borderColor: Colors.grey,
                      disableColor: Colors.grey,
                      keyBoardType: TextInputType.phone,
                      validationRules: ['required'],
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
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
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
                                  color: ColorResource.colorDDDDDD,
                                )
                              ],
                            ),
                          ),
                        ),
                        isEnable: false,
                      ),
                      height: 70,
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ],
      );
    });
  }

  Widget secondPageForIndividual() {
    return ListView(shrinkWrap: true, children: [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomText(
            text: '${Languages.of(context)?.profileSecondPageContent}',
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 10),
          // PAN No
          WidgetUtils.genericTextFiled(
              context: context,
              validationRules: ['required'],
              controller: widget.controller!.panNumberController,
              labelName: '${Languages.of(context)?.panNumber}',
              labelStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: ColorResource.color020e36,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
              hintText: '${Languages.of(context)?.panNumberHint}'),
          // I have GST no
          ListTile(
            visualDensity: VisualDensity(horizontal: -4, vertical: -4),
            contentPadding: EdgeInsets.zero,
            dense: true,
            leading: Theme(
              data: Theme.of(context).copyWith(
                unselectedWidgetColor: ColorResource.color00E94F,
              ),
              child: Checkbox(
                value: widget.controller!.iDontHaveBusiness.obs.value.value,
                activeColor: ColorResource.colorEC008C,
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                checkColor: ColorResource.colorFFFFFF,
                onChanged: (value) {
                  widget.controller!.noBusinessCheckBox(values: value);
                },
              ),
            ),
            title: CustomText(
              text: '${Languages.of(context)?.iHaveAGSTNumber}',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: ColorResource.color020e36,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
          ),
          if (widget.controller!.iDontHaveBusiness.obs.value.value)
            WidgetUtils.genericTextFiled(
                context: context,
                validationRules: ['required'],
                controller: widget.controller!.gstController,
                labelName: '${Languages.of(context)?.gstNumber}',
                labelStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: ColorResource.color020e36,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
                hintText: '${Languages.of(context)?.gstNumberHint}'),

          SizedBox(height: 5),
          // Full Address
          WidgetUtils.genericTextFiled(
              context: context,
              maxLines: 20,
              minLines: 1,
              height: 150,
              validationRules: ['required'],
              keyBoardType: TextInputType.multiline,
              controller: widget.controller!.addressController,
              labelName: '${Languages.of(context)?.fullAddress}',
              labelStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: ColorResource.color020e36,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
              hintText: '${Languages.of(context)?.enterYourAddressHintText}',
              textAlignVertical: TextAlignVertical.top),
          SizedBox(height: 5),
          // PinCode
          WidgetUtils.genericTextFiled(
              context: context,
              validationRules: ['required'],
              controller: widget.controller!.pincodeController,
              labelName: '${Languages.of(context)?.pincode}',
              labelStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: ColorResource.color020e36,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
              keyBoardType: TextInputType.number),
          SizedBox(height: 5),
          // type of address
          WidgetUtils.dropDown(
              context: context,
              lableName: '${Languages.of(context)?.typeOfAddress}',
              dropDownList: widget.controller!.typeOfAddress.obs.value,
              selectedValues: widget.controller!.typeOfAddressValue.value,
              onChanged: (value) {
                widget.controller!.updateValuesOnUI(
                    value: value,
                    variableName: widget.controller!.typeOfAddressValue);
              }),
          SizedBox(height: 60),
        ]),
      )
    ]);
  }
}
