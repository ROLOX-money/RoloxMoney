import 'package:get/get.dart';
import 'package:roloxmoney/screen/bank_list_screen/bank_list_screen.dart';
import 'package:roloxmoney/screen/business_profile_screen/business_profile_screen.dart';
import 'package:roloxmoney/screen/clients_screen/add_client/add_client_screen.dart';
import 'package:roloxmoney/screen/dashboard_screen/dashboard_screen.dart';
import 'package:roloxmoney/screen/individual_profile_screen/individual_profile_screen.dart';
import 'package:roloxmoney/screen/invoice_screen/add_invoice/add_invoice_screen.dart';
import 'package:roloxmoney/screen/login_profile_screen/login_profile_screen.dart';
import 'package:roloxmoney/screen/login_screen/login_screen.dart';
import 'package:roloxmoney/screen/payment_screen/add_bank_account/add_bank_account_screen.dart';
import 'package:roloxmoney/screen/pd_view/pdf_screen.dart';
import 'package:roloxmoney/screen/profile_screen/profile_screen.dart';
import 'package:roloxmoney/screen/projects_screen/add_project/add_project_screen.dart';
import 'package:roloxmoney/screen/welcome_screen/welcome_screen.dart';
import 'package:roloxmoney/screen/withdraw_fund_screen/withdraw_fund_screen.dart';
import 'package:roloxmoney/screen/splash_screen/splash_screen.dart';

/*Chinnadurai Viswanathan*/
class AppRoutes {
  static List<GetPage<dynamic>>? routes = [
    // GetPage(name: '/', page: () => LoginScreen()),
    GetPage(name: '/', page: () => SplashScreen()),
    GetPage(name: PDFScreen.routeName, page: () => PDFScreen()),
    // GetPage(name: '/', page: () => PDFScreen()),
    // GetPage(name: '/', page: () => HomeScreen()),
    GetPage(name: LoginScreen.routeName, page: () => LoginScreen()),
    GetPage(name: WelcomeScreen.routeName, page: () => WelcomeScreen()),

    GetPage(
        name: LoginProfileScreen.routeName, page: () => LoginProfileScreen()),
    GetPage(
        name: IndividualProfileScreen.routeName,
        page: () => IndividualProfileScreen()),
    GetPage(
        name: BusinessProfileScreen.routeName,
        page: () => BusinessProfileScreen()),
    GetPage(name: DashboardScreen.routeName, page: () => DashboardScreen()),
    // GetPage(name: '/', page: () => DashboardScreen()),
    GetPage(name: AddClientScreen.routeName, page: () => AddClientScreen()),
    // GetPage(name: '/', page: () => AddClientScreen()),
    GetPage(name: AddProjectScreen.routeName, page: () => AddProjectScreen()),
    GetPage(name: AddInvoiceScreen.routeName, page: () => AddInvoiceScreen()),
    GetPage(
        name: AddBankAccountScreen.routeName,
        page: () => AddBankAccountScreen()),
    GetPage(name: ProfileScreen.routeName, page: () => ProfileScreen()),
    GetPage(name: BankListScreen.routeName, page: () => BankListScreen()),
    GetPage(
        name: WithdrawFundScreen.routeName, page: () => WithdrawFundScreen()),
  ];
}
