class ProjectModel {
  String? projectName;
  int? noOfInvoice;
  String? amount;
  String? date;
  String? clientName;
  bool? isCredit;

  ProjectModel(
      {this.projectName,
      this.noOfInvoice,
      this.amount,
      this.date,
      this.clientName,
      this.isCredit = false});
}
