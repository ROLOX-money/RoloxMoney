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
              automaticallyImplyLeading: false,
              shadowColor: Colors.grey,
              elevation: 0.0),
          body: Center(
              child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 1.2,
                  decoration: BoxDecoration(
                      color: ColorResource.buttonTextColor,
                      borderRadius: BorderRadius.all(Radius.circular(24))),
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: ListView(children: [
                      AppBar(
                        backgroundColor: ColorResource.buttonTextColor,
                        leading: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Icons.arrow_back_sharp,
                            size: 30,
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
                              WidgetUtils.genericTextFiled(
                                context: context,
                                height: 50,
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
                                height: 50,
                                validationRules: ['required'],
                                hintText:
                                    '${Languages.of(context)?.enter} ${Languages.of(context)?.lastName}',
                                controller:
                                    widget.controller!.lastNameController,
                                labelName: '${Languages.of(context)?.lastName}',
                              ),
                              const SizedBox(height: 10),
                              CustomText(
                                text: '${Languages.of(context)?.mobileNumber}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(height: 5),
                              SizedBox(
                                child: CustomTextField(
                                  widget.controller!.mobilNumberController.obs
                                      .value,
                                  focusedBorder: Colors.grey,
                                  validatorCallBack: (bool value) {},
                                  enableColor: Colors.grey,
                                  borderColor: Colors.red,
                                  validationRules: [
                                    'required',
                                    'mobile_number'
                                  ],
                                  disableColor: Colors.red,
                                  keyBoardType: TextInputType.phone,
                                  prefixIcon: Container(
                                    width: 120,
                                    padding: EdgeInsets.only(left: 8),
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
                                height: 50,
                              ),
                              const SizedBox(height: 10),
                              WidgetUtils.genericTextFiled(
                                context: context,
                                height: 50,
                                validationRules: ['required', 'email'],
                                hintText:
                                    '${Languages.of(context)?.emailIdHint}',
                                controller: widget.controller!.emailController,
                                labelName: '${Languages.of(context)?.emailID}',
                              ),
                              WidgetUtils.genericTextFiled(
                                context: context,
                                height: 50,
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
                                height: 50,
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
                                height: 50,
                                validationRules: ['required'],
                                hintText:
                                    '${Languages.of(context)?.enter} ${Languages.of(context)?.accountIfscHintText}',
                                controller:
                                    widget.controller!.bankIFSCController,
                                labelName:
                                    '${Languages.of(context)?.bankIFSCCode}',
                              ),
                              const SizedBox(height: 30),
                              PrimaryButton(
                                '${Languages.of(context)!.save}',
                                context,
                                cardShape: 1,
                                isIcon: true,
                                fontSize: 16,
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
