import 'package:flutter/cupertino.dart';
import 'package:roloxmoney/model/invoice_model.dart';

class GroupInvoices {
  String? groupName;
  Color? boarderColor;
  List<InvoiceModel>? invoiceList;

  GroupInvoices({this.groupName, this.boarderColor, this.invoiceList});
}
