import 'dart:async';

import 'package:ams_frontend/src/apis/AMSApi/ams_api.dart';
import 'package:ams_frontend/src/features/auth/models/user_model.dart';
import 'package:ams_frontend/src/features/auth/repositories/auth_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';
part 'auth_controller.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.signed(User user) = Signed;
  const factory AuthState.unsigned() = Unsigned;
}

// controller
@riverpod
class AuthController extends _$AuthController {
  @override
  FutureOr<AuthState> build() async {
    final user = await ref.watch(authRepositoryProvider).login();
    return user != null ? AuthState.signed(user) : const AuthState.unsigned();
  }

  Future<void> login(
      {required String email,
      required String password,
      required UserType userType}) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final user = await ref.read(authRepositoryProvider).login(
            email: email,
            password: password,
            userType: userType,
          );
      return user != null ? AuthState.signed(user) : const AuthState.unsigned();
    });
  }

  Future<void> logout() async {
    state = await AsyncValue.guard(() async {
      ref.read(authRepositoryProvider).logout();
      return const AuthState.unsigned();
    });
  }
}
