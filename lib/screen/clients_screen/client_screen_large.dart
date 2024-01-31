import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:roloxmoney/languages/app_languages.dart';
import 'package:roloxmoney/screen/clients_screen/clients_controller.dart';
import 'package:roloxmoney/utils/app_utils.dart';
import 'package:roloxmoney/utils/color_resource.dart';
import 'package:roloxmoney/utils/image_resource.dart';
import 'package:roloxmoney/utils/widget_utils.dart';
import 'package:roloxmoney/widget/custom_button.dart';
import 'package:roloxmoney/widget/custom_text.dart';
import 'package:roloxmoney/widget/rolox_money_widget.dart';
import 'package:roloxmoney/widget/secondary_button.dart';

class ClientScreenLarge extends StatefulWidget {
  ClientsController? controller;
  GlobalKey<ScaffoldState>? scaffoldKey;

  ClientScreenLarge(
      {Key? key, required this.controller, required this.scaffoldKey})
      : super(key: key);

  @override
  State<ClientScreenLarge> createState() => _ClientScreenLargeState();
}

class _ClientScreenLargeState extends State<ClientScreenLarge> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(ClientsController());
    return RoloxMoneyWidgetState(
        rxStatus: widget.controller!.status,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: ColorResource.mediumScreenAppBarBgColor,
            centerTitle: false,
            title: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text.rich(
                    TextSpan(
                        text: '${Languages.of(context)?.clients}',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 20, fontWeight: FontWeight.w600)),
                    textAlign: TextAlign.center),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: SizedBox(
                      height: 40,
                      width: 120,
                      child: PrimaryButton(
                        '${Languages.of(context)!.addClient}',
                        context,
                        borderRadius: 12,
                        onTap: () {
                          widget.controller!.navigateAddClientScreen();
                        },
                      )),
                ),
                SizedBox(
                    width: 150,
                    height: 40,
                    child: SecondaryButton(
                      onTap: () {},
                      DateFormat("dd/MM/yyyy")
                          .format(DateTime.now())
                          .toString(),
                      context,
                      borderRadius: 12,
                      backgroundColor: ColorResource.dividerColor,
                      isLeading: true,
                      leadingWidget: Container(
                        height: 40,
                        width: 40,
                        child: IconButton(
                            onPressed: () {}, icon: Icon(Icons.calendar_month)),
                      ),
                    )),
                SizedBox(width: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                        text:
                            '${widget.controller!.listValueStart} - ${widget.controller!.listValueEnd} of 20'),
                    SizedBox(width: 5),
                    AppUtils.pageNationButton(
                        icon: Icons.arrow_back_ios,
                        onPressed: () {},
                        enabled: true),
                    SizedBox(width: 5),
                    AppUtils.pageNationButton(
                        icon: Icons.arrow_forward_ios,
                        onPressed: () {},
                        enabled: widget.controller!.isEnabled.value),
                    SizedBox(width: 5),
                    AppUtils.pageNationButton(
                        icon: Icons.double_arrow_rounded,
                        onPressed: () {},
                        enabled: widget.controller!.isEnabled.value),
                  ],
                ),
                SizedBox(width: 20)
              ],
            ),
            automaticallyImplyLeading: true,
            shadowColor: Colors.grey,
            elevation: 0.75,
          ),
          body: widget.controller!.clientList.obs.value.length > 0
              ? Padding(
                  padding: const EdgeInsets.only(
                      top: 30, bottom: 60, right: 30, left: 30),
                  child: WidgetUtils.customTableWidget(
                    context: context,
                    isClientTap: true,
                    listLength: widget.controller!.clientList.obs.value.length,
                    clientList: widget.controller!.cModel,
                  ))
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppUtils.emptyViewWidget(
                      context: Get.context!,
                      buttonName: Languages.of(context)!.addClient,
                      contentString: "No Clients are there",
                      imagePath: ImageResource.emptyClient,
                      callBack: () {
                        widget.controller!.navigateAddClientScreen();
                      }),
                ),
        ));
  }
}
