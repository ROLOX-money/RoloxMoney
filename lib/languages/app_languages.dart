import 'package:flutter/material.dart';
/*Chinnadurai Viswanathan*/

abstract class Languages {
  static Languages? of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages);
  }

  String get appName;

  String get notAMember;

  String get signIn;

  String get signUP;

  String get alreadyAMember;

  String get mobileNumber;

  String get send;

  String get otp;

  String get digit;

  String get enter;

  String get sentOTPToRegisteredMobile;

  String get resendIN;

  String get resend;

  String get profile;

  String get page;

  String get profilePageContent;

  String get firstName;

  String get lastName;

  String get emailID;

  String get typeOfBusiness;

  String get individual;

  String get business;

  String get agency;

  String get continueText;

  String get oopsAgency;

  String get oopsAgencyMessage;

  String get modelOfWork;

  String get natureOfWork;

  String get otherNatureOfWork;

  String get iHaveABusiness;

  String get industryOfWork;

  String get otherIndustryOfWork;

  String get panNumber;

  String get typeOfAddress;

  String get pincode;

  String get fullAddress;

  String get iHaveAGSTNumber;

  String get gstNumber;

  String get role;

  String get fullTime;

  String get partTime;

  String get businessName;

  String get welcomeNote;

  String get invoices;

  String get professionalInvoice;

  String get welcomeToMean;

  String get explore;

  String get home;

  String get clients;

  String get projects;

  String get payments;

  String get youWalletBalance;

  String get withdraw;

  String get upcomingInvoices;

  String get dueInvoices;

  String get paidInvoices;

  String get viewMore;

  String get projectDetails;

  String get addProject;

  String get addClient;

  String get clientDetails;

  String get addInvoice;

  String get invoiceDetails;

  String get addBankAccount;

  String get credit;

  String get debit;

  String get brandName;

  String get legalName;

  String get save;

  String get projectName;

  String get clientName;

  String get projectValue;

  String get projectDueDate;

  String get invoiceName;

  String get invoiceNumber;

  String get invoiceDueDate;

  String get invoiceValueWithoutGST;

  String get invoiceValueWithGST;

  String get hsnCode;

  String get gstCharges;

  String get state;

  String get bankAccountNumber;

  String get accountHolderName;

  String get bankIFSCCode;

  String get branchName;

  String get cityName;

  String get enterAnyOneSocialMediaIdLabel;

  String get agree;

  String get roloxTermsAndCondition;

  String get fullName;

  String get fullNameHint;

  String get emailIdHint;

  String get socialIdHint;

  String get companyName;

  String get companyLegalName;

  String get companyNameHint;

  String get panNumberHint;

  String get aadhaarNumberHint;

  String get gstNumberHint;

  String get aadhaarNumber;

  String get congratulations;

  String get accountCreatedSuccessfully;

  String get accountCreatedScreenContent;

  String get letsExplore;

  String get contact;

  String get modeOfWork;

  String get natureOfBusiness;

  String get plsIfSpecify;

  String get profileSecondPageContent;

  String get accountBalance;

  String get allInvoices;

  String get upcoming;

  String get inNext1Week;

  String get noOf;

  String get transactionWorth;

  String get paid;

  String get due;

  String get person;

  String get department;

  String get designation;

  String get profileScreenFreeContent;

  String get optional;

  String get brandNameHintText;

  String get contactPersonNameHintText;

  String get departmentNameHintText;

  String get designationNameHintText;

  String get clientsEmailIdHintText;

  String get clientMobileNumberHintText;

  String get enterYourAddressHintText;

  String get searchClientNameHintText;

  String get projectValueHintText;

  String get projectsEmailIDHintText;

  String get invoiceNameHintText;

  String get invoiceNoHintText;

  String get valueHintText;

  String get hsnCodeHintText;

  String get accountNoHintText;

  String get accountIfscHintText;

  String get addProfilePhoto;

  String get rolox;

  String get address1;

  String get address2;

  String get projectLink;

  String get darkMode;

  String get projectLinkHint;

  String get enterYourWork;

  String get viewBankAccount;

  String get noInvoices;

  String get funds;

  String get withdrawFundsHint;

  String get withdrawalAmount;

  String get registered;

  String get inboundInvoices;

  String get payableInvoice;

  String get overDue;

  String get netAmount;

  String get addPayments;

  String get termsOfUse;

  String get privacyPolicy;

  String get alternate;
}
