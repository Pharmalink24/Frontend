// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AccessRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AccessScreen(),
      );
    },
    ChangePasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChangePasswordScreen(),
      );
    },
    ChatsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChatsScreen(),
      );
    },
    ChattingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChattingScreen(),
      );
    },
    ConnectionLostRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ConnectionLost(),
      );
    },
    DoctorRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<DoctorRouteArgs>(
          orElse: () => DoctorRouteArgs(id: pathParams.getInt('id')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DoctorScreen(
          key: args.key,
          id: args.id,
        ),
      );
    },
    DoctorsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DoctorsScreen(),
      );
    },
    DrugInteractionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DrugInteractionScreen(),
      );
    },
    EditProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EditProfileScreen(),
      );
    },
    Error404Route.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const Error404Screen(),
      );
    },
    ForgetPasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ForgetPasswordScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    LandingDoctorsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LandingDoctorsScreen(),
      );
    },
    LandingHomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LandingHomeScreen(),
      );
    },
    LandingPrescriptionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LandingPrescriptionScreen(),
      );
    },
    LandingPrescriptionsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LandingPrescriptionsScreen(),
      );
    },
    MainPrescriptionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainPrescriptionScreen(),
      );
    },
    MainProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainProfileScreen(),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainScreen(),
      );
    },
    MessagesRoute.name: (routeData) {
      final args = routeData.argsAs<MessagesRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MessagesScreen(
          args.chat,
          key: args.key,
        ),
      );
    },
    OnBoardingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnBoardingScreen(),
      );
    },
    PrescriptionRoute.name: (routeData) {
      final args = routeData.argsAs<PrescriptionRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PrescriptionScreen(
          key: args.key,
          id: args.id,
          doctor: args.doctor,
          prescriptionInfo: args.prescriptionInfo,
          drugState: args.drugState,
        ),
      );
    },
    PrescriptionsRoute.name: (routeData) {
      final args = routeData.argsAs<PrescriptionsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PrescriptionsScreen(
          key: args.key,
          state: args.state,
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileScreen(),
      );
    },
    ReminderCalenderRoute.name: (routeData) {
      final args = routeData.argsAs<ReminderCalenderRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ReminderCalenderScreen(
          key: args.key,
          reminders: args.reminders,
        ),
      );
    },
    SignRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
    StartRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StartScreen(),
      );
    },
    VerificationRoute.name: (routeData) {
      final args = routeData.argsAs<VerificationRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: VerificationScreen(
          key: args.key,
          email: args.email,
          userId: args.userId,
        ),
      );
    },
  };
}

/// generated route for
/// [AccessScreen]
class AccessRoute extends PageRouteInfo<void> {
  const AccessRoute({List<PageRouteInfo>? children})
      : super(
          AccessRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccessRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChangePasswordScreen]
class ChangePasswordRoute extends PageRouteInfo<void> {
  const ChangePasswordRoute({List<PageRouteInfo>? children})
      : super(
          ChangePasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChangePasswordRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChatsScreen]
class ChatsRoute extends PageRouteInfo<void> {
  const ChatsRoute({List<PageRouteInfo>? children})
      : super(
          ChatsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChattingScreen]
class ChattingRoute extends PageRouteInfo<void> {
  const ChattingRoute({List<PageRouteInfo>? children})
      : super(
          ChattingRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChattingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ConnectionLost]
class ConnectionLostRoute extends PageRouteInfo<void> {
  const ConnectionLostRoute({List<PageRouteInfo>? children})
      : super(
          ConnectionLostRoute.name,
          initialChildren: children,
        );

  static const String name = 'ConnectionLost';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DoctorScreen]
class DoctorRoute extends PageRouteInfo<DoctorRouteArgs> {
  DoctorRoute({
    Key? key,
    required int id,
    List<PageRouteInfo>? children,
  }) : super(
          DoctorRoute.name,
          args: DoctorRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'DoctorRoute';

  static const PageInfo<DoctorRouteArgs> page = PageInfo<DoctorRouteArgs>(name);
}

class DoctorRouteArgs {
  const DoctorRouteArgs({
    this.key,
    required this.id,
  });

  final Key? key;

  final int id;

  @override
  String toString() {
    return 'DoctorRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [DoctorsScreen]
class DoctorsRoute extends PageRouteInfo<void> {
  const DoctorsRoute({List<PageRouteInfo>? children})
      : super(
          DoctorsRoute.name,
          initialChildren: children,
        );

  static const String name = 'DoctorsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DrugInteractionScreen]
class DrugInteractionRoute extends PageRouteInfo<void> {
  const DrugInteractionRoute({List<PageRouteInfo>? children})
      : super(
          DrugInteractionRoute.name,
          initialChildren: children,
        );

  static const String name = 'DrugInteractionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EditProfileScreen]
class EditProfileRoute extends PageRouteInfo<void> {
  const EditProfileRoute({List<PageRouteInfo>? children})
      : super(
          EditProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [Error404Screen]
class Error404Route extends PageRouteInfo<void> {
  const Error404Route({List<PageRouteInfo>? children})
      : super(
          Error404Route.name,
          initialChildren: children,
        );

  static const String name = 'Error404Route';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ForgetPasswordScreen]
class ForgetPasswordRoute extends PageRouteInfo<void> {
  const ForgetPasswordRoute({List<PageRouteInfo>? children})
      : super(
          ForgetPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgetPasswordRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LandingDoctorsScreen]
class LandingDoctorsRoute extends PageRouteInfo<void> {
  const LandingDoctorsRoute({List<PageRouteInfo>? children})
      : super(
          LandingDoctorsRoute.name,
          initialChildren: children,
        );

  static const String name = 'LandingDoctorsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LandingHomeScreen]
class LandingHomeRoute extends PageRouteInfo<void> {
  const LandingHomeRoute({List<PageRouteInfo>? children})
      : super(
          LandingHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'LandingHomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LandingPrescriptionScreen]
class LandingPrescriptionRoute extends PageRouteInfo<void> {
  const LandingPrescriptionRoute({List<PageRouteInfo>? children})
      : super(
          LandingPrescriptionRoute.name,
          initialChildren: children,
        );

  static const String name = 'LandingPrescriptionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LandingPrescriptionsScreen]
class LandingPrescriptionsRoute extends PageRouteInfo<void> {
  const LandingPrescriptionsRoute({List<PageRouteInfo>? children})
      : super(
          LandingPrescriptionsRoute.name,
          initialChildren: children,
        );

  static const String name = 'LandingPrescriptionsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainPrescriptionScreen]
class MainPrescriptionRoute extends PageRouteInfo<void> {
  const MainPrescriptionRoute({List<PageRouteInfo>? children})
      : super(
          MainPrescriptionRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainPrescriptionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainProfileScreen]
class MainProfileRoute extends PageRouteInfo<void> {
  const MainProfileRoute({List<PageRouteInfo>? children})
      : super(
          MainProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainScreen]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MessagesScreen]
class MessagesRoute extends PageRouteInfo<MessagesRouteArgs> {
  MessagesRoute({
    required Chat chat,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          MessagesRoute.name,
          args: MessagesRouteArgs(
            chat: chat,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'MessagesRoute';

  static const PageInfo<MessagesRouteArgs> page =
      PageInfo<MessagesRouteArgs>(name);
}

class MessagesRouteArgs {
  const MessagesRouteArgs({
    required this.chat,
    this.key,
  });

  final Chat chat;

  final Key? key;

  @override
  String toString() {
    return 'MessagesRouteArgs{chat: $chat, key: $key}';
  }
}

/// generated route for
/// [OnBoardingScreen]
class OnBoardingRoute extends PageRouteInfo<void> {
  const OnBoardingRoute({List<PageRouteInfo>? children})
      : super(
          OnBoardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PrescriptionScreen]
class PrescriptionRoute extends PageRouteInfo<PrescriptionRouteArgs> {
  PrescriptionRoute({
    Key? key,
    required int id,
    required DoctorInfo doctor,
    required PrescriptionInfo prescriptionInfo,
    required DrugState drugState,
    List<PageRouteInfo>? children,
  }) : super(
          PrescriptionRoute.name,
          args: PrescriptionRouteArgs(
            key: key,
            id: id,
            doctor: doctor,
            prescriptionInfo: prescriptionInfo,
            drugState: drugState,
          ),
          initialChildren: children,
        );

  static const String name = 'PrescriptionRoute';

  static const PageInfo<PrescriptionRouteArgs> page =
      PageInfo<PrescriptionRouteArgs>(name);
}

class PrescriptionRouteArgs {
  const PrescriptionRouteArgs({
    this.key,
    required this.id,
    required this.doctor,
    required this.prescriptionInfo,
    required this.drugState,
  });

  final Key? key;

  final int id;

  final DoctorInfo doctor;

  final PrescriptionInfo prescriptionInfo;

  final DrugState drugState;

  @override
  String toString() {
    return 'PrescriptionRouteArgs{key: $key, id: $id, doctor: $doctor, prescriptionInfo: $prescriptionInfo, drugState: $drugState}';
  }
}

/// generated route for
/// [PrescriptionsScreen]
class PrescriptionsRoute extends PageRouteInfo<PrescriptionsRouteArgs> {
  PrescriptionsRoute({
    Key? key,
    required DrugState state,
    List<PageRouteInfo>? children,
  }) : super(
          PrescriptionsRoute.name,
          args: PrescriptionsRouteArgs(
            key: key,
            state: state,
          ),
          initialChildren: children,
        );

  static const String name = 'PrescriptionsRoute';

  static const PageInfo<PrescriptionsRouteArgs> page =
      PageInfo<PrescriptionsRouteArgs>(name);
}

class PrescriptionsRouteArgs {
  const PrescriptionsRouteArgs({
    this.key,
    required this.state,
  });

  final Key? key;

  final DrugState state;

  @override
  String toString() {
    return 'PrescriptionsRouteArgs{key: $key, state: $state}';
  }
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ReminderCalenderScreen]
class ReminderCalenderRoute extends PageRouteInfo<ReminderCalenderRouteArgs> {
  ReminderCalenderRoute({
    Key? key,
    required List<Reminder> reminders,
    List<PageRouteInfo>? children,
  }) : super(
          ReminderCalenderRoute.name,
          args: ReminderCalenderRouteArgs(
            key: key,
            reminders: reminders,
          ),
          initialChildren: children,
        );

  static const String name = 'ReminderCalenderRoute';

  static const PageInfo<ReminderCalenderRouteArgs> page =
      PageInfo<ReminderCalenderRouteArgs>(name);
}

class ReminderCalenderRouteArgs {
  const ReminderCalenderRouteArgs({
    this.key,
    required this.reminders,
  });

  final Key? key;

  final List<Reminder> reminders;

  @override
  String toString() {
    return 'ReminderCalenderRouteArgs{key: $key, reminders: $reminders}';
  }
}

/// generated route for
/// [SignScreen]
class SignRoute extends PageRouteInfo<void> {
  const SignRoute({List<PageRouteInfo>? children})
      : super(
          SignRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [StartScreen]
class StartRoute extends PageRouteInfo<void> {
  const StartRoute({List<PageRouteInfo>? children})
      : super(
          StartRoute.name,
          initialChildren: children,
        );

  static const String name = 'StartRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [VerificationScreen]
class VerificationRoute extends PageRouteInfo<VerificationRouteArgs> {
  VerificationRoute({
    Key? key,
    required String email,
    required int userId,
    List<PageRouteInfo>? children,
  }) : super(
          VerificationRoute.name,
          args: VerificationRouteArgs(
            key: key,
            email: email,
            userId: userId,
          ),
          initialChildren: children,
        );

  static const String name = 'VerificationRoute';

  static const PageInfo<VerificationRouteArgs> page =
      PageInfo<VerificationRouteArgs>(name);
}

class VerificationRouteArgs {
  const VerificationRouteArgs({
    this.key,
    required this.email,
    required this.userId,
  });

  final Key? key;

  final String email;

  final int userId;

  @override
  String toString() {
    return 'VerificationRouteArgs{key: $key, email: $email, userId: $userId}';
  }
}
