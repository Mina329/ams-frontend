import 'dart:async';

import 'package:ams_frontend/src/apis/AMSApi/ams_api.dart';
import 'package:ams_frontend/src/features/auth/models/user_model.dart';
import 'package:ams_frontend/src/features/auth/repositories/auth_repository.dart';
import 'package:ams_frontend/src/utils/debug_delay.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

// controller
@riverpod
class AuthController extends _$AuthController {
  @override
  FutureOr<UserModel?> build() {
    return ref.watch(authRepositoryProvider).login();
  }

  Future<void> loginAttendee({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();
    await debugDelay();
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
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return await ref.watch(authRepositoryProvider).login(
            email: email,
            password: password,
            userType: UserType.instructor,
          );
    });
  }
}
