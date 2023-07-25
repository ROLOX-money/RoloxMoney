import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/languages/app_languages.dart';
import 'package:roloxmoney/screen/dashboard_screen/dashboard_controller.dart';
import 'package:roloxmoney/screen/dashboard_screen/dashboard_screen.dart';
import 'package:roloxmoney/utils/color_resource.dart';
import 'package:roloxmoney/utils/image_resource.dart';
import 'package:roloxmoney/utils/widget_utils.dart';
import 'package:roloxmoney/widget/custom_button.dart';
import 'package:roloxmoney/widget/custom_text.dart';
import 'package:roloxmoney/widget/custom_textfield.dart';
import 'package:roloxmoney/widget/rolox_money_widget.dart';
import 'package:roloxmoney/widget/stepper_view.dart';

import 'individual_profile_controller.dart';

class IndividualProfileScreenLarge extends StatefulWidget {
  IndividualProfileController? controller;
  GlobalKey<ScaffoldState>? scaffoldKey;

  IndividualProfileScreenLarge(
      {Key? key, required this.controller, required this.scaffoldKey})
      : super(key: key);

  @override
  State<IndividualProfileScreenLarge> createState() =>
      _IndividualProfileScreenLargeState();
}

class _IndividualProfileScreenLargeState
    extends State<IndividualProfileScreenLarge> {
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
              height: MediaQuery.of(context).size.height / 1.2,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: ColorResource.color1B2023,
                  borderRadius: BorderRadius.all(Radius.circular(24))),
              alignment: Alignment.topLeft,
              child: ListView(
                shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                children: [
                  AppBar(
                    backgroundColor: ColorResource.color1B2023,
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
                    centerTitle: false,
                    title: Text.rich(TextSpan(
                        text:
                            '${Languages.of(context)?.profile} ${Languages.of(context)?.page} ',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
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
                    elevation: 0.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    alignment: Alignment.center,
                    child: NumberStepper(
                      totalSteps: 2,
                      width: MediaQuery.of(context).size.width / 5,
                      currentStep:
                          widget.controller!.currentStep.obs.value.value,
                      stepCompleteColor: Colors.blue,
                      currentStepColor: Color(0xffdbecff),
                      inactiveColor: Color(0xffbababa),
                      lineWidth: 1,
                    ),
                  ),
                  SizedBox(height: 10),
                  Form(
                    key: widget.controller!.form,
                    child: Container(
                      // height: 650,
                      // ignore: unrelated_type_equality_checks
                      child: widget.controller!.currentStep.obs.value == 1
                          ? firstPageForIndividual()
                          : secondPageForIndividual(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: PrimaryButton(
                      '${Languages.of(context)!.continueText}',
                      context,
                      cardShape: 1,
                      isIcon: true,
                      textColor: ColorResource.black,
                      fontSize: 20,
                      onTap: () {
                        if (widget.controller!.form.currentState!.validate()) {
                          if (widget.controller!.currentStep.obs.value.value !=
                              2) {
                            widget.controller!.stepCount(
                                values: widget.controller!.currentStep.obs.value
                                        .value +
                                    1);
                          } else {
                            Get.put(DashboardController());
                            Get.offAll(DashboardScreen());
                          }
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          backgroundColor: Theme.of(context).backgroundColor,
        ),
      ),
    );
  }

  Widget firstPageForIndividual() {
    return ListView(
      shrinkWrap: true,
      children: [
        SizedBox(height: 30),
        Center(
          child: CustomText(
            text: '${Languages.of(context)?.profileScreenFreeContent}',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: ColorResource.colorFFFFFF,
                fontSize: 16,
                fontWeight: FontWeight.w400),
          ),
        ),
        SizedBox(height: 20),
        GestureDetector(
          onTap: () {},
          child: Center(
            child: Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                  color: ColorResource.black,
                  borderRadius: BorderRadius.circular(60)),
              child: Stack(children: [
                Center(
                    child: Image.asset(
                  ImageResource.contactAddIcon,
                )),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(ImageResource.addPhotoIcon,
                        height: 30, width: 30),
                    SizedBox(height: 10),
                    Text(
                      Languages.of(context)!.addProfilePhoto,
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ]),
            ),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                // nature of business
                WidgetUtils.dropDown(
                    context: context,
                    lableName: '${Languages.of(context)?.natureOfBusiness}',
                    dropDownList: widget.controller!.natureOfBusiness.obs.value,
                    selectedValues:
                        widget.controller!.natureOfBusinessValue.value,
                    onChanged: (value) {
                      widget.controller!.updateValuesOnUI(
                          value: value,
                          variableName:
                              widget.controller!.natureOfBusinessValue);
                    }),
                SizedBox(height: 10),
                if (widget.controller!.natureOfBusinessValue.value
                        .toLowerCase() ==
                    'other')
                  WidgetUtils.genericTextFiled(
                    context: context,
                    validationRules: ['required'],
                    controller: widget.controller!.plsIfSpecifyController,
                    labelName: '${Languages.of(context)?.plsIfSpecify}',
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
                    lableName: '${Languages.of(context)?.natureOfWork}',
                    dropDownList: widget.controller!.natureOfWork.obs.value,
                    selectedValues: widget.controller!.natureOfWorkValue.value,
                    onChanged: (value) {
                      widget.controller!.updateValuesOnUI(
                          value: value,
                          variableName: widget.controller!.natureOfWorkValue);
                    }),
                SizedBox(height: 10),
                if (widget.controller!.natureOfWorkValue.value == 'other')
                  WidgetUtils.genericTextFiled(
                    context: context,
                    validationRules: ['required'],
                    controller: widget
                        .controller!.plsIfSpecifyControllerForNatureOfWork,
                    labelName: '${Languages.of(context)?.plsIfSpecify}',
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
                  text: '${Languages.of(context)?.mobileNumber}',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: ColorResource.colorE08AF4,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  child: CustomTextField(
                    widget.controller!.mobilNumberController.obs.value,
                    focusedBorder: Colors.grey,
                    textColor: Colors.white,
                    enableColor: Colors.grey,
                    borderColor: Colors.red,
                    disableColor: Colors.red,
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
                                      fontWeight: FontWeight.w400),
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
                              color: ColorResource.colorDDDDDD,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  height: 70,
                ),
                const SizedBox(height: 5),
              ]),
        )
      ],
    );
  }

  Widget secondPageForIndividual() {
    return ListView(shrinkWrap: true, children: [
      Padding(
          padding: const EdgeInsets.all(16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            CustomText(
              text: '${Languages.of(context)?.profileSecondPageContent}',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: ColorResource.colorFFFFFF,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 20),
            // PAN No
            WidgetUtils.genericTextFiled(
              context: context,
              validationRules: ['required'],
              controller: widget.controller!.panNumberController,
              labelName: '${Languages.of(context)?.panNumber}',
              labelStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: ColorResource.colorE08AF4,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
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
                  activeColor: Colors.blue,
                  checkColor: ColorResource.color151515,
                  onChanged: (value) {
                    widget.controller!.noBusinessCheckBox(values: value);
                  },
                ),
              ),
              title: CustomText(
                text: '${Languages.of(context)?.iHaveAGSTNumber}',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: ColorResource.colorFFFFFF,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            ),
            WidgetUtils.genericTextFiled(
              context: context,
              validationRules: ['required'],
              controller: widget.controller!.gstController,
              labelName: '${Languages.of(context)?.gstNumber}',
              labelStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: ColorResource.colorE08AF4,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 5),
            // Full Address
            WidgetUtils.genericTextFiled(
              context: context,
              maxLines: 20,
              minLines: 10,
              validationRules: ['required'],
              controller: widget.controller!.addressController,
              labelName: '${Languages.of(context)?.fullAddress}',
              labelStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: ColorResource.colorE08AF4,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 5),
            // PinCode
            WidgetUtils.genericTextFiled(
                context: context,
                validationRules: ['required'],
                controller: widget.controller!.pincodeController,
                labelName: '${Languages.of(context)?.pincode}',
                labelStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: ColorResource.colorE08AF4,
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
            SizedBox(height: 10),
          ]))
    ]);
  }
}
