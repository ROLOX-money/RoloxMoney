import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/languages/app_languages.dart';
import 'package:roloxmoney/model/dashboard_navigator_model.dart';
import 'package:roloxmoney/screen/clients_screen/clients_screen.dart';
import 'package:roloxmoney/screen/dashboard_screen/dashboard_controller.dart';
import 'package:roloxmoney/screen/home_screen/home_screen.dart';
import 'package:roloxmoney/screen/invoice_screen/invoice_screen.dart';
import 'package:roloxmoney/screen/payment_screen/payment_screen.dart';
import 'package:roloxmoney/screen/projects_screen/projects_screen.dart';
import 'package:roloxmoney/utils/color_resource.dart';
import 'package:roloxmoney/utils/image_resource.dart';
import 'package:roloxmoney/widget/custom_button.dart';
import 'package:roloxmoney/widget/custom_text.dart';
import 'package:roloxmoney/widget/rolox_money_widget.dart';

/*Chinnadurai Viswanathan*/
// ignore: must_be_immutable
class DashboardScreenSmall extends StatefulWidget {
  DashboardController? controller;
  GlobalKey<ScaffoldState>? scaffoldKey;

  DashboardScreenSmall(
      {Key? key, required this.controller, required this.scaffoldKey})
      : super(key: key);

  @override
  DashboardScreenSmallState createState() => DashboardScreenSmallState();
}

class DashboardScreenSmallState extends State<DashboardScreenSmall> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(DashboardController());
    return RoloxMoneyWidgetState(
      rxStatus: widget.controller!.status,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          leading: Icon(
            Icons.menu,
            size: 30,
            color: Colors.white,
          ),
          title: Container(
            alignment: Alignment.centerLeft,
            child: Image.asset(
              ImageResource.rolox,
              height: 20,
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
              onPressed: () {},
            ),
          ],
        ),
        body: widget.controller!.selectedBottomButton.obs.value.value != 'empty'
            ? PageView(
                children: [
                  if (widget.controller!.selectedBottomButton.obs.value.value ==
                      'Home')
                    HomeScreen(),
                  if (widget.controller!.selectedBottomButton.obs.value.value ==
                      'Clients')
                    ClientsScreen(),
                  if (widget.controller!.selectedBottomButton.obs.value.value ==
                      'Projects')
                    ProjectsScreen(),
                  if (widget.controller!.selectedBottomButton.obs.value.value ==
                      'Invoices')
                    InvoiceScreen(),
                  if (widget.controller!.selectedBottomButton.obs.value.value ==
                      'Payments')
                    PaymentScreen(),
                ],
                scrollDirection: Axis.horizontal,
                controller: widget.controller!.pageController.obs.value.value,
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
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: ColorResource.colorA0BCD0,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text.rich(
                    TextSpan(
                        text: '${Languages.of(context)?.welcomeNote}',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: ColorResource.colorFFFFFF,
                            fontSize: 24,
                            fontWeight: FontWeight.w600),
                        children: <InlineSpan>[
                          TextSpan(
                            text: ' ${Languages.of(context)?.invoices}',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    color: ColorResource.color00E94F,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600),
                          )
                        ]),
                    maxLines: 2,
                    softWrap: true,
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    margin: EdgeInsets.all(50),
                    child: PrimaryButton(
                      '${Languages.of(context)!.explore}'.toUpperCase(),
                      context,
                      cardShape: 1,
                      isIcon: true,
                      textColor: ColorResource.black,
                      fontSize: 20,
                      onTap: () {},
                    ),
                  )
                ],
              ),
        bottomNavigationBar: Container(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: widget.controller!.dashboardNavigatorModelList.obs.value!
                .map(
                  (item) => GestureDetector(
                    onTap: () {
                      widget.controller!.bottomNavigation(
                          selectedBottom: item.name!.obs.value);
                    },
                    child: AnimatedContainer(
                      duration: Duration(seconds: 2),
                      curve: Curves.bounceIn,
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: Image.asset(
                              item.icon!.obs.value,
                              height: 22,
                              width: 22,
                              color: widget.controller!.selectedBottomButton.obs
                                          .value.value ==
                                      item.name!.obs.value
                                  ? ColorResource.color00E94F
                                  : ColorResource.colorA0BCD0,
                            ),
                          ),
                          SizedBox(
                            height: 7,
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
                          if (widget.controller!.selectedBottomButton.obs.value
                                  .value ==
                              item.name!.obs.value)
                            Container(
                              alignment: Alignment.topCenter,
                              child: Image.asset(
                                ImageResource.bottomSelected,
                                height: 32,
                                width: 32,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
