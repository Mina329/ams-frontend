import 'package:ams_frontend/src/features/auth/models/user_model.dart';
import 'package:ams_frontend/src/features/auth/repositories/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_provider.g.dart';

@riverpod
Future<UserModel?> currentUser(CurrentUserRef ref) async {
  return await ref.watch(authRepositoryProvider).login();
}
