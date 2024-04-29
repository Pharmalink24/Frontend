// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message(
      'Sign In',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Sign Out`
  String get signOut {
    return Intl.message(
      'Sign Out',
      name: 'signOut',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to PharmaLink, where you manage your prescriptions !`
  String get welcomeToPharmalink {
    return Intl.message(
      'Welcome to PharmaLink, where you manage your prescriptions !',
      name: 'welcomeToPharmalink',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password?`
  String get forgetPassword {
    return Intl.message(
      'Forget Password?',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `By signing up, you agree to our`
  String get termsAndConditionsP1 {
    return Intl.message(
      'By signing up, you agree to our',
      name: 'termsAndConditionsP1',
      desc: '',
      args: [],
    );
  }

  /// `Terms and Conditions`
  String get termsAndConditionsP2 {
    return Intl.message(
      'Terms and Conditions',
      name: 'termsAndConditionsP2',
      desc: '',
      args: [],
    );
  }

  /// `and`
  String get termsAndConditionsP3 {
    return Intl.message(
      'and',
      name: 'termsAndConditionsP3',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get termsAndConditionsP4 {
    return Intl.message(
      'Privacy Policy',
      name: 'termsAndConditionsP4',
      desc: '',
      args: [],
    );
  }

  /// `Please verify your email address`
  String get pleaseVerifyEmail {
    return Intl.message(
      'Please verify your email address',
      name: 'pleaseVerifyEmail',
      desc: '',
      args: [],
    );
  }

  /// `Almost there! We've sent a verification email to`
  String get almostThere {
    return Intl.message(
      'Almost there! We\'ve sent a verification email to',
      name: 'almostThere',
      desc: '',
      args: [],
    );
  }

  /// `Still can't find the email? No problem.`
  String get stillCantFindEmail {
    return Intl.message(
      'Still can\'t find the email? No problem.',
      name: 'stillCantFindEmail',
      desc: '',
      args: [],
    );
  }

  /// `Just click on the link in that email address to complete your signup. if you don't see it, you may need to check your spam folder.`
  String get justClickOnTheLink {
    return Intl.message(
      'Just click on the link in that email address to complete your signup. if you don\'t see it, you may need to check your spam folder.',
      name: 'justClickOnTheLink',
      desc: '',
      args: [],
    );
  }

  /// `Resend Verification Email`
  String get resendVerificationEmail {
    return Intl.message(
      'Resend Verification Email',
      name: 'resendVerificationEmail',
      desc: '',
      args: [],
    );
  }

  /// `Got it`
  String get gotIt {
    return Intl.message(
      'Got it',
      name: 'gotIt',
      desc: '',
      args: [],
    );
  }

  /// `Hello, `
  String get hello {
    return Intl.message(
      'Hello, ',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back, `
  String get welcomeBack {
    return Intl.message(
      'Welcome back, ',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Welcome, `
  String get welcome {
    return Intl.message(
      'Welcome, ',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Doctor`
  String get doctor {
    return Intl.message(
      'Doctor',
      name: 'doctor',
      desc: '',
      args: [],
    );
  }

  /// `Your Doctors`
  String get yourDoctors {
    return Intl.message(
      'Your Doctors',
      name: 'yourDoctors',
      desc: '',
      args: [],
    );
  }

  /// `Add Doctor`
  String get addDoctor {
    return Intl.message(
      'Add Doctor',
      name: 'addDoctor',
      desc: '',
      args: [],
    );
  }

  /// `No Doctors`
  String get noDoctors {
    return Intl.message(
      'No Doctors',
      name: 'noDoctors',
      desc: '',
      args: [],
    );
  }

  /// `You don't have any doctors yet.`
  String get noDoctorsMessage {
    return Intl.message(
      'You don\'t have any doctors yet.',
      name: 'noDoctorsMessage',
      desc: '',
      args: [],
    );
  }

  /// `Reminder`
  String get reminder {
    return Intl.message(
      'Reminder',
      name: 'reminder',
      desc: '',
      args: [],
    );
  }

  /// `Your Reminders`
  String get yourReminders {
    return Intl.message(
      'Your Reminders',
      name: 'yourReminders',
      desc: '',
      args: [],
    );
  }

  /// `Add Reminder`
  String get addReminder {
    return Intl.message(
      'Add Reminder',
      name: 'addReminder',
      desc: '',
      args: [],
    );
  }

  /// `No Reminders Today`
  String get noRemindersToday {
    return Intl.message(
      'No Reminders Today',
      name: 'noRemindersToday',
      desc: '',
      args: [],
    );
  }

  /// `Prescription`
  String get prescription {
    return Intl.message(
      'Prescription',
      name: 'prescription',
      desc: '',
      args: [],
    );
  }

  /// `Your Prescriptions`
  String get yourPrescriptions {
    return Intl.message(
      'Your Prescriptions',
      name: 'yourPrescriptions',
      desc: '',
      args: [],
    );
  }

  /// `Add Prescription`
  String get addPrescription {
    return Intl.message(
      'Add Prescription',
      name: 'addPrescription',
      desc: '',
      args: [],
    );
  }

  /// `No Prescriptions`
  String get noPrescriptions {
    return Intl.message(
      'No Prescriptions',
      name: 'noPrescriptions',
      desc: '',
      args: [],
    );
  }

  /// `You don't have any prescriptions yet. Add a prescription to get started.`
  String get noPrescriptionsMessage {
    return Intl.message(
      'You don\'t have any prescriptions yet. Add a prescription to get started.',
      name: 'noPrescriptionsMessage',
      desc: '',
      args: [],
    );
  }

  /// `New`
  String get New {
    return Intl.message(
      'New',
      name: 'New',
      desc: '',
      args: [],
    );
  }

  /// `View or Activate New`
  String get viewOrActivateNew {
    return Intl.message(
      'View or Activate New',
      name: 'viewOrActivateNew',
      desc: '',
      args: [],
    );
  }

  /// `Active`
  String get Active {
    return Intl.message(
      'Active',
      name: 'Active',
      desc: '',
      args: [],
    );
  }

  /// `View or Deactivate Active`
  String get viewOrDeactivateActive {
    return Intl.message(
      'View or Deactivate Active',
      name: 'viewOrDeactivateActive',
      desc: '',
      args: [],
    );
  }

  /// `Inactive`
  String get Inactive {
    return Intl.message(
      'Inactive',
      name: 'Inactive',
      desc: '',
      args: [],
    );
  }

  /// `View or reactivate Inactive`
  String get viewOrActivateInactive {
    return Intl.message(
      'View or reactivate Inactive',
      name: 'viewOrActivateInactive',
      desc: '',
      args: [],
    );
  }

  /// `View All`
  String get viewAll {
    return Intl.message(
      'View All',
      name: 'viewAll',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get update {
    return Intl.message(
      'Update',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Interactions`
  String get drugInteractionTitle {
    return Intl.message(
      'Interactions',
      name: 'drugInteractionTitle',
      desc: '',
      args: [],
    );
  }

  /// `First Drug`
  String get firstDrug {
    return Intl.message(
      'First Drug',
      name: 'firstDrug',
      desc: '',
      args: [],
    );
  }

  /// `Second Drug`
  String get secondDrug {
    return Intl.message(
      'Second Drug',
      name: 'secondDrug',
      desc: '',
      args: [],
    );
  }

  /// `Check Interactions`
  String get checkInteractions {
    return Intl.message(
      'Check Interactions',
      name: 'checkInteractions',
      desc: '',
      args: [],
    );
  }

  /// `Interactions Found`
  String get interactionsFound {
    return Intl.message(
      'Interactions Found',
      name: 'interactionsFound',
      desc: '',
      args: [],
    );
  }

  /// `No Interactions`
  String get noInteractions {
    return Intl.message(
      'No Interactions',
      name: 'noInteractions',
      desc: '',
      args: [],
    );
  }

  /// `Please select two drugs..`
  String get pleaseSelectDrugs {
    return Intl.message(
      'Please select two drugs..',
      name: 'pleaseSelectDrugs',
      desc: '',
      args: [],
    );
  }

  /// `Please enter two drugs to check for interactions.`
  String get enter2drugs {
    return Intl.message(
      'Please enter two drugs to check for interactions.',
      name: 'enter2drugs',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Account Settings`
  String get accountSettings {
    return Intl.message(
      'Account Settings',
      name: 'accountSettings',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get editProfile {
    return Intl.message(
      'Edit Profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Switch to Dark Mode`
  String get switchToDarkMode {
    return Intl.message(
      'Switch to Dark Mode',
      name: 'switchToDarkMode',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this?`
  String get confirmDelete {
    return Intl.message(
      'Are you sure you want to delete this?',
      name: 'confirmDelete',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to deactivate this?`
  String get confirmDeactivate {
    return Intl.message(
      'Are you sure you want to deactivate this?',
      name: 'confirmDeactivate',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to activate this?`
  String get confirmActivate {
    return Intl.message(
      'Are you sure you want to activate this?',
      name: 'confirmActivate',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to reactivate this?`
  String get confirmReactivate {
    return Intl.message(
      'Are you sure you want to reactivate this?',
      name: 'confirmReactivate',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to cancel this?`
  String get confirmCancel {
    return Intl.message(
      'Are you sure you want to cancel this?',
      name: 'confirmCancel',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to save this?`
  String get confirmSave {
    return Intl.message(
      'Are you sure you want to save this?',
      name: 'confirmSave',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to update this?`
  String get confirmUpdate {
    return Intl.message(
      'Are you sure you want to update this?',
      name: 'confirmUpdate',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to close this?`
  String get confirmClose {
    return Intl.message(
      'Are you sure you want to close this?',
      name: 'confirmClose',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to go back?`
  String get confirmBack {
    return Intl.message(
      'Are you sure you want to go back?',
      name: 'confirmBack',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to confirm this?`
  String get confirmYes {
    return Intl.message(
      'Are you sure you want to confirm this?',
      name: 'confirmYes',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to decline this?`
  String get confirmNo {
    return Intl.message(
      'Are you sure you want to decline this?',
      name: 'confirmNo',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to proceed?`
  String get confirmOk {
    return Intl.message(
      'Are you sure you want to proceed?',
      name: 'confirmOk',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to confirm this?`
  String get confirmConfirm {
    return Intl.message(
      'Are you sure you want to confirm this?',
      name: 'confirmConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to resend this?`
  String get confirmResend {
    return Intl.message(
      'Are you sure you want to resend this?',
      name: 'confirmResend',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to change this?`
  String get confirmChange {
    return Intl.message(
      'Are you sure you want to change this?',
      name: 'confirmChange',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to change your profile?`
  String get confirmChangeProfile {
    return Intl.message(
      'Are you sure you want to change your profile?',
      name: 'confirmChangeProfile',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to sign out?`
  String get confirmSignOut {
    return Intl.message(
      'Are you sure you want to sign out?',
      name: 'confirmSignOut',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
