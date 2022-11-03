class BankModel {
  String? bankName;
  String? accountNumber;
  String? holderName;
  bool isPrimary = false;

  BankModel(
      {this.bankName,
      this.accountNumber,
      this.isPrimary = false,
      this.holderName});
}
