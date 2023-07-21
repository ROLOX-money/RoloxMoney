class ProjectModel {
  String? projectName;
  String? clientName;
  int? noOfInvoice;
  String? amount;
  String? date;
  bool? isCredit;

  ProjectModel(
      {this.projectName,
      this.noOfInvoice,
      this.amount,
      this.clientName,
      this.date,
      this.isCredit = false});
}
