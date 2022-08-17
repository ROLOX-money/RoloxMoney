import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/widget/rolox_money_loading.dart';

// class RoloxMoneyWidget extends CoreWidgets {
//   M2PWidget({Key? key, required this.child, required this.rxStatus})
//       : super(key: key);
//   Widget child;
//   RxStatus rxStatus;
//
//   @override
//   State<StatefulWidget> createState() =>
//       RoloxMoneyWidgetState(child: child, rxStatus: rxStatus);
// }

// ignore: must_be_immutable
class RoloxMoneyWidgetState extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  RoloxMoneyWidgetState(
      {Key? key, required this.child, required this.rxStatus});

  Widget child;
  RxStatus rxStatus;

  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [child, if (rxStatus.isLoading) RoloxMoenyLoading()],
    );
  }
}
