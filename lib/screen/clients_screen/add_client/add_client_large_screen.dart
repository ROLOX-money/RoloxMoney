import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/languages/app_languages.dart';
import 'package:roloxmoney/screen/clients_screen/add_client/add_client_controller.dart';
import 'package:roloxmoney/utils/color_resource.dart';
import 'package:roloxmoney/utils/image_resource.dart';
import 'package:roloxmoney/utils/widget_utils.dart';
import 'package:roloxmoney/widget/custom_button.dart';
import 'package:roloxmoney/widget/custom_text.dart';
import 'package:roloxmoney/widget/rolox_money_widget.dart';

class AddClientLargeScreen extends StatefulWidget {
  AddClientController? controller;
  GlobalKey<ScaffoldState>? scaffoldKey;

  AddClientLargeScreen(
      {Key? key, required this.controller, required this.scaffoldKey})
      : super(key: key);

  @override
  State<AddClientLargeScreen> createState() => _AddClientLargeScreenState();
}

class _AddClientLargeScreenState extends State<AddClientLargeScreen> {
  @override
  Widget build(BuildContext context) {
    Get.put(AddClientController());
    return RoloxMoneyWidgetState(
        rxStatus: widget.controller!.status,
        child: SafeArea(
            child: Scaffold(
                backgroundColor: Theme.of(context).backgroundColor,
                appBar: AppBar(
                    centerTitle: false,
                    backgroundColor: Colors.transparent,
                    title: Container(
                      padding: const EdgeInsets.only(left: 8.0, top: 20),
                      child: Image.asset(
                        ImageResource.rolox,
                        color: Colors.black,
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
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: ListView(
                    children: [
                      SizedBox(height: 20),
                      AppBar(
                        backgroundColor: ColorResource.buttonTextColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(24),
                                topRight: Radius.circular(24))),
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
                        title: Text.rich(TextSpan(
                          text: widget.controller!.clientDetails != null
                              ? widget.controller!.clientDetails!.companyDB!
                                  .companyName
                                  .toString()
                              : '${Languages.of(context)?.addClient}',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                        )),
                        shadowColor: Colors.grey,
                        elevation: 0.0,
                      ),
                      (widget.controller!.clientDetails != null)
                          ? Column(
                              children: [
                                // client name
                                WidgetUtils.genericTextFiled(
                                  height: 50,
                                  context: context,
                                  validationRules: ['required'],
                                  isReadOnly:
                                      widget.controller!.isReadOnly.value,
                                  keyBoardType: TextInputType.name,
                                  hintText: Languages.of(context)?.clientName,
                                  controller:
                                      widget.controller!.clientNameController,
                                  labelName:
                                      '${Languages.of(context)?.clientName}',
                                ),
                                // created
                                WidgetUtils.genericTextFiled(
                                  height: 50,
                                  context: context,
                                  validationRules: ['required'],
                                  isReadOnly:
                                      widget.controller!.isReadOnly.value,
                                  keyBoardType: TextInputType.name,
                                  hintText: "Created on",
                                  controller:
                                      widget.controller!.createdController,
                                  labelName: "Created on",
                                ),
                                // Type of business
                                WidgetUtils.genericTextFiled(
                                  height: 50,
                                  context: context,
                                  validationRules: ['required'],
                                  isReadOnly:
                                      widget.controller!.isReadOnly.value,
                                  keyBoardType: TextInputType.name,
                                  hintText:
                                      Languages.of(context)?.typeOfBusiness,
                                  controller:
                                      widget.controller!.businessTypeController,
                                  labelName:
                                      '${Languages.of(context)?.typeOfBusiness}',
                                ),
                              ],
                            )
                          : Form(
                              key: widget.controller!.form,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Type of Business
                                    Container(
                                      decoration: BoxDecoration(
                                          color: ColorResource.buttonTextColor,
                                          boxShadow: ColorResource.boxShadow,
                                          border: Border.all(width: 0.25)),
                                      padding:
                                          EdgeInsets.only(top: 10, bottom: 10),
                                      child: Theme(
                                        data: Theme.of(context).copyWith(
                                            unselectedWidgetColor:
                                                Theme.of(context).dividerColor,
                                            disabledColor:
                                                Theme.of(context).dividerColor),
                                        child: ListTile(
                                          title: CustomText(
                                            text:
                                                '${Languages.of(context)?.typeOfBusiness}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .copyWith(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w600),
                                          ),
                                          subtitle: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  widget.controller!
                                                      .businessToggle(
                                                          value: TypOfBusiness
                                                              .individual);
                                                },
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Radio(
                                                      value: TypOfBusiness
                                                          .individual,
                                                      groupValue: widget
                                                          .controller!
                                                          .typOfBusiness
                                                          .obs
                                                          .value
                                                          .value,
                                                      activeColor:
                                                          Theme.of(context)
                                                              .primaryColor,
                                                      onChanged: (TypOfBusiness?
                                                          value) {
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
                                                                  FontWeight
                                                                      .w300),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              SizedBox(width: 30),
                                              GestureDetector(
                                                onTap: () {
                                                  widget.controller!
                                                      .businessToggle(
                                                          value: TypOfBusiness
                                                              .business);
                                                },
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Radio(
                                                      value: TypOfBusiness
                                                          .business,
                                                      groupValue: widget
                                                          .controller!
                                                          .typOfBusiness
                                                          .obs
                                                          .value
                                                          .value,
                                                      activeColor:
                                                          Theme.of(context)
                                                              .primaryColor,
                                                      onChanged: (TypOfBusiness?
                                                          value) {
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
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              SizedBox(width: 30),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    // Brand Name
                                    WidgetUtils.genericTextFiled(
                                      height: 50,
                                      context: context,
                                      validationRules: ['required'],
                                      keyBoardType: TextInputType.name,
                                      hintText: widget.controller!.typOfBusiness
                                                  .obs.value ==
                                              TypOfBusiness.business
                                          ? Languages.of(context)
                                              ?.brandNameHintText
                                          : Languages.of(context)?.fullNameHint,
                                      controller: widget
                                          .controller!.brandNameController,
                                      labelName: widget.controller!
                                                  .typOfBusiness.obs.value ==
                                              TypOfBusiness.business
                                          ? '${Languages.of(context)?.brandName}'
                                          : '${Languages.of(context)?.fullName}',
                                    ),
                                    // Legal Name
                                    if (widget.controller!.typOfBusiness.obs
                                            .value ==
                                        TypOfBusiness.business)
                                      WidgetUtils.genericTextFiled(
                                        height: 50,
                                        context: context,
                                        validationRules: ['required'],
                                        keyBoardType: TextInputType.name,
                                        hintText: Languages.of(context)
                                            ?.companyNameHint,
                                        controller: widget
                                            .controller!.legalNameController,
                                        labelName:
                                            '${Languages.of(context)?.business}  ${Languages.of(context)?.legalName}',
                                      ),
                                    SizedBox(height: 10),
                                    // I have GST no
                                    ListTile(
                                      visualDensity: VisualDensity(
                                          horizontal: -4, vertical: -4),
                                      contentPadding: EdgeInsets.zero,
                                      dense: true,
                                      leading: Theme(
                                        data: Theme.of(context).copyWith(
                                          unselectedWidgetColor:
                                              Theme.of(context)
                                                  .unselectedWidgetColor,
                                        ),
                                        child: Checkbox(
                                          value: widget
                                              .controller!
                                              .iDontHaveBusiness
                                              .obs
                                              .value
                                              .value,
                                          activeColor:
                                              Theme.of(context).primaryColor,
                                          checkColor:
                                              ColorResource.buttonTextColor,
                                          onChanged: (value) {
                                            widget.controller!
                                                .noBusinessCheckBox(
                                                    values: value);
                                          },
                                        ),
                                      ),
                                      title: CustomText(
                                        text:
                                            '${Languages.of(context)?.iHaveAGSTNumber}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    //  GST No

                                    if (widget.controller!.iDontHaveBusiness.obs
                                            .value.value ==
                                        true)
                                      WidgetUtils.genericTextFiled(
                                        height: 50,
                                        context: context,
                                        validationRules: ['required'],
                                        hintText: Languages.of(context)
                                            ?.gstNumberHint,
                                        controller: widget
                                            .controller!.gstNumberController,
                                        labelName:
                                            '${Languages.of(context)?.gstNumber}',
                                      ),
                                    // Pan No
                                    WidgetUtils.genericTextFiled(
                                      height: 50,
                                      context: context,
                                      validationRules: ['required', 'pan'],
                                      hintText:
                                          Languages.of(context)?.panNumberHint,
                                      controller:
                                          widget.controller!.panNoController,
                                      labelName:
                                          '${Languages.of(context)?.panNumber}',
                                    ),
                                    // Aadhaar No
                                    WidgetUtils.genericTextFiled(
                                        height: 50,
                                        context: context,
                                        validationRules: ['required', 'aadhar'],
                                        hintText: Languages.of(context)
                                            ?.aadhaarNumberHint,
                                        controller: widget
                                            .controller!.aadhaarNoController,
                                        keyBoardType:
                                            TextInputType.emailAddress,
                                        labelName:
                                            '${Languages.of(context)?.aadhaarNumber}'),
                                    // contact Person
                                    WidgetUtils.genericTextFiled(
                                      height: 50,
                                      context: context,
                                      validationRules: ['required'],
                                      hintText: Languages.of(context)
                                          ?.contactPersonNameHintText,
                                      controller: widget
                                          .controller!.contactPersonController,
                                      keyBoardType: TextInputType.emailAddress,
                                      labelName: (widget.controller!
                                                  .typOfBusiness.obs.value ==
                                              TypOfBusiness.business)
                                          ? '${Languages.of(context)?.contact} ${Languages.of(context)?.person}'
                                          : '${Languages.of(context)?.contact} ${Languages.of(context)?.person} ${Languages.of(context)?.optional}',
                                    ),
                                    // Department
                                    if (widget.controller!.typOfBusiness.obs
                                            .value ==
                                        TypOfBusiness.business)
                                      WidgetUtils.genericTextFiled(
                                          height: 50,
                                          context: context,
                                          validationRules: ['required'],
                                          hintText: Languages.of(context)
                                              ?.departmentNameHintText,
                                          controller: widget
                                              .controller!.departmentController,
                                          keyBoardType:
                                              TextInputType.emailAddress,
                                          labelName:
                                              '${Languages.of(context)?.department}'),
                                    // Designation
                                    WidgetUtils.genericTextFiled(
                                        height: 50,
                                        context: context,
                                        validationRules: ['required'],
                                        hintText: Languages.of(context)
                                            ?.designationNameHintText,
                                        keyBoardType: TextInputType.phone,
                                        controller: widget
                                            .controller!.designationController,
                                        labelName:
                                            '${Languages.of(context)?.designation}'),
                                    // Email ID
                                    WidgetUtils.genericTextFiled(
                                      height: 50,
                                      context: context,
                                      validationRules: ['required', 'email'],
                                      hintText: Languages.of(context)
                                          ?.clientsEmailIdHintText,
                                      keyBoardType: TextInputType.emailAddress,
                                      controller:
                                          widget.controller!.emailIDController,
                                      labelName:
                                          '${Languages.of(context)?.emailID}',
                                    ),
                                    // Mobile No
                                    WidgetUtils.genericTextFiled(
                                        height: 50,
                                        context: context,
                                        validationRules: [
                                          'required',
                                          'mobile_number'
                                        ],
                                        hintText: Languages.of(context)
                                            ?.clientMobileNumberHintText,
                                        keyBoardType: TextInputType.phone,
                                        controller: widget
                                            .controller!.mobileNumberController,
                                        labelName:
                                            '${Languages.of(context)?.mobileNumber}'),
                                    // Full Address
                                    WidgetUtils.genericTextFiled(
                                        height: 150,
                                        context: context,
                                        validationRules: ['required'],
                                        hintText: Languages.of(context)
                                            ?.enterYourAddressHintText,
                                        keyBoardType:
                                            TextInputType.streetAddress,
                                        controller: widget
                                            .controller!.fullAddressController,
                                        labelName:
                                            '${Languages.of(context)?.fullAddress}',
                                        maxLines: 10),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    PrimaryButton(
                                      '${Languages.of(context)!.save}',
                                      context,
                                      cardShape: 1,
                                      isIcon: true,
                                      fontSize: 20,
                                      onTap: () {
                                        if (widget
                                            .controller!.form.currentState!
                                            .validate()) {
                                          widget.controller!.createClient();
                                        }
                                      },
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                    ],
                  ),
                )))));
  }
}
