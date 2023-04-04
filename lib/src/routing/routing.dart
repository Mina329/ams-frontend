import 'package:ams_frontend/src/features/auth/repositories/auth_repository.dart';
import 'package:ams_frontend/src/features/auth/view/pages/login_page.dart';
import 'package:ams_frontend/src/features/home/view/pages/home_page.dart';
import 'package:ams_frontend/src/features/onboarding/repositories/onboarding_repository.dart';
import 'package:ams_frontend/src/features/onboarding/view/pages/onboarding_page.dart';
import 'package:ams_frontend/src/features/settings/view/view.dart';
import 'package:ams_frontend/src/features/subjects/view/pages/subject_page.dart';
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
                  child: SubjectDetailsPage(id),
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
              child: OnboardingPage(),
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

extension RoutingExt on BuildContext {
  void goNamedSafe(
    String name, {
    Map<String, String> params = const <String, String>{},
    Map<String, dynamic> queryParams = const <String, dynamic>{},
    Object? extra,
  }) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      goNamed(
        name,
        params: params,
        queryParams: queryParams,
        extra: extra,
      );
    });
  }

  void pushNamedSafe(
    String name, {
    Map<String, String> params = const <String, String>{},
    Map<String, dynamic> queryParams = const <String, dynamic>{},
    Object? extra,
  }) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      pushNamed(
        name,
        params: params,
        queryParams: queryParams,
        extra: extra,
      );
    });
  }
}
