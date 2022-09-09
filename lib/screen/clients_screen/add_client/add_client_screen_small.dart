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
    Get.put(TemplateController());
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
                      SizedBox(
                        height: 10,
                      ),
                      WidgetUtils.genericTextFiled(
                        context: context,
                        keyBoardType: TextInputType.name,
                        controller: widget.controller!.brandNameController,
                        labelName:
                            '${Languages.of(context)?.brandName}'.toUpperCase(),
                      ),
                      WidgetUtils.genericTextFiled(
                        context: context,
                        controller: widget.controller!.gstNumberController,
                        labelName:
                            '${Languages.of(context)?.gstNumber}'.toUpperCase(),
                      ),
                      WidgetUtils.genericTextFiled(
                        context: context,
                        keyBoardType: TextInputType.name,
                        controller: widget.controller!.legalNameController,
                        labelName:
                            '${Languages.of(context)?.legalName}'.toUpperCase(),
                      ),
                      WidgetUtils.genericTextFiled(
                        context: context,
                        controller: widget.controller!.emailIDController,
                        keyBoardType: TextInputType.emailAddress,
                        labelName:
                            '${Languages.of(context)?.emailID}'.toUpperCase(),
                      ),
                      WidgetUtils.genericTextFiled(
                        context: context,
                        keyBoardType: TextInputType.phone,
                        controller: widget.controller!.mobileNumberController,
                        labelName: '${Languages.of(context)?.mobileNumber}'
                            .toUpperCase(),
                      ),
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
