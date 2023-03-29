import 'package:ams_frontend/src/features/auth/repositories/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProvider = FutureProvider.autoDispose((ref) {
  ref.keepAlive();
  return ref.watch(authRepositoryProvider).login();
});
