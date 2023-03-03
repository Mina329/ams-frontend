import 'package:ams_frontend/src/features/login/presentation/login_screen.dart';
import 'package:ams_frontend/src/features/onboarding/data/onboarding_repository.dart';
import 'package:ams_frontend/src/features/onboarding/presentation/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

enum AppRoute {
  onboarding,
  home,
  login,
}

final goRouterProvider = Provider<GoRouter>((ref) {
  final onboardingRepository = ref.watch(onboardingRepositoryProvider);
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    redirect: (context, state) {
      if (state.subloc == '/') {
        if (!onboardingRepository.isOnBoardingComplete()) {
          return '/${AppRoute.onboarding.name}';
        } else {
          return '/';
        }
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        name: AppRoute.home.name,
        pageBuilder: (context, state) => const MaterialPage(
          child: SignScreen(),
        ),
        routes: [
          GoRoute(
            path: AppRoute.login.name,
            name: AppRoute.login.name,
            pageBuilder: (context, state) => const MaterialPage(
              child: SignScreen(),
            ),
          ),
          GoRoute(
            path: AppRoute.onboarding.name,
            name: AppRoute.onboarding.name,
            pageBuilder: (context, state) => const MaterialPage(
              child: OnboardingScreen(),
            ),
          ),
        ],
      ),
    ],
  );
});
