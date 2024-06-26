import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/languages/app_languages.dart';
import 'package:roloxmoney/screen/business_profile_screen/business_profile_controller.dart';
import 'package:roloxmoney/screen/profile_screen/profile_controller.dart';
import 'package:roloxmoney/utils/color_resource.dart';
import 'package:roloxmoney/utils/widget_utils.dart';
import 'package:roloxmoney/widget/custom_button.dart';
import 'package:roloxmoney/widget/custom_text.dart';
import 'package:roloxmoney/widget/custom_textfield.dart';
import 'package:roloxmoney/widget/rolox_money_widget.dart';

/*Chinnadurai Viswanathan*/
// ignore: must_be_immutable
class ProfileScreenSmall extends StatefulWidget {
  ProfileController? controller;
  GlobalKey<ScaffoldState>? scaffoldKey;

  ProfileScreenSmall(
      {Key? key, required this.controller, required this.scaffoldKey})
      : super(key: key);

  @override
  ProfileScreenSmallState createState() => ProfileScreenSmallState();
}

class ProfileScreenSmallState extends State<ProfileScreenSmall> {
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
                      backgroundColor: Theme.of(context)
                          .appBarTheme
                          .copyWith(backgroundColor: ColorResource.colorFFFFFF)
                          .backgroundColor,
                      leading: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.arrow_back_sharp,
                          size: 30,
                          color: ColorResource.color000000,
                        ),
                      ),
                      centerTitle: true,
                      title: Text.rich(
                        TextSpan(
                            text:
                                '${Languages.of(context)?.profile} ${Languages.of(context)?.page} ',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                color: ColorResource.color000000,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600),
                            children: <InlineSpan>[]),
                      ),
                      shadowColor: Colors.grey,
                      elevation: 0.75,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 0),
                      child: Center(
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          fit: StackFit.passthrough,
                          children: [
                            // if (widget.controller!.isFreelancer.value)
                            GestureDetector(
                              onTap: () {
                                widget.controller!.filePicker();
                              },
                              child: Container(
                                width: 200,
                                height: 200,
                                alignment: Alignment.center,
                                child: widget.controller!.isLogo.value
                                    ? CustomText(
                                        text: 'Upload Company Logo',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                                height: 1.5,
                                                decoration:
                                                    TextDecoration.underline,
                                                foreground: Paint()
                                                  ..shader = ColorResource
                                                      .linearGradient),
                                      )
                                    : null,
                                decoration: BoxDecoration(
                                  image: !widget.controller!.isLogo.value
                                      ? DecorationImage(
                                          image: NetworkImage(
                                              'https://www.shutterstock.com/shutterstock/photos/1395298487/display_1500/stock-photo-focused-woman-wearing-headphones-using-laptop-in-cafe-writing-notes-attractive-female-student-1395298487.jpg'),
                                          fit: BoxFit.cover,
                                        )
                                      : null,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 1.0, // Sets the border width
                                  ),
                                  borderRadius: BorderRadius.circular(360),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Form(
                      key: widget.controller!.form,
                      child: Column(
                        children: [
                          Padding(
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
                                // WidgetUtils.genericTextFiled(
                                //   context: context,
                                //   validationRules: ['required'],
                                //   hintText:
                                //       '${Languages.of(context)?.enter} ${Languages.of(context)?.lastName}',
                                //   controller:
                                //       widget.controller!.lastNameController,
                                //   labelName:
                                //       '${Languages.of(context)?.lastName}',
                                // ),
                                CustomText(
                                  text:
                                      '${Languages.of(context)?.mobileNumber}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                          color: ColorResource.color181B28,
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
                                    textColor: ColorResource.color181B28,
                                    enableColor: Colors.grey,
                                    borderColor: Colors.red,
                                    disableColor: Colors.red,
                                    keyBoardType: TextInputType.phone,
                                    prefixIcon: Container(
                                      width: 110,
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
                                                      color: ColorResource.color181B28,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400),
                                            ),
                                            Icon(
                                              Icons.keyboard_arrow_down,
                                              size: 22,
                                              color: ColorResource.color181B28,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Container(
                                              width: 0.40,
                                              height: 20,
                                              color: ColorResource.color181B28,
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
                                  controller:
                                      widget.controller!.emailController,
                                  labelName:
                                      '${Languages.of(context)?.emailID}',
                                ),
                                if (widget.controller!.isFreelancer.value)
                                  WidgetUtils.genericTextFiled(
                                    context: context,
                                    validationRules: ['required'],
                                    hintText:
                                        '${Languages.of(context)?.brandNameHintText}',
                                    controller: widget
                                        .controller!.businessNameController,
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
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          backgroundColor: Colors.white,
          bottomNavigationBar: PrimaryButton(
            '${Languages.of(context)!.save}',
            context,
            cardShape: 1,
            isIcon: true,
            textColor: ColorResource.black,
            fontSize: 20,
            onTap: () {
              if (widget.controller!.form.currentState!.validate()) {
                Get.back();
              }
            },
          ),
        ),
      ),
    );
  }
}
