import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/languages/app_languages.dart';
import 'package:roloxmoney/languages/app_localizations_delegate.dart';
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
import 'package:roloxmoney/utils/app_themes.dart';
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
  @override
  Widget build(BuildContext context) {
    Get.put(DashboardController());
    return RoloxMoneyWidgetState(
      rxStatus: widget.controller!.status,
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            toolbarHeight: 80,
            backgroundColor: ColorResource.color1B2023,
            title: Container(
              alignment: Alignment.centerLeft,
              child: Image.asset(
                ImageResource.rolox,
                height: 30,
              ),
            ),
            actions: [
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
          body: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 5,
                color: ColorResource.color151515,
                child: Column(
                  children:
                      widget.controller!.dashboardNavigatorModelList.obs.value!
                          .map(
                            (item) => GestureDetector(
                              onTap: () {
                                widget.controller!.bottomNavigation(
                                    selectedBottom: item.name!.obs.value);
                              },
                              child: AnimatedContainer(
                                duration: Duration(),
                                curve: Curves.bounceIn,
                                color: widget.controller!.selectedBottomButton
                                            .obs.value.value ==
                                        item.name!.obs.value
                                    ? ColorResource.color00E94F.withOpacity(0.2)
                                    : Colors.transparent,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12, top: 30, bottom: 30),
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
                                              : ColorResource.colorA0BCD0,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 7,
                                      ),
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
                                                    ? ColorResource.color00E94F
                                                    : ColorResource.colorA0BCD0,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                ),
              ),
              Container(
                  color: ColorResource.color0D0D0D,
                  width: MediaQuery.of(context).size.width -
                      (MediaQuery.of(context).size.width / 5),
                  child: MaterialApp(
                    debugShowCheckedModeBanner: false,
                    theme: lightTheme,
                    supportedLocales: const [
                      Locale('en', ''),
                    ],
                    localizationsDelegates: const [
                      AppLocalizationsDelegate(),
                    ],
                    home: widget.controller!.selectedBottomButton.obs.value
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
                            controller: widget
                                .controller!.pageController.obs.value.value,
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
                        : Column(
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
                  ))
            ],
          )),
    );
  }
}
