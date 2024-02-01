// payment_nimbbl_method_channel.dart

import 'package:flutter/services.dart';

class PaymentNimbblMethodChannel {
  static Future paymentViewInitiating(
      {required String nimbblToken, required String orderID}) async {
    try {
      await MethodChannel('payment_nimbbl_method_channel').invokeMethod(
          'payment_nimbbl_initiating',
          {'token': nimbblToken, 'orderId': orderID}).then((value) {});
    } on PlatformException catch (e) {
      throw 'Error: ${e.message}';
    }
  }
}
