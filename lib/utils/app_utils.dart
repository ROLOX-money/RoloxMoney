import 'dart:io';

import 'package:flutter/material.dart';

import 'color_resource.dart';

class AppUtils {
  static void showSnackBar(BuildContext context, String value,
      {Color? backgroundColor}) {
    final SnackBar sandbar = SnackBar(
      duration: const Duration(milliseconds: 1000),
      width: MediaQuery.of(context).size.width,
      content: Text(
        value,
        style: Theme.of(context)
            .textTheme
            .subtitle1!
            .copyWith(color: ColorResource.colorFFFFFF),
      ),
      backgroundColor: backgroundColor ?? Colors.green,
      action: SnackBarAction(
        label: '',
        textColor: Colors.white,
        onPressed: () {},
      ),
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(sandbar);
  }

  static void showErrorSnackBar(BuildContext context, String value,
      {int durations = 300}) {
    final SnackBar snackbar = SnackBar(
      duration: Duration(milliseconds: durations),
      width: 710,
      content: Text(
        value,
        style: Theme.of(context)
            .textTheme
            .subtitle1!
            .copyWith(color: ColorResource.colorFFFFFF),
      ),
      backgroundColor: Colors.red,
      action: SnackBarAction(
        label: '',
        textColor: Colors.white,
        onPressed: () {},
      ),
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  static void hideKeyBoard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static String getInitials(name) {
    final List<String> names = name.split(' ');
    String initials = '';
    int numWords = 2;
    if (names.length != 0 && names.length != 1) {
      if (numWords < names.length) {
        numWords = names.length;
      }
      for (int i = 0; i < numWords; i++) {
        initials += '${names[i][0]}';
      }
    } else {
      initials = name[0];
    }
    return initials.toUpperCase();
  }

  static String getFirstName(String fullName) {
    List<String> subStrings = fullName.split(" ");
    String lastName = fullName.split(" ").last;
    subStrings.remove(lastName);
    return subStrings.join(" ");
  }

  static String getLastName(String fullName) {
    return fullName.split(" ").last;
  }
}
