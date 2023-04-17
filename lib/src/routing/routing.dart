import 'package:ams_frontend/src/features/auth/view/controllers/auth_controller.dart';
import 'package:ams_frontend/src/features/auth/view/pages/login_page.dart';
import 'package:ams_frontend/src/features/home/view/pages/home_page.dart';
import 'package:ams_frontend/src/features/onboarding/view/view.dart';
import 'package:ams_frontend/src/features/settings/view/view.dart';
import 'package:ams_frontend/src/features/splash/view/pages/splash_page.dart';
import 'package:ams_frontend/src/features/subjects/view/pages/subject_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const String onboarding = "onboarding";
  static const String home = "home";
  static const String login = "login";
  static const String subjects = "subjects";
  static const String settings = "settings";
  static const String splash = "splash";
  static const String noInternet = "noInternet";
}

final goRouterProvider = Provider.autoDispose<GoRouter>((ref) {
  final onboardingState = ref.watch(onboardingConrollerProvider);
  final authController = ref.watch(authControllerProvider);
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    redirect: (context, state) {
      bool isAuthenticated = false;
      bool isLoading = false;

      authController.whenOrNull(
        data: (value) => value.whenOrNull(
          signed: (_) => isAuthenticated = true,
        ),
        loading: () => isLoading = true,
      );

      final isOnboarding = onboardingState.when(
        completed: () => true,
        notCompleted: (_) => false,
      );

      if (state.subloc == '/') {
        if (isLoading) {
          return '/${AppRoutes.splash}';
        } else if (!isOnboarding) {
          return '/${AppRoutes.onboarding}';
        } else if (!isAuthenticated) {
          return '/${AppRoutes.login}';
        }
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        name: AppRoutes.home,
        pageBuilder: (context, state) => const MaterialPage(
          child: HomePage(),
        ),
        routes: [
          GoRoute(
            path: '${AppRoutes.subjects}/:id',
            name: AppRoutes.subjects,
            pageBuilder: (context, state) {
              final String? id = state.params['id'];
              if (id != null) {
                return MaterialPage(
                  child: SubjectDetailsPage(id),
                );
              }
              return const MaterialPage(
                child: Placeholder(),
              );
            },
          ),
          GoRoute(
            path: AppRoutes.settings,
            name: AppRoutes.settings,
            pageBuilder: (context, state) => const MaterialPage(
              child: SettingsPage(),
            ),
          ),
        ],
      ),
      GoRoute(
        path: '/${AppRoutes.splash}',
        name: AppRoutes.splash,
        pageBuilder: (context, state) => const MaterialPage(
          child: SplashView(),
        ),
      ),
      GoRoute(
        path: '/${AppRoutes.login}',
        name: AppRoutes.login,
        pageBuilder: (context, state) => const MaterialPage(
          child: SignPage(),
        ),
      ),
      GoRoute(
        path: '/${AppRoutes.onboarding}',
        name: AppRoutes.onboarding,
        pageBuilder: (context, state) => const MaterialPage(
          child: OnboardingPage(),
        ),
      ),
    ],
  );
});
