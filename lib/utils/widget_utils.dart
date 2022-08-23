import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/languages/app_languages.dart';
import 'package:roloxmoney/utils/color_resource.dart';
import 'package:roloxmoney/utils/image_resource.dart';
import 'package:roloxmoney/widget/custom_button.dart';
import 'package:roloxmoney/widget/custom_text.dart';
import 'package:roloxmoney/widget/custom_textfield.dart';

abstract class WidgetUtils {
  static Widget genericTextFiled(
      {required BuildContext context,
      required TextEditingController controller,
      required String labelName}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        CustomText(
          text: labelName,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: ColorResource.colorA0BCD0, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          child: CustomTextField(
            controller.obs.value,
            focusedBorder: Colors.grey,
            textColor: Colors.white,
            enableColor: Colors.grey,
            borderColor: Colors.red,
            disableColor: Colors.red,
            keyBoardType: TextInputType.name,
          ),
          height: 70,
        ),
      ],
    );
  }

  static showAlertDialog({required BuildContext context}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Container(
          child: AlertDialog(
            backgroundColor: Theme.of(context).backgroundColor,
            insetPadding: EdgeInsets.all(5),
            content: Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(color: Colors.grey),
                color: Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(32.0),
                ),
              ),
              height: 460,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      ImageResource.error,
                      height: 280,
                      width: 180,
                    ),
                  ),
                  CustomText(
                    text: '${Languages.of(context)?.oopsAgency}',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: ColorResource.colorFFFFFF,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomText(
                    text: '${Languages.of(context)?.oopsAgencyMessage}',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: ColorResource.colorA0BCD0,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  PrimaryButton(
                    '${Languages.of(context)!.continueText}',
                    context,
                    cardShape: 1,
                    isIcon: true,
                    textColor: ColorResource.black,
                    fontSize: 20,
                    onTap: () {
                      Get.back();
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
