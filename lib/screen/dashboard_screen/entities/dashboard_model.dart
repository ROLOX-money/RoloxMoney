class DashBoardInvoice {
  String? createdAt;
  String? projectName;
  String? clientName;
  String? invoiceName;
  String? invoiceNumber;
  double? invoiceAmount;
  bool? paid;
  int? projectvalue;
  String? dueDate;
  String? projectLink;
  String? refrenceID;
  String? clientID;

  DashBoardInvoice(
      {this.createdAt,
      this.projectName,
      this.clientName,
      this.invoiceName,
      this.projectvalue,
      this.paid,
      this.invoiceNumber,
      this.invoiceAmount,
      this.dueDate,
      this.projectLink,
      this.refrenceID,
      this.clientID});
}
