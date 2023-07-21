import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

mixin PickerUtils {
  static Future<dynamic> datePicker({required BuildContext context}) async {
    return await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(2101))
        .then((pickedDate) {
      return pickedDate != null ? pickedDate : 'Date is not selected';
    });
  }
}
