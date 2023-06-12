import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/languages/app_languages.dart';
import 'package:roloxmoney/screen/clients_screen/clients_screen.dart';
import 'package:roloxmoney/screen/dashboard_screen/dashboard_controller.dart';
import 'package:roloxmoney/screen/home_screen/home_screen.dart';
import 'package:roloxmoney/screen/invoice_screen/add_invoice/add_invoice_controller.dart';
import 'package:roloxmoney/screen/invoice_screen/add_invoice/add_invoice_screen.dart';
import 'package:roloxmoney/screen/invoice_screen/invoice_screen.dart';
import 'package:roloxmoney/screen/payment_screen/payment_screen.dart';
import 'package:roloxmoney/screen/profile_screen/profile_controller.dart';
import 'package:roloxmoney/screen/profile_screen/profile_screen.dart';
import 'package:roloxmoney/screen/projects_screen/projects_screen.dart';
import 'package:roloxmoney/utils/color_resource.dart';
import 'package:roloxmoney/utils/image_resource.dart';
import 'package:roloxmoney/widget/custom_button.dart';
import 'package:roloxmoney/widget/custom_text.dart';
import 'package:roloxmoney/widget/rolox_money_widget.dart';

class DashBoardLargeScreen extends StatefulWidget {
  DashboardController? controller;
  GlobalKey<ScaffoldState>? scaffoldKey;

  DashBoardLargeScreen(
      {Key? key, required this.controller, required this.scaffoldKey})
      : super(key: key);

  @override
  State<DashBoardLargeScreen> createState() => _DashBoardLargeScreenState();
}

class _DashBoardLargeScreenState extends State<DashBoardLargeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Get.put(DashboardController());
    return RoloxMoneyWidgetState(
      rxStatus: widget.controller!.status,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ColorResource.black,
          appBar: AppBar(
            centerTitle: false,
            backgroundColor: ColorResource.color1B2023,
            title: CustomText(
              text: '${Languages.of(context)?.rolox}',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: ColorResource.colorFFFFFF,
                  fontSize: 34,
                  fontWeight: FontWeight.w900),
            ),
            shadowColor: Colors.grey,
            elevation: 0.75,
            actions: [
              Obx(() {
                return Row(children: [
                  Switch(
                    value: widget.controller!.isDarkMode.value,
                    onChanged: (bool value) {
                      widget.controller!.isDarkMode.value = value;
                    },
                  ),
                  CustomText(
                    text: '${Languages.of(context)?.darkMode}',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: ColorResource.colorA0BCD0,
                        fontSize: 18,
                        fontWeight: FontWeight.w900),
                  ),
                ]);
              }),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notification_add_outlined,
                    color: ColorResource.colorFFFFFF,
                  )),
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
          body: Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width / 5,
                    height: MediaQuery.of(context).size.height,
                    color: ColorResource.color151515,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: widget
                            .controller!.dashboardNavigatorModelList.obs.value!
                            .map(
                              (item) => GestureDetector(
                                onTap: () {
                                  widget.controller!.bottomNavigation(
                                      selectedBottom: item.name!.obs.value);
                                },
                                child: Column(
                                  children: [
                                    SizedBox(height: 30),
                                    Container(
                                      color: (widget
                                                  .controller!
                                                  .selectedBottomButton
                                                  .obs
                                                  .value
                                                  .value ==
                                              item.name!.obs.value)
                                          ? ColorResource.color1D452B
                                          : ColorResource.color151515,
                                      height: 50,
                                      child: Row(
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            child: Image.asset(
                                                item.icon!.obs.value,
                                                height: 22,
                                                width: 22,
                                                color: widget
                                                            .controller!
                                                            .selectedBottomButton
                                                            .obs
                                                            .value
                                                            .value ==
                                                        item.name!.obs.value
                                                    ? ColorResource.color00E94F
                                                    : ColorResource.colorFFFFFF
                                                // : ColorResource.colorA0BCD0,
                                                ),
                                          ),
                                          SizedBox(width: 30),
                                          CustomText(
                                            text: item.name!.obs.value,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                    color: widget
                                                                .controller!
                                                                .selectedBottomButton
                                                                .obs
                                                                .value
                                                                .value ==
                                                            item.name!.obs.value
                                                        ? ColorResource
                                                            .color00E94F
                                                        : ColorResource
                                                            .colorFFFFFF,
                                                    // : ColorResource.colorA0BCD0,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    )),
                Container(
                  child: widget.controller!.selectedBottomButton.obs.value
                              .value !=
                          'empty'
                      ? PageView(
                          children: [
                            if (widget.controller!.selectedBottomButton.obs
                                    .value.value ==
                                'Home')
                              HomeScreen(),
                            if (widget.controller!.selectedBottomButton.obs
                                    .value.value ==
                                'Clients')
                              ClientsScreen(),
                            if (widget.controller!.selectedBottomButton.obs
                                    .value.value ==
                                'Projects')
                              ProjectsScreen(),
                            if (widget.controller!.selectedBottomButton.obs
                                    .value.value ==
                                'Invoices')
                              InvoiceScreen(),
                            if (widget.controller!.selectedBottomButton.obs
                                    .value.value ==
                                'Payments')
                              PaymentScreen(),
                          ],
                          scrollDirection: Axis.horizontal,
                          controller:
                              widget.controller!.pageController.obs.value.value,
                          onPageChanged: (num) {
                            // widget.controller!.bottomNavigation(
                            //     selectedBottom: widget
                            //         .controller!
                            //         .dashboardNavigatorModelList
                            //         .obs
                            //         .value!
                            //         .value[num]
                            //         .name!);
                          },
                        )
                      : Container(
                          width: MediaQuery.of(context).size.width -
                              MediaQuery.of(context).size.width / 5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                child: Image.asset(
                                  ImageResource.dashboardEmpty,
                                  height: 180,
                                  width: 220,
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              CustomText(
                                text: '${Languages.of(context)?.welcomeToRolox}'
                                    .toUpperCase(),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        color: ColorResource.colorE08AF4,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text.rich(
                                TextSpan(
                                    text:
                                        '${Languages.of(context)?.welcomeNote}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                            color: ColorResource.colorFFFFFF,
                                            fontSize: 24,
                                            fontWeight: FontWeight.w600),
                                    children: <InlineSpan>[
                                      TextSpan(
                                        text:
                                            ' ${Languages.of(context)?.professionalInvoice}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                                fontSize: 24,
                                                fontWeight: FontWeight.w600,
                                                height: 1.5,
                                                foreground: Paint()
                                                  ..shader = ColorResource
                                                      .linearGradient),
                                      )
                                    ]),
                                maxLines: 2,
                                softWrap: true,
                                textAlign: TextAlign.center,
                              ),
                              Container(
                                margin: EdgeInsets.all(50),
                                child: PrimaryButton(
                                  '${Languages.of(context)!.explore}'
                                      .toUpperCase(),
                                  context,
                                  cardShape: 1,
                                  isIcon: true,
                                  textColor: ColorResource.black,
                                  fontSize: 20,
                                  onTap: () {
                                    Get.put(AddInvoiceController());
                                    Get.toNamed(AddInvoiceScreen.routeName);
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                ),
                // NavigationRail(
                //     backgroundColor: ColorResource.color151515,
                //     indicatorColor: ColorResource.color1D452B,
                //     onDestinationSelected: changeDestination,
                //     useIndicator: true,
                //     extended: true,
                //     destinations: <NavigationRailDestination>[
                //       customNavigationRailDestination(
                //           iconName: ImageResource.home, labelText: "Home"),
                //       customNavigationRailDestination(
                //           iconName: ImageResource.client, labelText: "Clients"),
                //       customNavigationRailDestination(
                //           iconName: ImageResource.projects,
                //           labelText: "Projects"),
                //       customNavigationRailDestination(
                //           iconName: ImageResource.invoice,
                //           labelText: "Invoices"),
                //       customNavigationRailDestination(
                //           iconName: ImageResource.wallet,
                //           labelText: "Payments"),
                //     ],
                //     selectedIndex: selectedIndex)
              ],
            ),
          ),
        ),
      ),
    );
  }

  customNavigationRailDestination(
      {required String iconName, required String labelText}) {
    return NavigationRailDestination(
      icon: Image.asset(iconName,
          height: 22,
          width: 22,
          color: widget.controller!.selectedBottomButton.obs.value.value ==
                  labelText
              ? ColorResource.color00E94F
              : ColorResource.colorFFFFFF),
      label: CustomText(
        text: labelText,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: widget.controller!.selectedBottomButton.obs.value.value ==
                    labelText
                ? ColorResource.color00E94F
                : ColorResource.colorFFFFFF,
            // : ColorResource.colorA0BCD0,
            fontSize: 15,
            fontWeight: FontWeight.w400),
      ),
    );
  }

  changeDestination(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
