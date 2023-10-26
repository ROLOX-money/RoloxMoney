import 'package:flutter/material.dart';
import 'package:roloxmoney/utils/app_utils.dart';
import 'package:roloxmoney/utils/color_resource.dart';
import 'package:roloxmoney/utils/font.dart';
import 'package:roloxmoney/utils/image_resource.dart';
/*Chinnadurai Viswanathan*/

class PrimaryButton extends StatefulWidget {
  final String? text;
  final BuildContext context;
  final double cardElevation;
  final double cardShape;

  final TextAlign textAlign;
  final GestureTapCallback? onTap;
  final bool isUnderLine;
  final bool isSingleLine;
  final bool isLeading;
  final bool isTrailing;
  final bool isIcon;
  final int? maxLines;
  final Widget leadingWidget;
  final Widget trailingWidget;
  final FontWeight? fontWeight;
  final Color textColor;
  final IconData? trailingIconData;
  final Axis axis;
  final MainAxisAlignment alignment;
  final double fontSize;
  final Font font;
  final bool isEnabled;
  final Color? disableColor;

  PrimaryButton(this.text, this.context,
      {this.fontWeight = FontWeight.w600,
      this.leadingWidget = const Expanded(
        child: SizedBox.shrink(),
      ),
      this.trailingWidget = const Expanded(
        child: SizedBox.shrink(),
      ),
      this.font = Font.poppinsRegular,
      this.textAlign = TextAlign.left,
      this.onTap,
      this.textColor = ColorResource.buttonTextColor,
      this.fontSize = FontSize.fourteen,
      this.isUnderLine = false,
      this.isLeading = false,
      this.isTrailing = false,
      this.isSingleLine = false,
      this.isIcon = false,
      this.trailingIconData = Icons.settings,
      this.cardElevation = 0.0,
      this.cardShape = 8.0,
      this.axis = Axis.horizontal,
      this.alignment = MainAxisAlignment.center,
      this.maxLines,
      this.isEnabled = true,
      this.disableColor});

  @override
  _PrimaryButtonState createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        if (widget.onTap != null && widget.isEnabled) {
          widget.onTap!();
        }
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 56,
        child: Container(
          decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: ColorResource.buttonColor, width: 2),
                right: BorderSide(color: ColorResource.buttonColor, width: 2),
              ),
              color: ColorResource.buttonColor),
          padding: const EdgeInsets.all(0.0),
          child: Flex(
            direction: widget.axis,
            mainAxisAlignment: widget.alignment,
            children: [
              if (widget.isLeading) widget.leadingWidget,
              if (widget.text != null)
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    widget.text.toString(),
                    textAlign: widget.textAlign,
                    style: Theme.of(context).textTheme.button!.copyWith(
                        fontSize: widget.fontSize,
                        color: widget.textColor.withOpacity(1),
                        fontWeight: FontWeight.w600),
                    maxLines: widget.maxLines,
                    overflow:
                        widget.isSingleLine ? TextOverflow.ellipsis : null,
                  ),
                ),
              if (widget.isIcon)
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Image.asset(
                    ImageResource.buttonArrow,
                    width: 20,
                    height: 10,
                    color: ColorResource.buttonTextColor,
                  ),
                ),
              if (widget.isTrailing) widget.trailingWidget
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
