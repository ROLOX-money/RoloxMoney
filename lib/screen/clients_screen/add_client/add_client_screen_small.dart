import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/languages/app_languages.dart';
import 'package:roloxmoney/screen/clients_screen/add_client/add_client_controller.dart';
import 'package:roloxmoney/screen/template_screen/template_controller.dart';
import 'package:roloxmoney/utils/color_resource.dart';
import 'package:roloxmoney/utils/image_resource.dart';
import 'package:roloxmoney/utils/widget_utils.dart';
import 'package:roloxmoney/widget/custom_button.dart';
import 'package:roloxmoney/widget/custom_text.dart';
import 'package:roloxmoney/widget/rolox_money_widget.dart';

/*Chinnadurai Viswanathan*/
// ignore: must_be_immutable
class AddClientScreenSmall extends StatefulWidget {
  AddClientController? controller;
  GlobalKey<ScaffoldState>? scaffoldKey;

  AddClientScreenSmall(
      {Key? key, required this.controller, required this.scaffoldKey})
      : super(key: key);

  @override
  AddClientScreenSmallState createState() => AddClientScreenSmallState();
}

class AddClientScreenSmallState extends State<AddClientScreenSmall> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(AddClientController());
    return RoloxMoneyWidgetState(
      rxStatus: widget.controller!.status,
      child: Scaffold(
        body: Container(
          alignment: Alignment.topLeft,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBar(
                  backgroundColor: Theme.of(context).backgroundColor,
                  leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back_sharp,
                      size: 30,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  centerTitle: true,
                  title: CustomText(
                    text: '${Languages.of(context)?.addClient}',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: ColorResource.colorFFFFFF,
                        fontSize: 21,
                        fontWeight: FontWeight.w600),
                  ),
                  shadowColor: Colors.grey,
                  elevation: 0.75,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Type of Business
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 0.25),
                            color: ColorResource.color151515),
                        padding: EdgeInsets.all(10.0),
                        child: Theme(
                          data: Theme.of(context).copyWith(
                              unselectedWidgetColor: Colors.grey,
                              disabledColor: ColorResource.color00E94F),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: '${Languages.of(context)?.typeOfBusiness}'
                                    .toUpperCase(),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        color: ColorResource.colorFFFFFF,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                              ),
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      widget.controller!.businessToggle(
                                          value: TypOfBusiness.individual);
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Radio(
                                          value: TypOfBusiness.individual,
                                          groupValue: widget.controller!
                                              .typOfBusiness.obs.value.value,
                                          activeColor:
                                              ColorResource.color00E94F,
                                          onChanged: (TypOfBusiness? value) {
                                            widget.controller!.businessToggle(
                                                value:
                                                    TypOfBusiness.individual);
                                          },
                                        ),
                                        CustomText(
                                          text:
                                              '${Languages.of(context)?.individual}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                  color:
                                                      ColorResource.colorFFFFFF,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600),
                                        )
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      widget.controller!.businessToggle(
                                          value: TypOfBusiness.business);
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Radio(
                                          value: TypOfBusiness.business,
                                          groupValue: widget.controller!
                                              .typOfBusiness.obs.value.value,
                                          activeColor:
                                              ColorResource.color00E94F,
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
                                                  color:
                                                      ColorResource.colorFFFFFF,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      if (widget.controller!.typOfBusiness.obs.value ==
                          TypOfBusiness.business) ...[
                        // Brand Name
                        WidgetUtils.genericTextFiled(
                          context: context,
                          keyBoardType: TextInputType.name,
                          controller: widget.controller!.brandNameController,
                          labelName: '${Languages.of(context)?.brandName}'
                              .toUpperCase(),
                        ),
                        // Legal Name
                        WidgetUtils.genericTextFiled(
                          context: context,
                          keyBoardType: TextInputType.name,
                          controller: widget.controller!.legalNameController,
                          labelName:
                              ' ${Languages.of(context)?.business}  ${Languages.of(context)?.legalName}'
                                  .toUpperCase(),
                        )
                      ],

                      //  GST No
                      WidgetUtils.genericTextFiled(
                        context: context,
                        controller: widget.controller!.gstNumberController,
                        labelName:
                            '${Languages.of(context)?.gstNumber}'.toUpperCase(),
                      ),
                      // Pan No
                      WidgetUtils.genericTextFiled(
                        context: context,
                        controller: widget.controller!.panNoController,
                        labelName:
                            '${Languages.of(context)?.panNumber}'.toUpperCase(),
                      ),
                      // Aadhaar No
                      WidgetUtils.genericTextFiled(
                        context: context,
                        controller: widget.controller!.aadhaarNoController,
                        keyBoardType: TextInputType.emailAddress,
                        labelName: '${Languages.of(context)?.aadhaarNumber}'
                            .toUpperCase(),
                      ),
                      // contact Person
                      WidgetUtils.genericTextFiled(
                        context: context,
                        controller: widget.controller!.contactPersonController,
                        keyBoardType: TextInputType.emailAddress,
                        labelName:
                            '${Languages.of(context)?.contact} ${Languages.of(context)?.person}'
                                .toUpperCase(),
                      ),
                      // Department
                      WidgetUtils.genericTextFiled(
                        context: context,
                        controller: widget.controller!.departmentController,
                        keyBoardType: TextInputType.emailAddress,
                        labelName: '${Languages.of(context)?.department}'
                            .toUpperCase(),
                      ),
                      // Designation
                      WidgetUtils.genericTextFiled(
                        context: context,
                        keyBoardType: TextInputType.phone,
                        controller: widget.controller!.designationController,
                        labelName: '${Languages.of(context)?.designation}'
                            .toUpperCase(),
                      ),
                      // Email ID
                      WidgetUtils.genericTextFiled(
                        context: context,
                        keyBoardType: TextInputType.streetAddress,
                        controller: widget.controller!.fullAddressController,
                        labelName:
                            '${Languages.of(context)?.emailID}'.toUpperCase(),
                      ),
                      // Mobile No
                      WidgetUtils.genericTextFiled(
                        context: context,
                        keyBoardType: TextInputType.phone,
                        controller: widget.controller!.designationController,
                        labelName: '${Languages.of(context)?.mobileNumber}'
                            .toUpperCase(),
                      ),
                      // Full Address
                      WidgetUtils.genericTextFiled(
                        context: context,
                        keyBoardType: TextInputType.streetAddress,
                        controller: widget.controller!.fullAddressController,
                        labelName: '${Languages.of(context)?.fullAddress}'
                            .toUpperCase(),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      PrimaryButton(
                        '${Languages.of(context)!.save}',
                        context,
                        cardShape: 1,
                        isIcon: true,
                        textColor: ColorResource.black,
                        fontSize: 20,
                        onTap: () {
                          Get.back();
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
