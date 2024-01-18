import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/languages/app_languages.dart';
import 'package:roloxmoney/screen/business_profile_screen/business_profile_controller.dart';
import 'package:roloxmoney/utils/color_resource.dart';
import 'package:roloxmoney/utils/image_resource.dart';
import 'package:roloxmoney/utils/widget_utils.dart';
import 'package:roloxmoney/widget/custom_button.dart';
import 'package:roloxmoney/widget/custom_text.dart';
import 'package:roloxmoney/widget/custom_textfield.dart';
import 'package:roloxmoney/widget/rolox_money_widget.dart';

class BusinessProfileLargeScreen extends StatefulWidget {
  BusinessProfileController? controller;
  GlobalKey<ScaffoldState>? scaffoldKey;

  BusinessProfileLargeScreen(
      {Key? key, required this.controller, required this.scaffoldKey})
      : super(key: key);

  @override
  State<BusinessProfileLargeScreen> createState() =>
      _BusinessProfileLargeScreenState();
}

class _BusinessProfileLargeScreenState
    extends State<BusinessProfileLargeScreen> {
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
                borderRadius: BorderRadius.all(Radius.circular(24))),
            padding: EdgeInsets.all(12),
            alignment: Alignment.topLeft,
            child: ListView(
              shrinkWrap: true,
              children: [
                AppBar(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  centerTitle: false,
                  leading: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back_sharp,
                      size: 30,
                    ),
                  ),
                  title: Text.rich(TextSpan(
                      text:
                          '${Languages.of(context)?.profile} ${Languages.of(context)?.page} ',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontSize: 20, fontWeight: FontWeight.w600),
                      children: <InlineSpan>[
                        TextSpan(
                          text: '(${Languages.of(context)?.business})',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                        )
                      ])),
                  shadowColor: Colors.grey,
                  elevation: 0.0,
                ),
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
                                  fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // Role
                        WidgetUtils.dropDown(
                            context: context,
                            lableName: '${Languages.of(context)?.role}',
                            dropDownList:
                                widget.controller!.roleDropDown.obs.value,
                            selectedValues:
                                widget.controller!.roleDropDownValue.value,
                            onChanged: (value) {
                              widget.controller!.updateValuesOnUI(
                                  value: value,
                                  variableName:
                                      widget.controller!.roleDropDownValue);
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        // Type of Business
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 0.25),
                          ),
                          padding: EdgeInsets.all(10.0),
                          child: Theme(
                            data: Theme.of(context).copyWith(
                                unselectedWidgetColor:
                                    Theme.of(context).unselectedWidgetColor,
                                disabledColor: ColorResource.color00E94F),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: '${Languages.of(context)?.modeOfWork}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        widget.controller!.modelOfWorkToggle(
                                            value: ModelOfWork.fullTime);
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Radio(
                                            value: ModelOfWork.fullTime,
                                            groupValue: widget.controller!
                                                .modelOfWork.obs.value.value,
                                            activeColor:
                                                Theme.of(context).primaryColor,
                                            onChanged: (ModelOfWork? value) {
                                              widget.controller!
                                                  .modelOfWorkToggle(
                                                      value:
                                                          ModelOfWork.fullTime);
                                            },
                                          ),
                                          CustomText(
                                            text:
                                                '${Languages.of(context)?.fullTime}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w300),
                                          )
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        widget.controller!.modelOfWorkToggle(
                                            value: ModelOfWork.partTime);
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Radio(
                                            value: ModelOfWork.partTime,
                                            groupValue: widget.controller!
                                                .modelOfWork.obs.value.value,
                                            activeColor:
                                                Theme.of(context).primaryColor,
                                            onChanged: (ModelOfWork? value) {
                                              widget.controller!
                                                  .modelOfWorkToggle(
                                                      value:
                                                          ModelOfWork.partTime);
                                            },
                                          ),
                                          CustomText(
                                            text:
                                                '${Languages.of(context)?.partTime}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w300),
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
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Theme(
                              data: Theme.of(context).copyWith(
                                  unselectedWidgetColor:
                                      Theme.of(context).unselectedWidgetColor),
                              child: Checkbox(
                                value: widget.controller!.iDontHaveBusiness.obs
                                    .value.value,
                                activeColor: Theme.of(context).primaryColor,
                                checkColor:
                                    Theme.of(context).scaffoldBackgroundColor,
                                onChanged: (value) {
                                  widget.controller!
                                      .noBusinessCheckBox(values: value);
                                },
                              ),
                            ),
                            CustomText(
                              text: '${Languages.of(context)?.iHaveAGSTNumber}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        if (widget
                            .controller!.iDontHaveBusiness.obs.value.value)
                          WidgetUtils.genericTextFiled(
                            context: context,
                            height: 50,
                            validationRules: ['required'],
                            controller: widget.controller!.gstController,
                            labelName: '${Languages.of(context)?.gstNumber}',
                            labelStyle: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        // business Name
                        WidgetUtils.genericTextFiled(
                          height: 50,
                          context: context,
                          controller: widget.controller!.businessNameController,
                          labelName: '${Languages.of(context)?.businessName}',
                          hintText:
                              '${Languages.of(context)?.businessName} or ${Languages.of(context)?.brandName}',
                          labelStyle: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 10),
                        // nature of business
                        WidgetUtils.dropDown(
                            context: context,
                            lableName:
                                '${Languages.of(context)?.natureOfBusiness}',
                            dropDownList:
                                widget.controller!.natureOfBusiness.obs.value,
                            selectedValues:
                                widget.controller!.natureOfBusinessValue.value,
                            onChanged: (value) {
                              widget.controller!
                                  .updateNatureOfBusinessValue(value);
                            }),
                        SizedBox(height: 10),
                        if (widget.controller!.natureOfBusinessValue.value
                                .toLowerCase() ==
                            'others')
                          WidgetUtils.genericTextFiled(
                            height: 50,
                            context: context,
                            controller: widget.controller!
                                .plsIfSpecifyControllerForNatureOfBusiness,
                            labelName: '${Languages.of(context)?.plsIfSpecify}',
                            hintText: '${Languages.of(context)?.enterYourWork}',
                            labelStyle: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        // nature of work
                        WidgetUtils.dropDown(
                            context: context,
                            lableName: '${Languages.of(context)?.natureOfWork}',
                            dropDownList:
                                widget.controller!.natureOfWork.obs.value,
                            selectedValues:
                                widget.controller!.natureOfWorkValue.value,
                            onChanged: (value) {
                              widget.controller!
                                  .updateNatureOfWork(value);
                            }),
                        SizedBox(height: 10),
                        if (widget.controller!.natureOfWorkValue.value
                                .toLowerCase() ==
                            'others')
                          WidgetUtils.genericTextFiled(
                            height: 50,
                            context: context,
                            controller:
                                widget.controller!.plsIfSpecifyController,
                            labelName: '${Languages.of(context)?.plsIfSpecify}',
                            hintText: '${Languages.of(context)?.enterYourWork}',
                            labelStyle: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        // mobile no
                        CustomText(
                          text: '${Languages.of(context)?.mobileNumber}',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 5),
                        CustomTextField(
                          widget.controller!.mobilNumberController.obs.value,
                          focusedBorder: Colors.grey,
                          validatorCallBack: (bool value) {},
                          enableColor: Colors.grey,
                          borderColor: Colors.red,
                          validationRules: ['required', 'mobile_number'],
                          disableColor: Colors.red,
                          keyBoardType: TextInputType.phone,
                          prefixIcon: Container(
                            width: 120,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Row(
                                children: [
                                  ClipOval(
                                    child: Material(
                                      child: InkWell(
                                        splashColor: Colors.red,
                                        // Splash color
                                        onTap: () {},
                                        child: SizedBox(
                                          width: 32,
                                          height: 32,
                                          child: Image.network(
                                              'https://cdn.pixabay.com/photo/2020/07/04/08/24/india-5368684__340.jpg',
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  CustomText(
                                    text: '+91',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
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
                                  VerticalDivider(
                                    thickness: 1,
                                    indent: 15,
                                    endIndent: 15,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        //email id
                        WidgetUtils.genericTextFiled(
                          height: 50,
                          context: context,
                          controller: widget.controller!.emailController,
                          labelName: '${Languages.of(context)?.emailID}',
                          labelStyle: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 30),
                        PrimaryButton(
                          '${Languages.of(context)!.continueText}',
                          context,
                          cardShape: 1,
                          isIcon: true,
                          fontSize: 20,
                          onTap: () {
                            widget.controller!.validatingProfile();
                            // Get.put(DashboardController());
                            // Get.offAll(DashboardScreen());
                          },
                        ),
                      ]),
                )
              ],
            ),
          )),
          backgroundColor: Theme.of(context).backgroundColor,
        ),
      ),
    );
  }
}
