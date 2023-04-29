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
  String? Function(String?)? validatorFunction;
  AutovalidateMode? autoValidateMode;
  double? cursorHeight;

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
      this.textColor = ColorResource.colorFFFFFF,
      this.borderColor = Colors.grey,
      this.enableColor = Colors.grey,
      this.disableColor = Colors.grey,
      this.focusedBorder = Colors.grey,
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
      this.errorStyle,
      this.validationRules = const [],
      this.cursorHeight});

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
    return TextFormField(
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
      cursorHeight:  20,
      focusNode: widget.focusNode,
      style: Theme.of(context).textTheme.bodyText1!.copyWith(
          color: (widget.focusNode != null && widget.focusNode!.hasFocus)
              ? widget.focusTextColor
              : widget.textColor),
      decoration: InputDecoration(
        prefix: widget.prefixWidget,
        fillColor: ColorResource.color151515,
        filled: true,
        labelText: widget.hintText,
        isDense: true,
        counterText: widget.descriptionText,
        errorMaxLines: 2,
        suffixIcon: widget.suffixWidget,
        suffixIconConstraints:
            const BoxConstraints(minHeight: 24, minWidth: 24),
        prefixIcon: widget.prefixIcon,
        errorStyle: widget.errorStyle ??
            Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(color: Colors.red, height: 0.5),
        counterStyle: const TextStyle(
            color: ColorResource.colorFFFFFF,
            fontFamily: 'Poppins-Medium',
            fontWeight: FontWeight.normal,
            fontStyle: FontStyle.normal,
            height: 1,
            fontSize: 12),
        // errorText: validatePassword(widget.controller.text.trim()),
        labelStyle: Theme.of(context).textTheme.subtitle1!.copyWith(
            color: (widget.focusNode != null && widget.focusNode!.hasFocus)
                ? ColorResource.colorF58220
                : ColorResource.colorFFFFFF),
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
