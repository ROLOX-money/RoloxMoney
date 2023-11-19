import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/screen/profile_screen/profile_controller.dart';
import 'package:roloxmoney/screen/profile_screen/profile_screen.dart';
import 'package:roloxmoney/utils/color_resource.dart';
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
                      'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
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
