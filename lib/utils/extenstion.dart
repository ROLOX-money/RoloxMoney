import 'package:flutter/material.dart';

extension SizedBoxExtension on Widget {
  spaceBetween(double? width, double? height) {
    return SizedBox(
      width: width,
      height: height,
    );
  }
}
