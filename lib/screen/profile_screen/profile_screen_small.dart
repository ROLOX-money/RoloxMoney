import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/languages/app_languages.dart';
import 'package:roloxmoney/screen/business_profile_screen/business_profile_controller.dart';
import 'package:roloxmoney/screen/dashboard_screen/dashboard_screen.dart';
import 'package:roloxmoney/screen/profile_screen/profile_controller.dart';
import 'package:roloxmoney/utils/color_resource.dart';
import 'package:roloxmoney/utils/widget_utils.dart';
import 'package:roloxmoney/widget/custom_button.dart';
import 'package:roloxmoney/widget/custom_text.dart';
import 'package:roloxmoney/widget/custom_textfield.dart';
import 'package:roloxmoney/widget/rolox_money_widget.dart';
import 'package:roloxmoney/widget/stepper_view.dart';

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
                      backgroundColor: Theme.of(context).backgroundColor,
                      leading: Icon(
                        Icons.arrow_back_sharp,
                        size: 30,
                        color: Colors.white,
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
                                    color: ColorResource.colorFFFFFF,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                            children: <InlineSpan>[]),
                      ),
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
                              WidgetUtils.genericTextFiled(
                                context: context,
                                controller:
                                    widget.controller!.firstNameController,
                                labelName: '${Languages.of(context)?.firstName}'
                                    .toUpperCase(),
                              ),
                              WidgetUtils.genericTextFiled(
                                context: context,
                                controller:
                                    widget.controller!.lastNameController,
                                labelName: '${Languages.of(context)?.lastName}'
                                    .toUpperCase(),
                              ),
                              CustomText(
                                text: '${Languages.of(context)?.mobileNumber}'
                                    .toUpperCase(),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        color: ColorResource.colorE08AF4,
                                        fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                child: CustomTextField(
                                  widget.controller!.mobilNumberController.obs
                                      .value,
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
                                controller: widget.controller!.emailController,
                                labelName: '${Languages.of(context)?.emailID}'
                                    .toUpperCase(),
                              ),
                              WidgetUtils.genericTextFiled(
                                context: context,
                                controller:
                                    widget.controller!.businessNameController,
                                labelName:
                                    '${Languages.of(context)?.businessName}'
                                        .toUpperCase(),
                              ),
                              WidgetUtils.genericTextFiled(
                                context: context,
                                controller:
                                    widget.controller!.bankAccountController,
                                labelName:
                                    '${Languages.of(context)?.bankAccountNumber}'
                                        .toUpperCase(),
                              ),
                              WidgetUtils.genericTextFiled(
                                context: context,
                                controller:
                                    widget.controller!.bankIFSCController,
                                labelName:
                                    '${Languages.of(context)?.bankIFSCCode}'
                                        .toUpperCase(),
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
          backgroundColor: Theme.of(context).backgroundColor,
          bottomNavigationBar: PrimaryButton(
            '${Languages.of(context)!.save}',
            context,
            cardShape: 1,
            isIcon: true,
            textColor: ColorResource.black,
            fontSize: 20,
            onTap: () {
              Get.back();
            },
          ),
        ),
      ),
    );
  }
}
