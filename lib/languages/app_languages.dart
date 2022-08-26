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

  String get iDontHaveABusiness;

  String get industryOfWork;

  String get otherIndustryOfWork;

  String get panNumber;

  String get typeOfAddress;

  String get pincode;

  String get fullAddress;

  String get iDontHaveAGSTNumber;

  String get gstNumber;

  String get role;

  String get fullTime;

  String get partTime;

  String get businessName;

  String get welcomeNote;

  String get invoices;

  String get welcomeToRolox;

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
}
