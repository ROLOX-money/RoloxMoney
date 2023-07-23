import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/screen/pd_view/pdf_controller.dart';
import 'package:roloxmoney/utils/image_resource.dart';
import 'package:roloxmoney/widget/custom_text.dart';
import 'package:roloxmoney/widget/rolox_money_widget.dart';

class PDFViewerCachedFromUrl extends StatelessWidget {
  const PDFViewerCachedFromUrl({Key? key}) : super(key: key);
  static const String routeName = '/pdf_view_screen';

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PDFController());
    return RoloxMoneyWidgetState(
      rxStatus: controller.status,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Theme.of(context).backgroundColor,
          title: Row(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  ImageResource.rolox,
                  height: 20,
                ),
              ),
              CustomText(
                text: ' #123',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        body: const PDF().cachedFromUrl(
          'https://339rrq5qm1.execute-api.ap-south-1.amazonaws.com/download/invoices.vm.rstk.in/1/out.pdf',
          headers: {'x-api-key': 'WiToRbqXh44fTzRn0RhQe3qoLTPplOwA7GUywDA0'},
          placeholder: (double progress) => Center(child: Text('$progress %')),
          errorWidget: (dynamic error) => Center(child: Text(error.toString())),
        ),
      ),
    );
  }
}
