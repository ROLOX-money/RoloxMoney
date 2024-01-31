class Invoice {
  int? id;
  String? createdAt;
  String? projectName;
  String? clientName;
  String? invoiceName;
  String? invoiceNumber;
  double? invoiceAmount;
  double? projectvalue;
  String? dueDate;
  String? projectLink;
  String? refrenceID;
  String? clientID;

  Invoice({
    this.id,
    this.createdAt,
    this.projectName,
    this.clientName,
    this.invoiceName,
    this.projectvalue,
    this.invoiceNumber,
    this.invoiceAmount,
    this.dueDate,
    this.projectLink,
    this.refrenceID,
    this.clientID,
  });

  Invoice.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    projectName = json['projectName'];
    clientName = json['clientName'];
    projectvalue = json['projectvalue'];
    dueDate = json['dueDate'];
    projectLink = json['projectLink'];
    refrenceID = json['refrenceID'];
    clientID = json['clientID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['projectName'] = this.projectName;
    data['clientName'] = this.clientName;
    data['projectvalue'] = this.projectvalue;
    data['dueDate'] = this.dueDate;
    data['projectLink'] = this.projectLink;
    data['refrenceID'] = this.refrenceID;
    data['clientID'] = this.clientID;
    return data;
  }
}
