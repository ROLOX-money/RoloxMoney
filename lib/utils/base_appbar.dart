import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:roloxmoney/languages/app_languages.dart';
import 'package:roloxmoney/screen/profile_screen/profile_controller.dart';
import 'package:roloxmoney/screen/profile_screen/profile_screen.dart';
import 'package:roloxmoney/utils/color_resource.dart';
import 'package:roloxmoney/widget/custom_text.dart';
import 'package:roloxmoney/widget/custom_textfield.dart';

class BaseAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  State createState() => _MyStatefulWidgetState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _MyStatefulWidgetState extends State<BaseAppBar> {
  TextEditingController searchController = TextEditingController();
  RxBool isDarkMode = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: ColorResource.appbarBackgroundColor,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text('Means'),
            Spacer(),
            FlutterSwitch(
              activeColor: ColorResource.primaryColor,
              toggleColor: ColorResource.toggleButtonColor,
              inactiveColor: ColorResource.toggleButtonColor,
              width: 50.0,
              height: 25.0,
              value: isDarkMode.value,
              borderRadius: 20.0,
              padding: 3,
              toggleBorder: Border.all(
                color: ColorResource.buttonTextColor,
                width: 5.0,
              ),
              onToggle: (bool value) {
                setState(() {
                  isDarkMode.value = value;
                });
              },
            ),
            SizedBox(width: 10),
            CustomText(
              text: '${Languages.of(context)?.darkMode}',
              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                  color: ColorResource.textSecondaryColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 18),
            ),
            SizedBox(width: 20),
            SizedBox(
              width: 250,
              height: 40,
              child: CustomTextField(
                searchController,
                fillColor: ColorResource.textFiledBgColor,
                textColor: ColorResource.textSecondaryColor,
                hintText: "Search here",
                isEnableLabel: false,
                prefixIcon: Icon(Icons.search,
                    size: 30, color: ColorResource.dividerColor),
              ),
            ),
            SizedBox(width: 10),
            IconButton(onPressed: () {}, icon: Icon(Icons.notifications_none)),
            SizedBox(width: 20),
            IconButton(
              icon: ClipOval(
                child: Material(
                  child: SizedBox(
                    width: 40,
                    height: 36,
                    child: Image.network(
                      'https://think360studio-media.s3.ap-south-1.amazonaws.com/download/india-flag-2021-wallpaper-1.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              onPressed: () {
                Get.put(ProfileController());
                Get.toNamed(ProfileScreen.routeName);
              },
            ),
          ],
        ),
        // titleSpacing: 12,
      ),
    );
  }
}
