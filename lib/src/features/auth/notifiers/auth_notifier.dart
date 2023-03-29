import 'dart:async';
import 'package:ams_frontend/src/apis/AMSApi/ams_api.dart';
import 'package:ams_frontend/src/features/auth/models/user.dart';
import 'package:ams_frontend/src/features/auth/repositories/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthNotifier extends AutoDisposeAsyncNotifier<User?> {
  @override
  FutureOr<User?> build() {
    return ref.watch(authRepositoryProvider).login();
  }

  Future<void> loginAttendee({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();
    Future.delayed(const Duration(seconds: 2)); // TODO: remove
    state = await AsyncValue.guard(() async {
      return ref
          .watch(authRepositoryProvider)
          .login(email: email, password: password, userType: UserType.attendee);
    });
  }

  Future<void> loginInstructor({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return await ref.watch(authRepositoryProvider).login(
            email: email,
            password: password,
            userType: UserType.instructor,
          );
    });
  }
}
