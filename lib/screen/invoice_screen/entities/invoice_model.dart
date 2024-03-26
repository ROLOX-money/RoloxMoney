// class Invoice {
//   int? id;
//   String? createdAt;
//   String? projectName;
//   String? clientName;
//   String? invoiceName;
//   String? invoiceNumber;
//   double? invoiceAmount;
//   double? projectvalue;
//   String? dueDate;
//   String? projectLink;
//   String? refrenceID;
//   String? clientID;
//
//   Invoice({
//     this.id,
//     this.createdAt,
//     this.projectName,
//     this.clientName,
//     this.invoiceName,
//     this.projectvalue,
//     this.invoiceNumber,
//     this.invoiceAmount,
//     this.dueDate,
//     this.projectLink,
//     this.refrenceID,
//     this.clientID,
//   });
//
//   Invoice.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     createdAt = json['created_at'];
//     projectName = json['projectName'];
//     clientName = json['clientName'];
//     projectvalue = json['projectvalue'];
//     dueDate = json['dueDate'];
//     projectLink = json['projectLink'];
//     refrenceID = json['refrenceID'];
//     clientID = json['clientID'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['created_at'] = this.createdAt;
//     data['projectName'] = this.projectName;
//     data['clientName'] = this.clientName;
//     data['projectvalue'] = this.projectvalue;
//     data['dueDate'] = this.dueDate;
//     data['projectLink'] = this.projectLink;
//     data['refrenceID'] = this.refrenceID;
//     data['clientID'] = this.clientID;
//     return data;
//   }
// }
class InvoiceModel {
  String? userid;
  Invoice? invoice;

  InvoiceModel({this.userid, this.invoice});

  InvoiceModel.fromJson(Map<String, dynamic> json) {
    userid = json['userid'];
    invoice =
        json['invoice'] != null ? new Invoice.fromJson(json['invoice']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userid'] = this.userid;
    if (this.invoice != null) {
      data['invoice'] = this.invoice!.toJson();
    }
    return data;
  }
}

class Invoice {
  int? id;
  String? createdAt;
  String? invoiceName;
  String? invoiceNumber;
  double? invoiceValueWithoutGst;
  String? invoiceDueDate;
  int? hsnCode;
  int? gstCharges;
  int? projectId;
  bool? paid;
  String? projectName;

  Invoice(
      {this.id,
      this.createdAt,
      this.invoiceName,
      this.invoiceNumber,
      this.invoiceValueWithoutGst,
      this.invoiceDueDate,
      this.hsnCode,
      this.gstCharges,
      this.projectId,
      this.paid,
      this.projectName});

  Invoice.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    invoiceName = json['invoiceName'];
    invoiceNumber = json['invoiceNumber'];
    invoiceValueWithoutGst = json['invoiceValueWithoutGst'];
    invoiceDueDate = json['InvoiceDueDate'];
    hsnCode = json['hsnCode'];
    gstCharges = json['gstCharges'];
    projectId = json['projectId'];
    paid = json['paid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['invoiceName'] = this.invoiceName;
    data['invoiceNumber'] = this.invoiceNumber;
    data['invoiceValueWithoutGst'] = this.invoiceValueWithoutGst;
    data['InvoiceDueDate'] = this.invoiceDueDate;
    data['hsnCode'] = this.hsnCode;
    data['gstCharges'] = this.gstCharges;
    data['projectId'] = this.projectId;
    data['paid'] = this.paid;
    return data;
  }
}
