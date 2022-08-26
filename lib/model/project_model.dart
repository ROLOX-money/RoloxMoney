class ProjectModel {
  String? projectName;
  int? noOfInvoice;
  String? amount;
  String? date;
  bool? isCredit;

  ProjectModel(
      {this.projectName,
      this.noOfInvoice,
      this.amount,
      this.date,
      this.isCredit = false});
}
