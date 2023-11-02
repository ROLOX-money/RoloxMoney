import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roloxmoney/widget/custom_button.dart';
import 'package:roloxmoney/widget/custom_text.dart';

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

  static Widget setSVG({String? svgPath}) {
    return SvgPicture.asset(svgPath!);
  }

  static Widget emptyViewWidget(
      {required BuildContext context,
      required String contentString,
      required String imagePath,
      required String buttonName,
         double? buttonWidth,
      Function()? callBack}) {
    return Padding(
      padding: EdgeInsets.only(top: 80),
      child: Container(
        margin: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.transparent, width: 0.15),
          color: Colors.transparent,
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
              style: Theme.of(context).textTheme.titleMedium!.copyWith(),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: buttonWidth ?? 110,
              height: 40,
              child: PrimaryButton(
                buttonName,
                context,
                fontWeight: FontWeight.w500,
                fontSize: 14,
                onTap: () {
                  callBack!();
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  static Widget pageNationButton(
      {required IconData icon, required void Function()? onPressed}) {
    return Container(
      height: 30,
      width: 28,
      decoration: BoxDecoration(
          border: Border.all(color: ColorResource.backgroundColor),
          borderRadius: BorderRadius.circular(8)),
      child: Center(
        child: IconButton(
          icon: Icon(
            icon,
            size: 15,
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}

class CustomAadhaarInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text.replaceAll(RegExp(r'\s'), '');
    String formattedText = '';

    // var buffer = new StringBuffer();
    for (int i = 0; i < text.length; i += 4) {
      if (i + 4 <= text.length) {
        formattedText += text.substring(i, i + 4) + ' ';
      } else {
        formattedText += text.substring(i);
      }
    }

    // buffer.write(text[i]);
    // var nonZeroIndex = i + 1;
    // if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
    //   buffer.write(
    //       ' '); // Replace this with anything you want to put after each 4 numbers
    // }
    // }

    // var string = buffer.toString();

    return newValue.copyWith(
        text: formattedText,
        selection: new TextSelection.collapsed(offset: formattedText.length));
  }
}
