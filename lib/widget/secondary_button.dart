import 'package:flutter/material.dart';
import 'package:roloxmoney/utils/color_resource.dart';
import 'package:roloxmoney/utils/font.dart';
import 'package:roloxmoney/utils/image_resource.dart';
import 'package:roloxmoney/widget/custom_text.dart';
/*Chinnadurai Viswanathan*/

class SecondaryButton extends StatefulWidget {
  final String? text;
  final BuildContext context;
  final double cardElevation;
  final double cardShape;
  final double borderRadius;

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
  final Color? backgroundColor;

  SecondaryButton(this.text, this.context,
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
      this.borderRadius = 0,
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
      this.backgroundColor,
      this.axis = Axis.horizontal,
      this.alignment = MainAxisAlignment.center,
      this.maxLines,
      this.isEnabled = true,
      this.disableColor});

  @override
  _SecondaryButtonState createState() => _SecondaryButtonState();
}

class _SecondaryButtonState extends State<SecondaryButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        if (widget.onTap != null && widget.isEnabled) {
          widget.onTap!();
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 46,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            // border: Border.all(width: .5, color: Colors.transparent),
            color: widget.backgroundColor ?? Theme.of(context).backgroundColor),
        padding: const EdgeInsets.all(0.0),
        child: Flex(
          direction: widget.axis,
          mainAxisAlignment: widget.alignment,
          children: [
            if (widget.isLeading) widget.leadingWidget,
            if (widget.text != null)
              Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: CustomText(
                    text: widget.text.toString(),
                    textAlign: widget.textAlign,
                    color: widget.textColor,
                    fontSize: widget.fontSize,
                    fontWeight: FontWeight.w500,
                    maxLines: widget.maxLines,
                    // overflow: widget.isSingleLine ? TextOverflow.ellipsis : null,
                  )),
            if (widget.isIcon)
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Image.asset(
                  ImageResource.buttonArrow,
                  width: 20,
                  height: 10,
                ),
              ),
            if (widget.isTrailing) widget.trailingWidget
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
