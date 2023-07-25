import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/languages/app_languages.dart';
import 'package:roloxmoney/screen/business_profile_screen/business_profile_controller.dart';
import 'package:roloxmoney/screen/profile_screen/profile_controller.dart';
import 'package:roloxmoney/utils/color_resource.dart';
import 'package:roloxmoney/utils/image_resource.dart';
import 'package:roloxmoney/utils/widget_utils.dart';
import 'package:roloxmoney/widget/custom_button.dart';
import 'package:roloxmoney/widget/custom_text.dart';
import 'package:roloxmoney/widget/custom_textfield.dart';
import 'package:roloxmoney/widget/rolox_money_widget.dart';

class ProfileScreenLarge extends StatefulWidget {
  ProfileController? controller;
  GlobalKey<ScaffoldState>? scaffoldKey;

  ProfileScreenLarge(
      {Key? key, required this.controller, required this.scaffoldKey})
      : super(key: key);

  @override
  State<ProfileScreenLarge> createState() => _ProfileScreenLargeState();
}

class _ProfileScreenLargeState extends State<ProfileScreenLarge> {
  @override
  Widget build(BuildContext context) {
    Get.put(BusinessProfileController());
    return RoloxMoneyWidgetState(
        rxStatus: widget.controller!.status,
        child: SafeArea(
            child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
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
                  decoration: BoxDecoration(
                      color: ColorResource.color1B2023,
                      borderRadius: BorderRadius.all(Radius.circular(24))),
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: ListView(children: [
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
                        title: Text.rich(
                          TextSpan(
                              text:
                                  '${Languages.of(context)?.profile} ${Languages.of(context)?.page} ',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      color: ColorResource.colorFFFFFF,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                              children: <InlineSpan>[]),
                        ),
                        shadowColor: Colors.grey,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(24),
                                topRight: Radius.circular(24))),
                      ),
                      Form(
                        key: widget.controller!.form,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              WidgetUtils.genericTextFiled(
                                context: context,
                                validationRules: ['required'],
                                hintText:
                                    '${Languages.of(context)?.enter} ${Languages.of(context)?.firstName}',
                                controller:
                                    widget.controller!.firstNameController,
                                labelName:
                                    '${Languages.of(context)?.firstName}',
                              ),
                              WidgetUtils.genericTextFiled(
                                context: context,
                                validationRules: ['required'],
                                hintText:
                                    '${Languages.of(context)?.enter} ${Languages.of(context)?.lastName}',
                                controller:
                                    widget.controller!.lastNameController,
                                labelName: '${Languages.of(context)?.lastName}',
                              ),
                              CustomText(
                                text: '${Languages.of(context)?.mobileNumber}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        color: ColorResource.colorE08AF4,
                                        fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(height: 5),
                              SizedBox(
                                child: CustomTextField(
                                  widget.controller!.mobilNumberController.obs
                                      .value,
                                  validationRules: [
                                    'required',
                                    'mobile_number'
                                  ],
                                  hintText:
                                      '${Languages.of(context)?.enter} ${Languages.of(context)?.mobileNumber}',
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
                                            color: ColorResource.colorDDDDDD,
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
                                validationRules: ['required', 'email'],
                                hintText:
                                    '${Languages.of(context)?.emailIdHint}',
                                controller: widget.controller!.emailController,
                                labelName: '${Languages.of(context)?.emailID}',
                              ),
                              WidgetUtils.genericTextFiled(
                                context: context,
                                validationRules: ['required'],
                                hintText:
                                    '${Languages.of(context)?.brandNameHintText}',
                                controller:
                                    widget.controller!.businessNameController,
                                labelName:
                                    '${Languages.of(context)?.businessName}',
                              ),
                              WidgetUtils.genericTextFiled(
                                context: context,
                                validationRules: ['required'],
                                hintText:
                                    '${Languages.of(context)?.enter} ${Languages.of(context)?.accountNoHintText}',
                                controller:
                                    widget.controller!.bankAccountController,
                                labelName:
                                    '${Languages.of(context)?.bankAccountNumber}',
                              ),
                              WidgetUtils.genericTextFiled(
                                context: context,
                                validationRules: ['required'],
                                hintText:
                                    '${Languages.of(context)?.enter} ${Languages.of(context)?.accountIfscHintText}',
                                controller:
                                    widget.controller!.bankIFSCController,
                                labelName:
                                    '${Languages.of(context)?.bankIFSCCode}',
                              ),
                              const SizedBox(height: 10),
                              PrimaryButton(
                                '${Languages.of(context)!.save}',
                                context,
                                cardShape: 1,
                                isIcon: true,
                                textColor: ColorResource.black,
                                fontSize: 20,
                                onTap: () {
                                  if (widget.controller!.form.currentState!
                                      .validate()) {
                                    Get.back();
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ))),
        )));
  }
}
