import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pharmalink/core/enums/drug_state.dart';
import 'package:pharmalink/features/404/error_404_screen.dart';
import 'package:pharmalink/features/access/forget_password/ui/forget_password_screen.dart';
import 'package:pharmalink/features/access/sign/ui/sign_screen.dart';
import 'package:pharmalink/features/access/verification/ui/verification_screen.dart';
import 'package:pharmalink/features/main/chat/data/models/chat.dart';
import 'package:pharmalink/features/main/chat/ui/messages_screen.dart';
import 'package:pharmalink/features/main/doctors/data/models/doctor_info.dart';
import 'package:pharmalink/features/main/doctors/ui/doctor_screen.dart';
import 'package:pharmalink/features/main/doctors/ui/doctors_screen.dart';
import 'package:pharmalink/features/main/drug_interaction/ui/drug_interaction_screen.dart';
import 'package:pharmalink/features/main/home/ui/home_screen.dart';
import 'package:pharmalink/features/main/main/ui/main_screen.dart';
import 'package:pharmalink/features/main/prescription/ui/landing_prescription_screen.dart';
import 'package:pharmalink/features/main/prescription/ui/prescription_screen.dart';
import 'package:pharmalink/features/main/prescription/ui/prescriptions_screen.dart';
import 'package:pharmalink/features/main/profile/ui/profile_screen.dart';
import 'package:pharmalink/features/main/reminders/data/models/reminder.dart';
import 'package:pharmalink/features/main/reminders/ui/reminder_calender_screen.dart';
import 'package:pharmalink/features/main/settings/change_password/ui/change_password_screen.dart';
import 'package:pharmalink/features/main/settings/edit_profile/ui/edit_profile_screen.dart';
import 'package:pharmalink/features/on_boarding/ui/on_boarding_screen.dart';
import 'package:pharmalink/features/splash/ui/splash_screen.dart';
import '../../features/main/chat/ui/chats_screen.dart';
import '../../features/main/prescription/data/models/prescription_info.dart';
import '../shared_preferences/auth_prefs.dart';
import '../shared_preferences/entry_prefs.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: StartRoute.page,
          initial: true,
          children: [
            AutoRoute(
              path: '',
              page: SplashRoute.page,
              guards: [AuthGuard()],
            ),
            AutoRoute(
              path: 'on-boarding',
              page: OnBoardingRoute.page,
            ),
            AutoRoute(
              path: 'sign',
              page: AccessRoute.page,
              children: [
                AutoRoute(
                  path: '',
                  page: SignRoute.page,
                ),
                AutoRoute(
                  path: 'forget-password',
                  page: ForgetPasswordRoute.page,
                ),
                AutoRoute(
                  path: 'verification',
                  page: VerificationRoute.page,
                ),
              ],
            ),
            AutoRoute(
              path: 'main',
              page: MainRoute.page,
              children: [
                AutoRoute(
                  path: 'home',
                  page: LandingHomeRoute.page,
                  children: [
                    AutoRoute(
                      path: '',
                      page: HomeRoute.page,
                    ),
                    AutoRoute(
                      path: 'doctors',
                      page: DoctorsRoute.page,
                    ),
                    AutoRoute(
                      path: 'doctor/:id',
                      page: DoctorRoute.page,
                    ),
                    AutoRoute(
                      path: 'reminder-calender',
                      page: ReminderCalenderRoute.page,
                    ),
                    AutoRoute(
                      page: ChattingRoute.page,
                      path: 'chats',
                      children: [
                        AutoRoute(
                          page: ChatsRoute.page,
                          path: '',
                        ),
                        AutoRoute(
                          page: MessagesRoute.page,
                          path: 'chat',
                        ),
                      ],
                    ),
                  ],
                ),
                AutoRoute(
                  page: MainPrescriptionRoute.page,
                  path: 'landing-prescription',
                  children: [
                    AutoRoute(
                      page: LandingPrescriptionRoute.page,
                      path: '',
                    ),
                    AutoRoute(
                      page: PrescriptionsRoute.page,
                      path: 'prescriptions',
                    ),
                    AutoRoute(
                      page: PrescriptionRoute.page,
                      path: 'prescription',
                    ),
                  ],
                ),
                AutoRoute(
                  page: DrugInteractionRoute.page,
                  path: 'drug-interaction',
                ),
                AutoRoute(
                  page: MainProfileRoute.page,
                  path: 'profile',
                  children: [
                    AutoRoute(
                      page: ProfileRoute.page,
                      path: '',
                    ),
                    AutoRoute(
                      page: EditProfileRoute.page,
                      path: 'edit-profile',
                    ),
                    AutoRoute(
                      page: ChangePasswordRoute.page,
                      path: 'change-password',
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),

        // ----------------- Error 404 ----------------- //
        AutoRoute(page: Error404Route.page),

        // if the path matches to home, it will redirect to home screen
        // RedirectRoute(path: '/main/home', redirectTo: '/')
      ];
}

@RoutePage()
class StartScreen extends AutoRouter {
  const StartScreen({super.key});
}

@RoutePage()
class AccessScreen extends AutoRouter {
  const AccessScreen({super.key});
}

@RoutePage()
class LandingHomeScreen extends AutoRouter {
  const LandingHomeScreen({super.key});
}

@RoutePage()
class LandingDoctorsScreen extends AutoRouter {
  const LandingDoctorsScreen({super.key});
}

@RoutePage()
class ChattingScreen extends AutoRouter {
  const ChattingScreen({super.key});
}

@RoutePage()
class MainPrescriptionScreen extends AutoRouter {
  const MainPrescriptionScreen({super.key});
}

@RoutePage()
class LandingPrescriptionsScreen extends AutoRouter {
  const LandingPrescriptionsScreen({super.key});
}

@RoutePage()
class MainProfileScreen extends AutoRouter {
  const MainProfileScreen({super.key});
}

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    bool isLoggedIn = AuthSharedPrefs.isUserLoggedIn();
    bool isFirstEntry = EntrySharedPrefs.isFirstEntry();
    isFirstEntry ? EntrySharedPrefs.storeEntryData(!isFirstEntry) : null;

    if (isLoggedIn) {
      router.push(const MainRoute());
    } else if (isFirstEntry) {
      router.push(const OnBoardingRoute());
    } else if (!isLoggedIn && !isFirstEntry) {
      router.push(const SignRoute());
    } else {
      resolver.next(true); // Proceed to the page
    }
  }
}
