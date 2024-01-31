class ProjectModel {
  int? id;
  String? projectName;
  String? clientName;
  int? noOfInvoice;
  String? amount;
  String? date;
  bool? isCredit;

  ProjectModel(
      {this.id,
      this.projectName,
      this.noOfInvoice,
      this.amount,
      this.clientName,
      this.date,
      this.isCredit = false});

  @override
  String toString() {
    return 'ProjectModel{id: $id, projectName: $projectName,noOfInvoice : $noOfInvoice, amount : $amount,clientName : $clientName,date : $date,isCredit : $isCredit}';
  }
}
