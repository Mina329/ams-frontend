import 'package:ams_frontend/src/apis/AMSApi/ams_api.dart';
import 'package:ams_frontend/src/features/auth/repositories/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'attendances_repository.dart';

import 'subjects_repository.dart';
import 'users_repository.dart';

export 'subjects_repository.dart';
export 'attendances_repository.dart';
export 'users_repository.dart';

part 'repositores.g.dart';

@Riverpod(keepAlive: true)
Future<UsersRepository> usersRepository(UsersRepositoryRef ref) async {
  final user = await ref.watch(authRepositoryProvider).login();
  final amsApi = ref.watch(amsApiProvider);
  return UsersRepository(amsApi, user!);
}

@riverpod
Future<AttendancesRepository> attendancesRepository(
  AttendancesRepositoryRef ref,
) async {
  final user = await ref.watch(authRepositoryProvider).login();
  final amsApi = ref.watch(amsApiProvider);
  return AttendancesRepository(amsApi, user!);
}

@Riverpod(keepAlive: true)
Future<SubjectsRepository> subjectsRepository(SubjectsRepositoryRef ref) async {
  final amsApi = ref.watch(amsApiProvider);
  final user = await ref.watch(authRepositoryProvider).login();
  return SubjectsRepository(amsApi, user!);
}
