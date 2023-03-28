import 'dart:async';
import 'package:ams_frontend/src/features/auth/repo/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthController extends AutoDisposeAsyncNotifier<bool> {
  @override
  FutureOr<bool> build() async {
    return ref.watch(authRepositoryProvider).checkUser();
  }

  Future<void> loginAttendee({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref
          .watch(authRepositoryProvider)
          .loginAttendee(email: email, password: password);
      return ref.watch(authRepositoryProvider).checkUser();
    });
  }

  Future<void> loginInstructor({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref
          .watch(authRepositoryProvider)
          .loginInstructor(email: email, password: password);
      return ref.watch(authRepositoryProvider).checkUser();
    });
  }
}

final authControllerProvider =
    AutoDisposeAsyncNotifierProvider<AuthController, bool>(AuthController.new);
