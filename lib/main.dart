import 'package:dynamic_themes/dynamic_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:roloxmoney/languages/app_locale_constant.dart';
import 'package:roloxmoney/languages/app_localizations_delegate.dart';
import 'package:roloxmoney/router.dart';
import 'package:roloxmoney/screen/clients_screen/add_client/add_client_controller.dart';
import 'package:roloxmoney/screen/clients_screen/clients_controller.dart';
import 'package:roloxmoney/screen/dashboard_screen/dashboard_controller.dart';
import 'package:roloxmoney/screen/home_screen/home_controller.dart';
import 'package:roloxmoney/screen/invoice_screen/add_invoice/add_invoice_controller.dart';
import 'package:roloxmoney/screen/invoice_screen/invoice_controller.dart';
import 'package:roloxmoney/screen/login_profile_screen/login_profile_controller.dart';
import 'package:roloxmoney/screen/login_screen/login_controller.dart';
import 'package:roloxmoney/screen/payment_screen/add_bank_account/add_bank_account_controller.dart';
import 'package:roloxmoney/screen/payment_screen/payment_controller.dart';
import 'package:roloxmoney/screen/profile_screen/profile_controller.dart';
import 'package:roloxmoney/screen/projects_screen/add_project/add_project_controller.dart';
import 'package:roloxmoney/screen/projects_screen/projects_controller.dart';
import 'package:roloxmoney/utils/app_themes.dart';
import 'package:roloxmoney/widget/rolox_money_core_widgets.dart';

/*Chinnadurai Viswanathan*/
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(LoginController());
  Get.put(LoginProfileController());
  Get.lazyPut(() => DashboardController());
  Get.lazyPut(() => HomeController());
  Get.lazyPut(() => ProjectsController());
  Get.lazyPut(() => ClientsController());
  Get.lazyPut(() => InvoiceController());
  Get.lazyPut(() => PaymentController());
  Get.lazyPut(() => AddClientController());
  Get.lazyPut(() => AddProjectController());
  Get.lazyPut(() => AddInvoiceController());
  Get.lazyPut(() => AddBankAccountController());
  Get.lazyPut(() => ProfileController());

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const RoloxMoneyApp());
}

class RoloxMoneyApp extends CoreWidgets {
  const RoloxMoneyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => RoloxMoneyAppState();
}

class RoloxMoneyAppState extends CoreWidgetsState {
  Locale? _locale;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    getLocale().then((Locale locale) {
      setState(() {
        _locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      themeCollection: AppThemes().getThemeCollections(),
      builder: (BuildContext context, ThemeData theme) {
        return GetMaterialApp(
          locale: _locale,
          theme: lightTheme,
          supportedLocales: const [
            Locale('en', ''),
          ],
          localizationsDelegates: const [
            AppLocalizationsDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate
          ],
          localeResolutionCallback:
              (Locale? locale, Iterable<Locale> supportedLocales) {
            for (Locale supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale?.languageCode &&
                  supportedLocale.countryCode == locale?.countryCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },
          getPages: AppRoutes.routes,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
