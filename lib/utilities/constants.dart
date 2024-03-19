// Flutter Packages
import 'package:flutter/material.dart';
// Components Packages
// External Packages
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// App Config
class App {
  static const kAppBarLogoSize = 45.0;

  static AppBar bar = AppBar(
    automaticallyImplyLeading: false,
    title: const Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ImageIcon(
            AssetImage("${AppPaths.images}/logo.png"),
            size: kAppBarLogoSize,
            color: AppColors.alternateText,
          ),
          Text(
            "PharmaLink",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: AppFonts.primary,
              color: AppColors.alternateText,
            ),
          ),
        ],
      ),
    ),
  );

  static AppBar barWithoutLogo = AppBar(
    automaticallyImplyLeading: false,
    title: const Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "PharmaLink",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: AppFonts.primary,
              color: AppColors.alternateText,
            ),
          ),
        ],
      ),
    ),
  );

  static AppBar barWithoutLabel = AppBar(
    automaticallyImplyLeading: false,
    title: const Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ImageIcon(
            AssetImage(
              "${AppPaths.images}/logo.png",
            ),
            size: kAppBarLogoSize,
            color: AppColors.alternateText,
          ),
        ],
      ),
    ),
  );

  static BottomNavigationBar bottomNavigationBar = BottomNavigationBar(
    backgroundColor: AppColors.secondaryBackground,
    selectedItemColor: AppColors.primary,
    unselectedItemColor: AppColors.secondaryText,
    type: BottomNavigationBarType.fixed,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: FaIcon(
          FontAwesomeIcons.house,
          size: 24.0,
        ),
        label: 'Home',
        tooltip: 'Home',
      ),
      BottomNavigationBarItem(
        icon: FaIcon(
          FontAwesomeIcons.clipboardList,
          size: 24.0,
        ),
        label: 'Prescriptions',
        tooltip: 'Prescriptions',
      ),
      BottomNavigationBarItem(
        icon: FaIcon(
          FontAwesomeIcons.flask,
          size: 24.0,
        ),
        label: 'Drug Interactions',
        tooltip: 'Drug Interactions',
      ),
      BottomNavigationBarItem(
        icon: FaIcon(
          FontAwesomeIcons.solidUser,
          size: 24.0,
        ),
        label: 'User Information',
        tooltip: 'User Information',
      )
    ],
  );
}

// Colors
class AppColors {
  static const Color primary = Color(0xFF00F0B5);
  static const Color secondary = Color(0xFF011936);
  static const Color tertiary = Color(0xFF101010);
  static const Color alternate = Color(0xFFF9F9F9);
  static const Color transparent = Colors.transparent;

  static const Color primaryText = Color(0xFF14181B);
  static const Color secondaryText = Color(0xFF57636C);
  static const Color alternateText = Color(0xFFF9F9F9);

  static const Color primaryBackground = Color(0xFFffffff);
  static const Color secondaryBackground = Color(0XFFf1f4f8);

  static const Color accent1 = Color(0x4C4B39EF);
  static const Color accent2 = Color(0x4D39D2C0);
  static const Color accent3 = Color(0x4DEE8B60);
  static const Color accent4 = Color(0xCCFFFFFF);
  static const Color accent5 = Color(0xFFE0E3E7);

  static const Color success = Color(0xFF249689);
  static const Color warning = Color(0xFFF9CF58);
  static const Color error = Color(0xFFFF5963);
  static const Color info = Color(0xFFFFFFFF);
}

// Typography
class AppFonts {
  static const String primary = 'Outfit';
  static const String secondary = 'Readex Pro';
  static const String tertiary = 'Plus Jakarta Sans';
}

class AppPaths {
  static const String images = './assets/images';
  static const String icons = '$images/icons';
  static const String introductions = '$images/introductions';
  static const String fonts = './assets/fonts';
}

class AppTheme {
  static ThemeData generalAppTheme = ThemeData().copyWith(
    appBarTheme: AppTheme.appBarTheme,
    textButtonTheme: AppTheme.textButtonThemeData,
  );

  static const kAppBarBorderRadius = 16.0;
  static const AppBarTheme appBarTheme = AppBarTheme(
    centerTitle: true,
    backgroundColor: AppColors.secondary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(kAppBarBorderRadius),
      ),
    ),
    elevation: 2,
    foregroundColor: AppColors.alternate,
  );

  static const TextButtonThemeData textButtonThemeData = TextButtonThemeData(
    style: ButtonStyle(
        alignment: Alignment.center,
        backgroundColor: MaterialStatePropertyAll(AppColors.secondary),
        elevation: MaterialStatePropertyAll(3.0)),
  );
}

class AppTextStyle {
  static const TextStyle displayLarge = TextStyle(
    fontFamily: AppFonts.primary,
    color: AppColors.primaryText,
    fontWeight: FontWeight.normal,
    fontSize: 64.0,
  );

  static const TextStyle displayMedium = TextStyle(
    fontFamily: AppFonts.primary,
    color: AppColors.primaryText,
    fontWeight: FontWeight.normal,
    fontSize: 44.0,
  );

  static const TextStyle displaySmall = TextStyle(
    fontFamily: AppFonts.primary,
    color: AppColors.primaryText,
    fontWeight: FontWeight.w600,
    fontSize: 36.0,
  );

  static const TextStyle headlineLarge = TextStyle(
    fontFamily: AppFonts.primary,
    color: AppColors.primaryText,
    fontWeight: FontWeight.w600,
    fontSize: 32.0,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontFamily: AppFonts.primary,
    color: AppColors.primaryText,
    fontWeight: FontWeight.normal,
    fontSize: 24.0,
  );

  static const TextStyle headlineSmall = TextStyle(
    fontFamily: AppFonts.primary,
    color: AppColors.primaryText,
    fontWeight: FontWeight.w500,
    fontSize: 24.0,
  );

  static const TextStyle titleLarge = TextStyle(
    fontFamily: AppFonts.primary,
    color: AppColors.primaryText,
    fontWeight: FontWeight.w500,
    fontSize: 22.0,
  );

  static const TextStyle titleMedium = TextStyle(
    fontFamily: AppFonts.secondary,
    color: AppColors.info,
    fontWeight: FontWeight.normal,
    fontSize: 18.0,
  );

  static const TextStyle titleSmall = TextStyle(
    fontFamily: AppFonts.secondary,
    color: AppColors.info,
    fontWeight: FontWeight.w500,
    fontSize: 16.0,
  );

  static const TextStyle labelLarge = TextStyle(
    fontFamily: AppFonts.secondary,
    color: AppColors.secondaryText,
    fontWeight: FontWeight.normal,
    fontSize: 16.0,
  );

  static const TextStyle labelMedium = TextStyle(
    fontFamily: AppFonts.secondary,
    color: AppColors.secondaryText,
    fontWeight: FontWeight.normal,
    fontSize: 14.0,
  );

  static const TextStyle labelSmall = TextStyle(
    fontFamily: AppFonts.secondary,
    color: AppColors.secondaryText,
    fontWeight: FontWeight.normal,
    fontSize: 12.0,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontFamily: AppFonts.secondary,
    color: AppColors.primaryText,
    fontWeight: FontWeight.normal,
    fontSize: 16.0,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: AppFonts.secondary,
    color: AppColors.primaryText,
    fontWeight: FontWeight.normal,
    fontSize: 14.0,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: AppFonts.secondary,
    color: AppColors.primaryText,
    fontWeight: FontWeight.normal,
    fontSize: 12.0,
  );
}

// Text Field Decoration
class AppTextFieldDecoration {
  static const _kBorderWidth = 2.0;
  static const _kPadding = 24.0;
  static const _kBorderRadius1 = 40.0;
  static const _kBorderRadius2 = 12.0;

  static const InputDecoration _generalInputDecoration = InputDecoration(
    labelStyle: AppTextStyle.labelMedium,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: _kBorderWidth,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.secondary,
        width: _kBorderWidth,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.error,
        width: _kBorderWidth,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.error,
        width: _kBorderWidth,
      ),
    ),
    filled: true,
    contentPadding: EdgeInsets.all(_kPadding),
  );

  static InputDecoration primaryInputDecoration =
      _generalInputDecoration.copyWith(
    fillColor: AppColors.primaryBackground,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_kBorderRadius1),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: AppColors.accent5,
      ),
      borderRadius: BorderRadius.circular(_kBorderRadius1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_kBorderRadius1),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_kBorderRadius1),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_kBorderRadius1),
    ),
  );

  static InputDecoration secondaryInputDecoration =
      _generalInputDecoration.copyWith(
    fillColor: AppColors.primaryBackground,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_kBorderRadius2),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: AppColors.secondaryBackground,
      ),
      borderRadius: BorderRadius.circular(_kBorderRadius2),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_kBorderRadius2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_kBorderRadius2),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_kBorderRadius2),
    ),
  );

  static final BoxDecoration _generalBoxDecoration = BoxDecoration(
    border: Border.all(
      width: _kBorderWidth,
    ),
  );

  static BoxDecoration primaryBoxDecoration = _generalBoxDecoration.copyWith(
    color: AppColors.primaryBackground,
    border: Border.all(
      color: AppColors.accent5,
    ),
    borderRadius: BorderRadius.circular(_kBorderRadius1),
  );

  static BoxDecoration secondaryBoxDecoration = _generalBoxDecoration.copyWith(
    color: AppColors.primaryBackground,
    border: Border.all(
      color: AppColors.secondaryBackground,
    ),
    borderRadius: BorderRadius.circular(_kBorderRadius2),
  );
}

class AppUrl {
  static const String patientUrl = "patient";
  static const String doctorUrl = "doctor";
}

class ApiUrl {
  // User API
  static const patientSignIn = "user/login/";
  static const patientSignUp = "user/signup/";
  static const patientSendVerification = "user/send_verify/";
  // Patient API
  static const doctorSignIn = "doctor/login/";
  static const doctorSignUp = "doctor/signup/";
  static const doctorSendVerification = "doctor/send_verify/";
}
