import 'dart:async';

import 'package:ams_frontend/src/features/auth/repo/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../auth/model/user.dart';

class HomeController extends AutoDisposeAsyncNotifier<User?> {
  @override
  FutureOr<User?> build() {
    // TODO: implement build
    throw UnimplementedError();
  }

  Future<void> login() async {
    state = const AsyncLoading();
    state =
        await AsyncValue.guard(() => ref.watch(authRepositoryProvider).login());
  }
}
