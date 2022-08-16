import 'package:flutter/material.dart';
import 'package:roloxmoney/utils/font.dart';
/*Chinnadurai Viswanathan*/

// ignore: must_be_immutable
class CustomText extends StatefulWidget {
  String text;
  final double fontSize;
  final Font font;
  Color? color;
  final double lineHeight;
  final TextAlign textAlign;
  final GestureTapCallback? onTap;
  final bool isUnderLine;
  final bool isSingleLine;
  final int? maxLines;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final TextStyle? style;

  CustomText(
      {super.key,
      this.fontWeight = FontWeight.w400,
      this.fontStyle,
      this.fontSize = FontSize.fourteen,
      this.font = Font.poppinsMedium,
      this.color,
      this.lineHeight = 1.5,
      this.textAlign = TextAlign.left,
      this.onTap,
      this.isUnderLine = false,
      this.isSingleLine = false,
      this.style,
      this.maxLines,
      required this.text});

  @override
  CustomTextState createState() => CustomTextState();
}

class CustomTextState extends State<CustomText> {
  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_this
    final Text textWidget = Text(
      widget.text,
      textAlign: widget.textAlign,
      overflow: widget.isSingleLine ? TextOverflow.ellipsis : null,
      maxLines: widget.maxLines,
      style: widget.style ?? Theme.of(context).textTheme.bodyText1,
      // TextStyle(
      //     decoration: widget.isUnderLine
      //         ? TextDecoration.underline
      //         : TextDecoration.none,
      //     color: widget.color,
      //     fontFamily: widget.font.value,
      //     fontSize: widget.fontSize,
      //     height: widget.lineHeight,
      //     fontStyle: widget.fontStyle,
      //     fontWeight: widget.fontWeight),
      softWrap: true,
    );

    if (widget.onTap != null) {
      return GestureDetector(
        onTap: widget.onTap,
        child: textWidget,
      );
    } else {
      return textWidget;
    }
  }
}
