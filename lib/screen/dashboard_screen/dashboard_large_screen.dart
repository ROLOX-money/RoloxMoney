import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/languages/app_languages.dart';
import 'package:roloxmoney/languages/app_localizations_delegate.dart';
import 'package:roloxmoney/screen/clients_screen/clients_screen.dart';
import 'package:roloxmoney/screen/dashboard_screen/dashboard_controller.dart';
import 'package:roloxmoney/screen/home_screen/home_screen.dart';
import 'package:roloxmoney/screen/invoice_screen/invoice_screen.dart';
import 'package:roloxmoney/screen/payment_screen/payment_screen.dart';
import 'package:roloxmoney/screen/projects_screen/projects_screen.dart';
import 'package:roloxmoney/utils/app_themes.dart';
import 'package:roloxmoney/utils/base_appbar.dart';
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
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: BaseAppBar(),
          body: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 5,
                color: Theme.of(context).scaffoldBackgroundColor,
                padding: EdgeInsets.symmetric(vertical: 30),
                child: Column(
                  children: widget
                      .controller!.dashboardNavigatorModelList.obs.value!
                      .map(
                        (item) => GestureDetector(
                          onTap: () {
                            widget.controller!.bottomNavigation(
                                selectedBottom: item.name!.obs.value);
                            item.isSelected.obs.value =
                                item.isSelected!.obs.value;
                          },
                          child: AnimatedContainer(
                            duration: Duration(),
                            curve: Curves.bounceIn,
                            decoration: BoxDecoration(
                                color: widget.controller!.selectedBottomButton
                                            .obs.value.value ==
                                        item.name!.obs.value
                                    ? ColorResource.selectedTileColor
                                    : Colors.transparent,
                                gradient: LinearGradient(
                                  colors: [
                                    ColorResource.primaryColor,
                                    ColorResource.selectedTileColor
                                  ],
                                  stops: [0.2 / 8, 0.2 / 8],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                )),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 12, top: 30, bottom: 30),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    child: Image.asset(
                                      widget.controller!.selectedBottomButton
                                                  .obs.value.value ==
                                              item.name!.obs.value
                                          ? item.icon1!.obs.value
                                          : item.icon!.obs.value,
                                      height: 22,
                                      width: 22,
                                      color: widget
                                                  .controller!
                                                  .selectedBottomButton
                                                  .obs
                                                  .value
                                                  .value ==
                                              item.name!.obs.value
                                          ? Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .color
                                          : ColorResource.textSecondaryColor,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 7,
                                  ),
                                  CustomText(
                                    text: item.name!.obs.value,
                                    style: widget
                                                .controller!
                                                .selectedBottomButton
                                                .obs
                                                .value
                                                .value ==
                                            item.name!.obs.value
                                        ? Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                                color: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium!
                                                    .color,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500)
                                        : Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                                color: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium!
                                                    .color,
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
                  color: ColorResource.backgroundColor,
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
                                text:
                                    '${Languages.of(context)?.welcomeToRolox}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        color: Theme.of(context).primaryColor,
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
                                        '${Languages.of(context)?.welcomeNote}\n',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w600),
                                    children: <InlineSpan>[
                                      TextSpan(
                                        text:
                                            ' ${Languages.of(context)?.professionalInvoice}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                                fontSize: 30,
                                                fontWeight: FontWeight.w600,
                                                height: 1.5,
                                                foreground: Paint()
                                                  ..shader = ColorResource
                                                      .newLinearGradient),
                                      )
                                    ]),
                                maxLines: 2,
                                softWrap: true,
                                textAlign: TextAlign.center,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 450, vertical: 30),
                                child: PrimaryButton(
                                  '${Languages.of(context)!.explore}',
                                  context,
                                  cardShape: 1,
                                  isIcon: true,
                                  fontSize: 20,
                                  onTap: () {
                                    widget.controller!.selectedBottomButton =
                                        'Home'.obs;
                                    widget.controller!.change(widget
                                        .controller!.selectedBottomButton);
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
