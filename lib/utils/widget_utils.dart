import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/languages/app_languages.dart';
import 'package:roloxmoney/utils/app_utils.dart';
import 'package:roloxmoney/utils/color_resource.dart';
import 'package:roloxmoney/utils/image_resource.dart';
import 'package:roloxmoney/utils/rolox_autocomplete_textfiled.dart';
import 'package:roloxmoney/widget/custom_button.dart';
import 'package:roloxmoney/widget/custom_text.dart';
import 'package:roloxmoney/widget/custom_textfield.dart';

abstract class WidgetUtils {
  static Widget genericTextFiled({
    required BuildContext context,
    required TextEditingController controller,
    required String labelName,
    List<String> validationRules = const [],
    String? suffixImagePath,
    String? hintText,
    int? maxLines,
    int? minLines,
    bool isReadOnly = false,
    TextInputType? keyBoardType,
    Function()? onTab,
    TextStyle? labelStyle,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        CustomText(
          text: labelName,
          style: labelStyle ??
              Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: ColorResource.color181B28,
                  fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          child: CustomTextField(
            controller.obs.value,
            minLines: minLines,
            maxLines: maxLines,
            isReadOnly: isReadOnly,
            hintText: hintText,
            focusedBorder: Colors.grey,
            textColor: ColorResource.color181B28,
            onTapped: isReadOnly ? onTab : null,
            enableColor: Colors.grey,
            validationRules: validationRules,
            borderColor: Colors.red,
            suffixWidget: suffixImagePath != null
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AppUtils.setSVG(svgPath: suffixImagePath),
                  )
                : null,
            disableColor: Colors.red,
            keyBoardType: keyBoardType ?? TextInputType.name,
          ),
          height: 70,
        ),
      ],
    );
  }

  static Widget dropDown(
      {required BuildContext context,
      required String lableName,
      required List<String> dropDownList,
      required String selectedValues,
      required Function(String) onChanged}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: lableName,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: ColorResource.colorEC008C,
              fontSize: 14,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(color: Colors.grey, width: 0.25),
            color: ColorResource.color151515,
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedValues,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: ColorResource.colorEC008C,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
              dropdownColor: ColorResource.color151515,
              items: dropDownList.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: CustomText(
                    text: value,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: ColorResource.colorFFFFFF,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                onChanged(value!);
              },
            ),
          ),
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
              height: 500,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  MediaQuery.removePadding(
                    removeTop: true,
                    removeBottom: true,
                    removeLeft: true,
                    removeRight: true,
                    context: context,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(
                              Icons.close,
                              color: Colors.white,
                            ))
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    // child: Image.asset(
                    //   ImageResource.error,
                    //   height: 280,
                    //   width: 180,
                    // ),
                    child: Image.asset(
                      ImageResource.agencyAlertImage,
                      height: 280,
                      width: 180,
                    ),
                  ),
                  CustomText(
                    text: '${Languages.of(context)?.oopsAgency}',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: ColorResource.colorEC008C,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomText(
                    text: '${Languages.of(context)?.oopsAgencyMessage}',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: ColorResource.colorFFFFFF,
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

  static Widget genericAutoCompleteTextField(
      {required textController,
      required context,
      required suggestions,
      required labelName,
      required hintText,
      required Function(String) textSubmitted,
      required Function(String) textChanged}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: labelName,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: ColorResource.colorEC008C, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 5,
        ),
        SimpleAutoCompleteTextField(
            key: GlobalKey(),
            decoration: InputDecoration(
              filled: true,
              hintText: hintText,
              hintStyle: TextStyle(
                  color: Colors.grey.shade600,
                  fontFamily: 'Poppins-Medium',
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  height: 1,
                  fontSize: 14),
              fillColor: ColorResource.color151515,
              suffixIconConstraints:
                  const BoxConstraints(minHeight: 18, minWidth: 18),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppUtils.setSVG(svgPath: ImageResource.searchSVG),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Colors.grey, width: 0.25),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(width: 0.5),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Colors.grey, width: 0.25),
              ),
              enabled: true,
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Colors.grey, width: 0.25),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Colors.grey, width: 0.5),
              ),
            ),
            controller: textController,
            suggestions: suggestions,
            textChanged: textChanged,
            textSubmitted: textSubmitted),
      ],
    );
  }
}
