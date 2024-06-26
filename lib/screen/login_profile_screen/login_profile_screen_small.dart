import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/languages/app_languages.dart';
import 'package:roloxmoney/screen/login_profile_screen/login_profile_controller.dart';
import 'package:roloxmoney/utils/color_resource.dart';
import 'package:roloxmoney/utils/image_resource.dart';
import 'package:roloxmoney/utils/widget_utils.dart';
import 'package:roloxmoney/widget/custom_button.dart';
import 'package:roloxmoney/widget/custom_text.dart';
import 'package:roloxmoney/widget/rolox_money_widget.dart';

/*Chinnadurai Viswanathan*/
// ignore: must_be_immutable
class LoginProfileScreenSmall extends StatefulWidget {
  LoginProfileController? controller;
  GlobalKey<ScaffoldState>? scaffoldKey;

  LoginProfileScreenSmall(
      {Key? key, required this.controller, required this.scaffoldKey})
      : super(key: key);

  @override
  LoginProfileScreenSmallState createState() => LoginProfileScreenSmallState();
}

class LoginProfileScreenSmallState extends State<LoginProfileScreenSmall> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RoloxMoneyWidgetState(
      rxStatus: widget.controller!.status,
      child: Scaffold(
        body: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          alignment: Alignment.topLeft,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBar(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  leading: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back_sharp,
                      size: 28,
                      color: Theme.of(context).textTheme.titleSmall!.color,
                    ),
                  ),
                  centerTitle: true,
                  title: CustomText(
                    text:
                        '${Languages.of(context)?.profile} ${Languages.of(context)?.page}',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  shadowColor: Colors.grey,
                  elevation: 0.3,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      // Profile page Content
                      CustomText(

                        text: '${Languages.of(context)?.profilePageContent}',
                        style: TextStyle(
                            color: ColorResource.textColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),

//                           text: '${Languages.of(context)?.profilePageContent}',
//                           style: Theme.of(context)
//                               .textTheme
//                               .titleSmall!
//                               .copyWith(
//                                   color: ColorResource.color8B8B8B,
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w400),
//                           fontSize: 16,
//                           fontWeight: FontWeight.w400),
                      const SizedBox(
                        height: 15,
                      ),
                      // Type of Business
                      Container(
                        decoration: BoxDecoration(
                            boxShadow: ColorResource.boxShadow,
                            color: ColorResource.buttonTextColor),
                        padding: EdgeInsets.all(10.0),
                        child: Theme(
                          data: Theme.of(context).copyWith(
                              unselectedWidgetColor:
                                  Theme.of(context).dividerColor,
                              disabledColor: Theme.of(context).dividerColor),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text:
                                    '${Languages.of(context)?.typeOfBusiness}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          widget.controller!.clearData();
                                          widget.controller!.businessToggle(
                                              value: TypOfBusiness.individual);
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Radio(
                                              value: TypOfBusiness.individual,
                                              groupValue: widget
                                                  .controller!
                                                  .typOfBusiness
                                                  .obs
                                                  .value
                                                  .value,
                                              activeColor: Theme.of(context)
                                                  .primaryColor,
                                              onChanged:
                                                  (TypOfBusiness? value) {
                                                widget.controller!
                                                    .businessToggle(
                                                        value: TypOfBusiness
                                                            .individual);
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
                                                      fontWeight:
                                                          FontWeight.w400),
                                            )
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          widget.controller!.clearData();
                                          widget.controller!.businessToggle(
                                              value: TypOfBusiness.business);
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Radio(
                                              value: TypOfBusiness.business,
                                              groupValue: widget
                                                  .controller!
                                                  .typOfBusiness
                                                  .obs
                                                  .value
                                                  .value,
                                              activeColor: Theme.of(context)
                                                  .primaryColor,
                                              onChanged:
                                                  (TypOfBusiness? value) {
                                                widget.controller!
                                                    .businessToggle(
                                                        value: TypOfBusiness
                                                            .business);
                                              },
                                            ),
                                            CustomText(
                                              text:
                                                  '${Languages.of(context)?.business}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall!
                                                  .copyWith(
                                                      color: ColorResource
                                                          .color272727,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400),
                                            )
                                          ],
                                        ),
                                      ),
                                      // TODO -> Agency Flow Future update
                                      /*GestureDetector(
                                        onTap: () {
                                          widget.controller!.businessToggle(
                                              value: TypOfBusiness.agency);
                                          WidgetUtils.showAlertDialog(
                                              context: context);
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Radio(
                                              value: TypOfBusiness.agency,
                                              groupValue: widget
                                                  .controller!
                                                  .typOfBusiness
                                                  .obs
                                                  .value
                                                  .value,
                                              activeColor: Theme.of(context)
                                                  .primaryColor,
                                              onChanged:
                                                  (TypOfBusiness? value) {
                                                widget.controller!
                                                    .businessToggle(
                                                        value: TypOfBusiness
                                                            .agency);
                                                WidgetUtils.showAlertDialog(
                                                    context: context,
                                                    iconButtonOnPressed: () {
                                                      Get.back();
                                                      widget.controller!
                                                          .businessToggle(
                                                              value:
                                                                  TypOfBusiness
                                                                      .business);
                                                    },
                                                    primaryButtonOnTap: () {
                                                      Get.put(
                                                          DashboardController());
                                                      Get.offAll(
                                                          DashboardScreen());
                                                    });
                                              },
                                            ),
                                            CustomText(
                                              text:
                                                  '${Languages.of(context)?.agency}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall!
                                                  .copyWith(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400),
                                            )
                                          ],
                                        ),
                                      ),*/
                                    ],
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.only(right: 19),
                                    child: Image.asset(
                                      (widget.controller!.typOfBusiness.obs
                                                  .value ==
                                              TypOfBusiness.individual)
                                          ? ImageResource.businessType
                                          : ImageResource
                                              .companyProfileImagePng,
                                      // TODO -> Agency Flow Future update
                                      /*: (widget.controller!.typOfBusiness
                                                  .obs.value ==
                                              TypOfBusiness.business)
                                          ?ImageResource
                                          .companyProfileImagePng,
                                      : ImageResource.businessType*/
                                      height: 113,
                                      width: 113,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
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
                                      controller: widget
                                          .controller!.firstNameController,
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
                                  SizedBox(height: 50)
                                  /*WidgetUtils.genericTextFiled(

                                      height: 50,
                                      context: context,
                                      keyBoardType: TextInputType.name,
                                      controller: widget.controller!.socialId,
                                      labelName:
                                          '${Languages.of(context)?.enterAnyOneSocialMediaIdLabel}',
                                      hintText:

                                          Languages.of(context)?.socialIdHint),

                                          Languages.of(context)?.socialIdHint),*/

                                ],
                              ),
                            )
                          : (widget.controller!.typOfBusiness.obs.value ==
                                  TypOfBusiness.business)
                              ? Form(
                                  key: widget.controller!.form,

                                  child: Column(children: [
                                    // Company Name
                                    WidgetUtils.genericTextFiled(
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
                                        context: context,
                                        keyBoardType: TextInputType.number,
                                        validationRules: ['required'],
                                        controller: widget.controller!
                                            .contactPersonNameController,
                                        labelName:
                                            '${Languages.of(context)?.aadhaarNumber}',
                                        hintText:
                                            '${Languages.of(context)?.aadhaarNumberHint}'),
                                    // GST Number
                                    WidgetUtils.genericTextFiled(
                                        context: context,
                                        keyBoardType: TextInputType.name,
                                        validationRules: ['required'],
                                        controller: widget
                                            .controller!.gstNumberController,
                                        labelName:
                                            '${Languages.of(context)?.gstNumber}',
                                        hintText:
                                            '${Languages.of(context)?.gstNumberHint}'),
                                    // Social Id
                                    WidgetUtils.genericTextFiled(
                                        context: context,
                                        keyBoardType: TextInputType.name,
                                        controller: widget.controller!.socialId,
                                        labelName:
                                            '${Languages.of(context)?.enterAnyOneSocialMediaIdLabel}',
                                        hintText: Languages.of(context)
                                            ?.socialIdHint),
                                  ]),
//                                   child: Column(
//                                     children: [
//                                       // Company Name
//                                       WidgetUtils.genericTextFiled(
//                                           keyBoardType: TextInputType.name,
//                                           context: context,
//                                           validationRules: ['required'],
//                                           controller: widget.controller!
//                                               .companyNameController,
//                                           labelName:
//                                               '${Languages.of(context)?.companyName}',
//                                           hintText:
//                                               '${Languages.of(context)?.enter} ${Languages.of(context)?.companyName}'),
//                                       // Company Email ID
//                                       WidgetUtils.genericTextFiled(
//                                           context: context,
//                                           keyBoardType:
//                                               TextInputType.emailAddress,
//                                           validationRules: [
//                                             'required',
//                                             'email'
//                                           ],
//                                           controller: widget
//                                               .controller!.emailIDController,
//                                           labelName:
//                                               '${Languages.of(context)?.contact}  ${Languages.of(context)?.emailID}',
//                                           hintText: Languages.of(context)
//                                               ?.emailIdHint),
//                                       // Company Pan Number
//                                       WidgetUtils.genericTextFiled(
//                                           context: context,
//                                           keyBoardType: TextInputType.name,
//                                           validationRules: ['required'],
//                                           controller: widget
//                                               .controller!.panNumberController,
//                                           labelName:
//                                               '${Languages.of(context)?.panNumber}',
//                                           hintText:
//                                               '${Languages.of(context)?.panNumberHint}'),
//                                       // aadhaar Number
//                                       /* WidgetUtils.genericTextFiled(
//                                           context: context,
//                                           keyBoardType: TextInputType.number,
//                                           validationRules: ['required'],
//                                           controller: widget.controller!
//                                               .contactPersonNameController,
//                                           labelName: 'Contact person name',
//                                           hintText:
//                                               'Enter the contact person name'),*/
//                                       // GST Number
//                                       WidgetUtils.genericTextFiled(
//                                           context: context,
//                                           keyBoardType: TextInputType.name,
//                                           validationRules: ['required'],
//                                           controller: widget
//                                               .controller!.gstNumberController,
//                                           labelName:
//                                               '${Languages.of(context)?.gstNumber}',
//                                           hintText:
//                                               '${Languages.of(context)?.gstNumberHint}'),

//                                       /*WidgetUtils.genericTextFiled(
//                                           context: context,
//                                           keyBoardType: TextInputType.name,
//                                           validationRules: ['required'],
//                                           controller:
//                                               widget.controller!.address1,
//                                           labelName:
//                                               '${Languages.of(context)?.fullAddress}',
//                                           hintText:
//                                               '${Languages.of(context)?.fullAddress}'),

//                                       WidgetUtils.genericTextFiled(
//                                           context: context,
//                                           keyBoardType: TextInputType.name,
//                                           validationRules: ['required'],
//                                           controller:
//                                               widget.controller!.address2,
//                                           labelName:
//                                               '${Languages.of(context)?.fullAddress}',
//                                           hintText:
//                                               '${Languages.of(context)?.fullAddress}'),

//                                       WidgetUtils.genericTextFiled(
//                                           context: context,
//                                           keyBoardType: TextInputType.number,
//                                           validationRules: ['required'],
//                                           controller:
//                                               widget.controller!.pinCode,
//                                           labelName:
//                                               '${Languages.of(context)?.pincode}',
//                                           hintText:
//                                               '${Languages.of(context)?.pincode}'),
//                                       social id
//                                       WidgetUtils.genericTextFiled(
//                                           context: context,
//                                           keyBoardType: TextInputType.name,
//                                           controller:
//                                               widget.controller!.socialId,
//                                           labelName:
//                                               '${Languages.of(context)?.enterAnyOneSocialMediaIdLabel}',
//                                           hintText: Languages.of(context)
//                                               ?.socialIdHint),*/
//                                     ],
//                                   ),
                                )
                              : Form(
                                  key: widget.controller!.form,
                                  child: Column(
                                    children: [
                                      // Company Name
                                      WidgetUtils.genericTextFiled(
                                          keyBoardType: TextInputType.name,
                                          context: context,
                                          validationRules: ['required'],
                                          controller: widget.controller!
                                              .companyNameController,
                                          labelName:
                                              '${Languages.of(context)?.companyName}',
                                          hintText: Languages.of(context)
                                              ?.companyName),
                                      // Company Email ID
                                      WidgetUtils.genericTextFiled(
                                          context: context,
                                          keyBoardType:
                                              TextInputType.emailAddress,
                                          validationRules: [
                                            'required',
                                            'email'
                                          ],
                                          controller: widget
                                              .controller!.emailIDController,
                                          labelName:
                                              '${Languages.of(context)?.contact}  ${Languages.of(context)?.emailID}',
                                          hintText: Languages.of(context)
                                              ?.emailIdHint),
                                      // Company Pan Number
                                      WidgetUtils.genericTextFiled(
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
                                          context: context,
                                          keyBoardType: TextInputType.name,
                                          validationRules: ['required'],
                                          controller: widget.controller!
                                              .contactPersonNameController,
                                          labelName:
                                              '${Languages.of(context)?.aadhaarNumber}',
                                          hintText:
                                              '${Languages.of(context)?.aadhaarNumberHint}'),
                                      // GST Number
                                      WidgetUtils.genericTextFiled(
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
                                      /*WidgetUtils.genericTextFiled(
                                          context: context,
                                          keyBoardType: TextInputType.name,
                                          controller:
                                              widget.controller!.socialId,
                                          labelName:
                                              '${Languages.of(context)?.enterAnyOneSocialMediaIdLabel}',
                                          hintText: Languages.of(context)
                                              ?.socialIdHint)*/
                                    ],
                                  ),
                                ),
                      // TODO -> Agency Flow Future update
                      // : WidgetUtils.showAlertDialog(context: context),
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
                          if (widget.controller!.form.currentState!
                              .validate()) {
                            widget.controller!.singUpNewUser();
                            // TODO -> Agency Flow Future Update
                            /* if (widget.controller!.typOfBusiness.obs.value
                                    .value ==
                                TypOfBusiness.agency) {
                              WidgetUtils.showAlertDialog(context: context);
                            } else {
                              widget.controller!.singUpNewUser();
                            }*/
                          }
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
    );
  }
}
