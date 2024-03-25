import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:roloxmoney/screen/pd_view/pdf_controller.dart';
import 'package:roloxmoney/utils/image_resource.dart';
import 'package:roloxmoney/widget/custom_text.dart';
import 'package:roloxmoney/widget/rolox_money_widget.dart';

class PDFViewSmall extends StatelessWidget {
  PDFController? controller;
  GlobalKey<ScaffoldState>? scaffoldKey;

  PDFViewSmall({Key? key, required this.controller, required this.scaffoldKey})
      : super(key: key);
  static const String routeName = '/pdf_view_screen';

  @override
  Widget build(BuildContext context) {
    return RoloxMoneyWidgetState(
      rxStatus: controller!.status,
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
          placeholder: (double progress) => Center(
            child: Text('$progress %'),
          ),
          errorWidget: (dynamic error) => Center(
            child: Text(
              error.toString(),
            ),
          ),
          maxAgeCacheObject: Duration(days: 0),
          whenDone: (filePath) {},

        ),
        bottomNavigationBar: Container(
          height: 60,
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  controller!.downloadTheFile();
                },
                child: Icon(
                  Icons.download,
                  size: 26,
                  color: Colors.white,
                ),
              ),
              Icon(
                Icons.share,
                size: 26,
                color: Colors.white,
              ),
              Icon(
                Icons.email_outlined,
                size: 26,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
