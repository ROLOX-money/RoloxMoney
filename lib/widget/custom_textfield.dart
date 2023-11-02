import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:roloxmoney/utils/color_resource.dart';
import 'package:roloxmoney/utils/validator.dart';
/*Chinnadurai Viswanathan*/

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  final String? hintText;
  final bool obscureText;
  final TextEditingController controller;
  final Widget? suffixWidget;
  final bool isEnable;
  final bool isReadOnly;
  final Function? onTapped;
  final Widget? prefixWidget;
  final TextInputType keyBoardType;
  final int? maximumWordCount;
  Color? titleColor;
  Color? borderColor;
  final Color textColor;
  final bool isHighlighted;
  final Color? highlightColor;
  final Color? enableColor;
  final Color? disableColor;
  final FocusNode? focusNode;
  final Color? focusTextColor;
  final Color? focusedBorder;
  final String? descriptionText;
  final List<TextInputFormatter>? inputformaters;
  List<String> validationRules = [];
  Function? oncomplete;
  final Function? onEditing;
  final Function(bool)? validatorCallBack;
  final Widget? prefixIcon;
  final bool isEnableLabel;
  TextStyle? errorStyle;
  TextStyle? hintStyle;
  String? Function(String?)? validatorFunction;
  AutovalidateMode? autoValidateMode;
  int? maxLines;
  int? minLines;
  void Function(String)? onChanged;
  final Color? bgColor;
  final Color? fillColor;

  CustomTextField(this.controller,
      {super.key,
      this.hintText,
      this.obscureText = false,
      this.suffixWidget,
      this.prefixWidget,
      this.isEnable = true,
      this.onTapped,
      this.isReadOnly = false,
      this.maximumWordCount,
      this.titleColor,
      this.textColor = ColorResource.textColor,
      this.borderColor = ColorResource.backgroundColor,
      this.enableColor = ColorResource.backgroundColor,
      this.disableColor = ColorResource.backgroundColor,
      this.focusedBorder = ColorResource.backgroundColor,
      this.isHighlighted = false,
      this.highlightColor,
      this.focusNode,
      this.focusTextColor,
      this.keyBoardType = TextInputType.name,
      this.descriptionText,
      this.oncomplete,
      this.validatorCallBack,
      this.onEditing,
      this.prefixIcon,
      this.isEnableLabel = true,
      this.inputformaters,
      this.validatorFunction,
      this.autoValidateMode,
      this.hintStyle,
      this.errorStyle,
      this.validationRules = const [],
      this.maxLines,
      this.minLines,
      this.onChanged,
      this.bgColor, this.fillColor});

  @override
  CustomTextFieldState createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // widget.titleColor = Theme.of(context).textTheme.titleMedium!.color!;
    // widget.borderColor =
    //     Theme.of(context).textTheme.titleMedium!.backgroundColor!;
    return Container(
      decoration: BoxDecoration(
          boxShadow: ColorResource.boxShadow, color: widget.bgColor),
      height: 50,
      child: TextFormField(
        maxLines: widget.maxLines ?? 1,
        minLines: widget.maxLines ?? 1,
        textAlignVertical: TextAlignVertical.center,
        textInputAction: TextInputAction.done,
        validator: widget.validatorFunction ??
            (String? value) {
              if (widget.validationRules.isNotEmpty) {
                final ValidationState validationStatus = Validator.validate(
                    value ?? '',
                    rules: widget.validationRules);
                if (widget.validatorCallBack != null) {
                  widget.validatorCallBack!(validationStatus.status);
                }
                if (!validationStatus.status) {
                  return validationStatus.error;
                }
              }
              return null;
            },
        autovalidateMode: widget.autoValidateMode,
        onEditingComplete: () {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            // Add Your Code here.
            setState(() {});
          });

          FocusScope.of(context).requestFocus(FocusNode());
          if (widget.onEditing != null) {
            widget.onEditing!();
          }
        },
        onTap: () {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            // Add Your Code here.
            setState(() {});
          });

          if (widget.onTapped != null) {
            widget.onTapped!();
          }
        },
        inputFormatters: widget.inputformaters ??
            [
              LengthLimitingTextInputFormatter(widget.maximumWordCount),
            ],
        autocorrect: false,
        enableSuggestions: false,
        obscureText: widget.obscureText,
        controller: widget.controller,
        readOnly: widget.isReadOnly,
        enabled: widget.isEnable,
        keyboardType: widget.keyBoardType,
        cursorHeight: 20,
        focusNode: widget.focusNode,
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
            color: (widget.focusNode != null && widget.focusNode!.hasFocus)
                ? widget.focusTextColor
                : widget.textColor),
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          prefix: widget.prefixWidget,
          fillColor: widget.fillColor ?? ColorResource.buttonTextColor,
          filled: true,
          labelText: widget.hintText,
          hintText: widget.hintText,
          isDense: true,
          counterText: widget.descriptionText,
          errorMaxLines: 2,
          suffixIcon: widget.suffixWidget,
          suffixIconConstraints:
              const BoxConstraints(minHeight: 24, minWidth: 24),
          prefixIcon: widget.prefixIcon,
          hintStyle: widget.hintStyle ??
              TextStyle(
                  color: ColorResource.hintTextColor,
                  fontFamily: 'Poppins-Medium',
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  height: 1,
                  fontSize: 14),
          errorStyle: widget.errorStyle ??
              Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(color: Colors.red, height: 0.5),
          counterStyle: TextStyle(
              color: ColorResource.hintTextColor,
              fontFamily: 'Poppins-Medium',
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              height: 1,
              fontSize: 12),
          // errorText: validatePassword(widget.controller.text.trim()),
          labelStyle: Theme.of(context).textTheme.subtitle1!.copyWith(
              color: (widget.focusNode != null && widget.focusNode!.hasFocus)
                  ? ColorResource.colorF58220
                  : ColorResource.hintTextColor.withOpacity(0.4),
              fontSize: 14,
              fontWeight: FontWeight.w400),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: widget.focusedBorder!, width: 0.25),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(width: 0.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: widget.enableColor!, width: 0.25),
          ),
          enabled: true,
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: widget.disableColor!, width: 0.25),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: widget.borderColor!, width: 0.5),
          ),
        ),
      ),
    );
  }

  String? validatePassword(String value) {
    if (widget.validationRules.isNotEmpty) {
      final ValidationState validationStatus =
          Validator.validate(value, rules: widget.validationRules);
      if (!validationStatus.status) {
        return validationStatus.error;
      }
    }
    return null;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
