import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/languages/app_languages.dart';
import 'package:roloxmoney/screen/dashboard_screen/dashboard_controller.dart';
import 'package:roloxmoney/screen/dashboard_screen/dashboard_screen.dart';
import 'package:roloxmoney/utils/app_utils.dart';
import 'package:roloxmoney/utils/color_resource.dart';
import 'package:roloxmoney/utils/image_resource.dart';
import 'package:roloxmoney/utils/widget_utils.dart';
import 'package:roloxmoney/widget/custom_button.dart';
import 'package:roloxmoney/widget/custom_text.dart';
import 'package:roloxmoney/widget/rolox_money_widget.dart';

import 'login_profile_controller.dart';

class LoginProfileScreenLarge extends StatefulWidget {
  LoginProfileController? controller;
  GlobalKey<ScaffoldState>? scaffoldKey;

  LoginProfileScreenLarge(
      {Key? key, required this.controller, required this.scaffoldKey})
      : super(key: key);

  @override
  State<LoginProfileScreenLarge> createState() =>
      _LoginProfileScreenLargeState();
}

class _LoginProfileScreenLargeState extends State<LoginProfileScreenLarge> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RoloxMoneyWidgetState(
      rxStatus: widget.controller!.status,
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
            automaticallyImplyLeading: false,
            shadowColor: Colors.grey,
            elevation: 0.0),
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.height / 1.2,
            decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(24)),
            alignment: Alignment.topLeft,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppBar(
                      leadingWidth: 25,
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      leading: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.arrow_back_sharp,
                          size: 25,
                          color: Theme.of(context).textTheme.titleSmall!.color,
                        ),
                      ),
                      centerTitle: false,
                      title: CustomText(
                        text:
                            '${Languages.of(context)?.profile} ${Languages.of(context)?.page}',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      elevation: 0,
                    ),
                    SizedBox(height: 10),
                    // Profile page Content
                    CustomText(
                      text: '${Languages.of(context)?.profilePageContent}',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 30),
                    // Type of Business
                    Container(
                      decoration: BoxDecoration(
                          color: ColorResource.buttonTextColor,
                          boxShadow: ColorResource.boxShadow,
                          border: Border.all(width: 0.25)),
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                            unselectedWidgetColor:
                                Theme.of(context).dividerColor,
                            disabledColor: Theme.of(context).dividerColor),
                        child: ListTile(
                          title: CustomText(
                            text: '${Languages.of(context)?.typeOfBusiness}',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  widget.controller!.businessToggle(
                                      value: TypOfBusiness.individual);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Radio(
                                      value: TypOfBusiness.individual,
                                      groupValue: widget.controller!
                                          .typOfBusiness.obs.value.value,
                                      activeColor:
                                          Theme.of(context).primaryColor,
                                      onChanged: (TypOfBusiness? value) {
                                        widget.controller!.businessToggle(
                                            value: TypOfBusiness.individual);
                                      },
                                    ),
                                    CustomText(
                                      text:
                                          '${Languages.of(context)?.individual}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w300),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(width: 30),
                              GestureDetector(
                                onTap: () {
                                  widget.controller!.businessToggle(
                                      value: TypOfBusiness.business);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Radio(
                                      value: TypOfBusiness.business,
                                      groupValue: widget.controller!
                                          .typOfBusiness.obs.value.value,
                                      activeColor:
                                          Theme.of(context).primaryColor,
                                      onChanged: (TypOfBusiness? value) {
                                        widget.controller!.businessToggle(
                                            value: TypOfBusiness.business);
                                      },
                                    ),
                                    CustomText(
                                      text:
                                          '${Languages.of(context)?.business}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w300),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(width: 30),
                              GestureDetector(
                                onTap: () {
                                  widget.controller!.businessToggle(
                                      value: TypOfBusiness.agency);
                                  showAlertForAgencyFlow();
                                  widget.controller!.businessToggle(
                                      value: TypOfBusiness.business);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Radio(
                                      value: TypOfBusiness.agency,
                                      groupValue: widget.controller!
                                          .typOfBusiness.obs.value.value,
                                      activeColor:
                                          Theme.of(context).primaryColor,
                                      onChanged: (TypOfBusiness? value) {
                                        widget.controller!.businessToggle(
                                            value: TypOfBusiness.agency);
                                        showAlertForAgencyFlow();
                                      },
                                    ),
                                    CustomText(
                                      text: '${Languages.of(context)?.agency}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w300),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          trailing: Image.asset(
                            (widget.controller!.typOfBusiness.obs.value ==
                                    TypOfBusiness.individual)
                                ? ImageResource.businessType
                                : (widget.controller!.typOfBusiness.obs.value ==
                                        TypOfBusiness.business)
                                    ? ImageResource.companyProfileImagePng
                                    : ImageResource.businessType,
                            height: 113,
                            width: 113,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    // Forms filed
                    (widget.controller!.typOfBusiness.obs.value ==
                            TypOfBusiness.individual)
                        ? Form(
                            key: widget.controller!.form,
                            child: Column(
                              children: [
                                WidgetUtils.genericTextFiled(
                                    height: 50,
                                    keyBoardType: TextInputType.name,
                                    context: context,
                                    validationRules: ['required'],
                                    controller:
                                        widget.controller!.firstNameController,
                                    labelName:
                                        '${Languages.of(context)?.fullName}',
                                    hintText:
                                        Languages.of(context)?.fullNameHint),
                                WidgetUtils.genericTextFiled(
                                    height: 50,
                                    context: context,
                                    keyBoardType: TextInputType.emailAddress,
                                    validationRules: ['required', 'email'],
                                    controller:
                                        widget.controller!.emailIDController,
                                    labelName:
                                        '${Languages.of(context)?.emailID}',
                                    hintText:
                                        Languages.of(context)?.emailIdHint),
                                WidgetUtils.genericTextFiled(
                                    height: 50,
                                    context: context,
                                    keyBoardType: TextInputType.name,
                                    controller: widget.controller!.socialId,
                                    labelName:
                                        '${Languages.of(context)?.enterAnyOneSocialMediaIdLabel}',
                                    hintText:
                                        Languages.of(context)?.socialIdHint),
                              ],
                            ),
                          )
                        : (widget.controller!.typOfBusiness.obs.value ==
                                TypOfBusiness.business)
                            ? Form(
                                key: widget.controller!.form,
                                child: Column(
                                  children: [
                                    // Company Name
                                    WidgetUtils.genericTextFiled(
                                        height: 50,
                                        keyBoardType: TextInputType.name,
                                        context: context,
                                        validationRules: ['required'],
                                        controller: widget
                                            .controller!.companyNameController,
                                        labelName:
                                            '${Languages.of(context)?.companyName}',
                                        hintText:
                                            '${Languages.of(context)?.enter} ${Languages.of(context)?.companyName}'),
                                    // Company Email ID
                                    WidgetUtils.genericTextFiled(
                                        height: 50,
                                        context: context,
                                        keyBoardType:
                                            TextInputType.emailAddress,
                                        validationRules: ['required', 'email'],
                                        controller: widget
                                            .controller!.emailIDController,
                                        labelName:
                                            '${Languages.of(context)?.contact}  ${Languages.of(context)?.emailID}',
                                        hintText:
                                            Languages.of(context)?.emailIdHint),
                                    // Company Pan Number
                                    WidgetUtils.genericTextFiled(
                                        height: 50,
                                        context: context,
                                        keyBoardType: TextInputType.name,
                                        validationRules: ['required'],
                                        controller: widget
                                            .controller!.panNumberController,
                                        labelName:
                                            '${Languages.of(context)?.panNumber}',
                                        hintText:
                                            '${Languages.of(context)?.panNumberHint}'),
                                    // aadhaar Numberƒ
                                    WidgetUtils.genericTextFiled(
                                        height: 50,
                                        context: context,
                                        maximumWordCount: 14,
                                        keyBoardType: TextInputType.text,
                                        validationRules: [
                                          'required',
                                          'number_only'
                                        ],
                                        // inputformaters: [
                                        //   CustomAadhaarInputFormatter()
                                        // ],
                                        controller: widget.controller!
                                            .contactPersonNameController,
                                        labelName: 'Contact person name',
                                        hintText:
                                            'Enter the contact person name'),
                                    // GST Number
                                    WidgetUtils.genericTextFiled(
                                        height: 50,
                                        context: context,
                                        keyBoardType: TextInputType.name,
                                        validationRules: ['required'],
                                        controller: widget
                                            .controller!.gstNumberController,
                                        labelName:
                                            '${Languages.of(context)?.gstNumber}',
                                        hintText:
                                            '${Languages.of(context)?.gstNumberHint}'),
                                    // social id

                                    WidgetUtils.genericTextFiled(
                                        height: 50,
                                        context: context,
                                        keyBoardType: TextInputType.name,
                                        controller: widget.controller!.socialId,
                                        labelName:
                                            '${Languages.of(context)?.enterAnyOneSocialMediaIdLabel}',
                                        hintText: Languages.of(context)
                                            ?.socialIdHint),
                                  ],
                                ),
                              )
                            : Form(
                                key: widget.controller!.form,
                                child: Column(
                                  children: [
                                    // Company Name
                                    WidgetUtils.genericTextFiled(
                                        height: 50,
                                        keyBoardType: TextInputType.name,
                                        context: context,
                                        validationRules: ['required'],
                                        controller: widget
                                            .controller!.companyNameController,
                                        labelName:
                                            '${Languages.of(context)?.companyName}',
                                        hintText:
                                            '${Languages.of(context)?.enter} ${Languages.of(context)?.companyName}'),
                                    // Company Email ID
                                    WidgetUtils.genericTextFiled(
                                        height: 50,
                                        context: context,
                                        keyBoardType:
                                            TextInputType.emailAddress,
                                        validationRules: ['required', 'email'],
                                        controller: widget
                                            .controller!.emailIDController,
                                        labelName:
                                            '${Languages.of(context)?.contact}  ${Languages.of(context)?.emailID}',
                                        hintText:
                                            Languages.of(context)?.emailIdHint),
                                    // Company Pan Number
                                    WidgetUtils.genericTextFiled(
                                        height: 50,
                                        context: context,
                                        keyBoardType: TextInputType.name,
                                        validationRules: ['required'],
                                        controller: widget
                                            .controller!.panNumberController,
                                        labelName:
                                            '${Languages.of(context)?.panNumber}',
                                        hintText:
                                            '${Languages.of(context)?.panNumberHint}'),
                                    // aadhaar Number
                                    WidgetUtils.genericTextFiled(
                                        height: 50,
                                        context: context,
                                        maximumWordCount: 14,
                                        keyBoardType: TextInputType.number,
                                        validationRules: [
                                          'required',
                                          'number_only'
                                        ],
                                        inputformaters: [
                                          CustomAadhaarInputFormatter()
                                        ],
                                        controller: widget.controller!
                                            .contactPersonNameController,
                                        labelName:
                                            '${Languages.of(context)?.aadhaarNumber}',
                                        hintText:
                                            '${Languages.of(context)?.aadhaarNumberHint}'),
                                    // GST Number
                                    WidgetUtils.genericTextFiled(
                                        height: 50,
                                        context: context,
                                        keyBoardType: TextInputType.name,
                                        validationRules: ['required'],
                                        controller: widget
                                            .controller!.gstNumberController,
                                        labelName:
                                            '${Languages.of(context)?.gstNumber}',
                                        hintText:
                                            '${Languages.of(context)?.gstNumberHint}'),
                                    // social id
                                    WidgetUtils.genericTextFiled(
                                        height: 50,
                                        context: context,
                                        keyBoardType: TextInputType.name,
                                        controller: widget.controller!.socialId,
                                        labelName:
                                            '${Languages.of(context)?.enterAnyOneSocialMediaIdLabel}',
                                        hintText: Languages.of(context)
                                            ?.socialIdHint),
                                  ],
                                ),
                              ),
                    const SizedBox(
                      height: 15,
                    ),
                    PrimaryButton(
                      '${Languages.of(context)!.continueText}',
                      context,
                      cardShape: 1,
                      isIcon: true,
                      fontSize: 20,
                      onTap: () {
                        if (widget.controller!.form.currentState!.validate()) {
                          if (widget
                                  .controller!.typOfBusiness.obs.value.value ==
                              TypOfBusiness.agency) {
                            showAlertForAgencyFlow();
                          } else {
                            widget.controller!.singUpNewUser();
                          }

                          // if (widget.controller!.typOfBusiness.obs.value.value == TypOfBusiness.business) {
                          //   Get.put(BusinessProfileController());
                          //   Get.toNamed(BusinessProfileScreen.routeName);
                          // } else if (widget
                          //         .controller!.typOfBusiness.obs.value.value ==
                          //     TypOfBusiness.individual) {
                          //   Get.put(IndividualProfileController());
                          //   Get.toNamed(IndividualProfileScreen.routeName);
                          // } else {
                          //   showAlertForAgencyFlow();
                          // }
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
    );
  }

  showAlertForAgencyFlow() {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          insetPadding: EdgeInsets.symmetric(horizontal: 450),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: ColorResource.borderColor, width: 2),
            borderRadius: BorderRadius.circular(30),
          ),
          title: MediaQuery.removePadding(
            removeTop: true,
            removeBottom: true,
            removeLeft: true,
            removeRight: true,
            context: context,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                      widget.controller!
                          .businessToggle(value: TypOfBusiness.business);
                    },
                    icon: Icon(
                      Icons.close,
                      color: ColorResource.closeIconColor,
                    ))
              ],
            ),
          ),
          content: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    ImageResource.agencyAlertImage,
                    height: 240,
                    width: 160,
                  ),
                ),
                SizedBox(height: 20),
                CustomText(
                  text: '${Languages.of(context)?.oopsAgency}',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 10),
                CustomText(
                  text: '${Languages.of(context)?.oopsAgencyMessage}',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 20,
                ),
                PrimaryButton(
                  '${Languages.of(context)!.continueText}',
                  context,
                  cardShape: 1,
                  isIcon: true,
                  fontSize: 20,
                  onTap: () {
                    Get.put(DashboardController());
                    Get.offAll(DashboardScreen());
                  },
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
