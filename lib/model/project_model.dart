// class ProjectModel {
//   int? id;
//   String? projectName;
//   String? clientName;
//   int? noOfInvoice;
//   String? amount;
//   String? date;
//   bool? isCredit;
//
//   ProjectModel(
//       {this.id,
//       this.projectName,
//       this.noOfInvoice,
//       this.amount,
//       this.clientName,
//       this.date,
//       this.isCredit = false});
//
//   @override
//   String toString() {
//     return 'ProjectModel{id: $id, projectName: $projectName,noOfInvoice : $noOfInvoice, amount : $amount,clientName : $clientName,date : $date,isCredit : $isCredit}';
//   }
// }

class ProjectModel {
  int? id;
  String? createdAt;
  String? projectName;
  String? clientName;
  int? projectvalue;
  String? dueDate;
  String? projectLink;
  String? refrenceID;
  String? clientID;
  int? noOfInvoice;
  bool? isCredit;

  ProjectModel(
      {this.id,
      this.createdAt,
      this.projectName,
      this.clientName,
      this.projectvalue,
      this.dueDate,
      this.projectLink,
      this.refrenceID,
      this.clientID,
      this.noOfInvoice,
      this.isCredit = false});

  ProjectModel.fromJson(Map<String, dynamic> json) {
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
