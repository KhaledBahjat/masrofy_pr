import 'package:go_router/go_router.dart';
import 'package:masrofy/screens/root_view.dart';
import 'package:material_ui/material_ui.dart';

import 'package:masrofy/screens/Auth/views/phone_view.dart';
import 'package:masrofy/screens/Auth/views/verify_phone_view.dart';
import 'package:masrofy/screens/onboarding/view/splash_screen.dart';
import 'package:masrofy/screens/onboarding/view/welcome_screen.dart';
import 'package:masrofy/screens/onboarding/view/onboarding_screen.dart';
import 'package:masrofy/screens/notification/view/notification.dart';

abstract class AppRoutes {
  static const kSplashView = '/';
  static const kWelcomeView = '/welcome';
  static const kOnBoardingView = '/onboarding';
  static const kVerifyView = '/verify';
  static const kPhoneView = '/phone';
  static const kRootView = '/root';
  static const kNotificationView = '/notification';

  static final GoRouter router = GoRouter(
    initialLocation: kSplashView,
    routes: [
      animatedRoute(
        path: kSplashView,
        child: const SplashScreen(),
      ),

      // animatedRoute(
      //   path: kWelcomeView,
      //   child: const WelcomeView(),
      // ),

      animatedRoute(
        path: kOnBoardingView,
        child: const OnboardingView(),
      ),

      animatedRoute(
        path: kPhoneView,
        child: const PhoneView(),
      ),

      animatedRoute(
        path: kVerifyView,
        child: VerifyPhoneView(),
      ),

      animatedRoute(
        path: kRootView,
        child: const RootView(),
      ),

      animatedRoute(
        path: kNotificationView,
        child: NotificationView(),
      ),
    ],
  );

  static GoRoute animatedRoute({
    required String path,
    required Widget child,
  }) {
    return GoRoute(
      path: path,
      pageBuilder: (context, state) {
        return NoTransitionPage(
          key: state.pageKey,
          child: child,
        );
      },
    );
  }
}