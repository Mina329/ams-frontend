import 'package:ams_frontend/src/features/auth/repositories/auth_repository.dart';
import 'package:ams_frontend/src/features/auth/view/login_page.dart';
import 'package:ams_frontend/src/features/home/view/pages/home_page.dart';
import 'package:ams_frontend/src/features/onboarding/repo/onboarding_repository.dart';
import 'package:ams_frontend/src/features/onboarding/view/pages/onboarding_page.dart';
import 'package:ams_frontend/src/features/settings/view/view.dart';
import 'package:ams_frontend/src/features/subjects/view/screens/subject_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

enum AppRoute {
  onboarding,
  home,
  login,
  subjects,
  settings,
}

final goRouterProvider = Provider.autoDispose<GoRouter>((ref) {
  final onboardingRepository = ref.watch(onboardingRepositoryProvider);
  final authRepository = ref.watch(authRepositoryProvider);
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    redirect: (context, state) async {
      if (state.subloc == '/') {
        if (!onboardingRepository.isOnBoardingComplete()) {
          return '/${AppRoute.onboarding.name}';
        } else if (!authRepository.userCached) {
          return '/${AppRoute.login.name}';
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
          child: HomePage(),
        ),
        routes: [
          GoRoute(
            path: AppRoute.login.name,
            name: AppRoute.login.name,
            pageBuilder: (context, state) => const MaterialPage(
              child: SignPage(),
            ),
          ),
          GoRoute(
            path: '${AppRoute.subjects.name}/:id',
            name: AppRoute.subjects.name,
            pageBuilder: (context, state) {
              final String? id = state.params['id'];
              if (id != null) {
                return MaterialPage(
                  child: SubjectDetailsScreen(id),
                );
              }
              return const MaterialPage(
                child: Placeholder(),
              );
            },
          ),
          GoRoute(
            path: AppRoute.onboarding.name,
            name: AppRoute.onboarding.name,
            pageBuilder: (context, state) => const MaterialPage(
              child: OnboardingView(),
            ),
          ),
          GoRoute(
            path: AppRoute.settings.name,
            name: AppRoute.settings.name,
            pageBuilder: (context, state) => const MaterialPage(
              child: SettingsPage(),
            ),
          ),
        ],
      ),
    ],
  );
});
