import 'package:dynamic_themes/dynamic_themes.dart';
import 'package:flutter/material.dart';
import 'package:roloxmoney/utils/color_resource.dart';
/*Chinnadurai Viswanathan*/

class AppThemes {
  static const int darkBlue = 0;
  static const int lightOrange = 1;

  //Progress indiacator
  //titleMedium
  //bodyText1
  ThemeCollection getThemeCollections() {
    final ThemeData base = ThemeData.light();
    final ButtonThemeData darkButtonTheme =
        base.buttonTheme.copyWith(buttonColor: ColorResource.colorF58220);
    final FloatingActionButtonThemeData darkFABTheme =
        base.floatingActionButtonTheme;
    return ThemeCollection(themes: {
      AppThemes.darkBlue: ThemeData(
          primarySwatch: const MaterialColor(
            0xff020E36,
            <int, Color>{
              50: Color(0xff020E36),
              100: Color(0xff020E36),
              200: Color(0xff020E36),
              300: Color(0xff020E36),
              400: Color(0xff020E36),
              500: Color(0xff020E36),
              600: Color(0xff020E36),
              700: Color(0xff020E36),
              800: Color(0xff020E36),
              900: Color(0xff020E36),
            },
          ),
          backgroundColor: ColorResource.color020e36,
          buttonTheme: darkButtonTheme,
          primaryColor: ColorResource.color641653,
          textTheme: AppThemes().basicTextTheme(base.textTheme),
          floatingActionButtonTheme: darkFABTheme.copyWith(
              backgroundColor: ColorResource.colorF58220)),
      AppThemes.lightOrange: ThemeData(
          primarySwatch: const MaterialColor(
            0xffFDF3E6,
            <int, Color>{
              50: Color(0xffFDF3E6),
              100: Color(0xffFDF3E6),
              200: Color(0xffFDF3E6),
              300: Color(0xffFDF3E6),
              400: Color(0xffFDF3E6),
              500: Color(0xffFDF3E6),
              600: Color(0xffFDF3E6),
              700: Color(0xffFDF3E6),
              800: Color(0xffFDF3E6),
              900: Color(0xffFDF3E6),
            },
          ),
          buttonTheme: darkButtonTheme,
          textTheme: AppThemes().basicTextTheme(base.textTheme),
          floatingActionButtonTheme: darkFABTheme.copyWith(
              backgroundColor: ColorResource.colorFDF3E6)),
    });
  }

  static String toStr(int themeId) {
    switch (themeId) {
      case darkBlue:
        return 'Dark Blue';
      case lightOrange:
        return 'Light Orange';

      default:
        return 'Unknown';
    }
  }

  TextTheme basicTextTheme(TextTheme base) {
    return base.copyWith(
      //Used for font size of 6
      caption: base.caption!.copyWith(
          fontFamily: 'Source Sans Pro',
          fontSize: 6.0,
          color: ColorResource.black,
          fontWeight: FontWeight.w400),

      //Used for font size of 12
      subtitle2: base.subtitle2!.copyWith(
          fontFamily: 'SourceSansPro',
          fontSize: 12.0,
          color: ColorResource.black,
          fontWeight: FontWeight.w400),

      //Used for font size of 14,16
      subtitle1: base.subtitle1!.copyWith(
          fontFamily: 'SourceSansPro',
          fontSize: 14.0,
          color: ColorResource.black,
          fontWeight: FontWeight.w400),

      //Used for emphasizing text and font size of 18,20,22
      bodyText1: base.bodyText1!.copyWith(
          fontFamily: 'SourceSansPro',
          fontSize: 16.0,
          color: ColorResource.black,
          fontWeight: FontWeight.w600,
          height: 1.5),

      //Used for large text in dialogs and font size of 24
      headline5: base.headline5!.copyWith(
          fontFamily: 'SourceSansPro',
          fontSize: 18.0,
          color: ColorResource.black,
          fontWeight: FontWeight.w600),

      //Used for the primary text in app bars and font size of 26,28 and greater
      headline6: base.headline6!.copyWith(
          fontFamily: 'SourceSansPro',
          fontSize: 28.0,
          color: ColorResource.black,
          fontWeight: FontWeight.w700),

      //used for button
      button: base.bodyText1!.copyWith(
        fontFamily: 'SourceSansPro',
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

ThemeData lightThemeBase = ThemeData.light();

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    visualDensity: const VisualDensity(vertical: 0.5, horizontal: 0.5),
    primaryColor: const Color(0xffEDD5B3),
    primaryColorLight: const Color(0x1aF5E0C3),
    primaryColorDark: const Color(0xff936F3E),
    canvasColor: const Color(0xffE09E45),
    scaffoldBackgroundColor: Colors.white,
    bottomAppBarColor: const Color(0xff6D42CE),
    backgroundColor: Colors.black,
    // buttonColor: const Color(0xff00E94F,
    cardColor: const Color(0xaaF5E0C3),
    dividerColor: const Color(0x1f6D42CE),
    focusColor: const Color(0x1aF5E0C3),
    textTheme: AppThemes().basicTextTheme(lightThemeBase.textTheme).copyWith(
          subtitle1: lightThemeBase.textTheme.subtitle1!.copyWith(
              fontFamily: 'Poppins-Medium',
              fontSize: 16.0,
              color: Colors.white,
              fontWeight: FontWeight.w400),
          // titleLarge: lightThemeBase.textTheme.subtitle1!.copyWith(
          //     fontFamily: 'Poppins-Medium',
          //     fontSize: 26.0,
          //     color: Colors.white,
          //     fontWeight: FontWeight.w400),
          button: lightThemeBase.textTheme.button!.copyWith(
              fontFamily: 'Poppins-Medium',
              fontSize: 16.0,
              color: Colors.white,
              fontWeight: FontWeight.w400),
        ),
    colorScheme: ColorScheme.fromSwatch(
        primarySwatch: const MaterialColor(
      0xFFF5E0C3,
      <int, Color>{
        50: Color(0x1aF5E0C3),
        100: Color(0xa1F5E0C3),
        200: Color(0xaaF5E0C3),
        300: Color(0xafF5E0C3),
        400: Color(0xffF5E0C3),
        500: Color(0xffEDD5B3),
        600: Color(0xffDEC29B),
        700: Color(0xffC9A87C),
        800: Color(0xffB28E5E),
        900: Color(0xff936F3E)
      },
    )).copyWith(secondary: const Color(0xff457BE0)));

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  visualDensity: const VisualDensity(vertical: 0.5, horizontal: 0.5),
  primarySwatch: const MaterialColor(
    0xFFF5E0C3,
    <int, Color>{
      50: Color(0x1a5D4524),
      100: Color(0xa15D4524),
      200: Color(0xaa5D4524),
      300: Color(0xaf5D4524),
      400: Color(0x1a483112),
      500: Color(0xa1483112),
      600: Color(0xaa483112),
      700: Color(0xff483112),
      800: Color(0xaf2F1E06),
      900: Color(0xff2F1E06)
    },
  ),
  primaryColor: const Color(0xff000000),
  primaryColorLight: const Color(0x1a311F06),
  primaryColorDark: const Color(0xff936F3E),
  canvasColor: const Color(0xffE09E45),
  scaffoldBackgroundColor: ColorResource.backgroundPatchGrey,
  bottomAppBarColor: const Color(0xff6D42CE),
  cardColor: const Color(0xaa311F06),
  dividerColor: const Color(0x1f6D42CE),
  focusColor: const Color(0x1a311F06),
  textTheme: AppThemes().basicTextTheme(lightThemeBase.textTheme).copyWith(
      subtitle1: lightThemeBase.textTheme.subtitle1!.copyWith(
          fontFamily: 'SourceSansPro',
          fontSize: 14.0,
          color: ColorResource.red,
          fontWeight: FontWeight.w400)),
);
