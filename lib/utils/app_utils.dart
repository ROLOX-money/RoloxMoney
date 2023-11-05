import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roloxmoney/languages/app_languages.dart';
import 'package:roloxmoney/widget/custom_text.dart';
import 'package:roloxmoney/widget/secondary_button.dart';

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
        if (i == 1) {
          break;
        }
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

  static Widget setSVG({String? svgPath}) {
    return SvgPicture.asset(svgPath!);
  }

  static Widget emptyViewWidget(
      {required BuildContext context,
      required String contentString,
      required String imagePath,
      required String buttonName,
      Function()? callBack}) {
    return Padding(
      padding: EdgeInsets.only(top: 80,right: 20,left: 20),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        color:  ColorResource.colorFFFFFF,
        child: Container(
          margin: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            // border: Border.all(color: Colors.grey, width: 0.15),
            color: ColorResource.colorFFFFFF,
          ),
          height: 320,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imagePath,
                height: 170,
              ),
              SizedBox(
                height: 20,
              ),
              CustomText(
                text: contentString,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color:  ColorResource.color000000),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 110,
                height: 40,
                child: SecondaryButton(
                  buttonName,
                  context,
                  fontWeight: FontWeight.w500,
                  borderRadius: 8,
                  backgroundColor: ColorResource.color000000,
                  textColor: ColorResource.colorFFFFFF,
                  fontSize: 14,
                  onTap: () {
                    callBack!();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
