import 'package:ams_frontend/src/apis/AMSApi/ams_api.dart';
import 'package:ams_frontend/src/apis/AMSApi/dto/api_auth_payload.dart';
import 'package:ams_frontend/src/features/auth/auth_error.dart';
import 'package:ams_frontend/src/features/auth/model/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthRepository extends Equatable {
  final AMSApi _amsApi;

  User? _user;

  User? get user => _user;

  AuthRepository(this._amsApi) {
    _amsApi.loginCached().then((value) {
      _user = value?.data?.intoAuthUser();
    });
  }

  Future<User?> login({
    String? email,
    String? password,
    UserType? userType,
  }) async {
    if (email == null || password == null || userType == null) {
      return null;
    }

    final response = await _amsApi.login(
      userType: userType,
      authPayload: ApiAuthPayload(email: email, password: password),
    );

    if (!response.status) {
      throw AuthError.unauthorized(response.message);
    }

    return response.data!.intoAuthUser();
  }

  @override
  List<Object?> get props => [_user];
}

final authRepositoryProvider = Provider.autoDispose<AuthRepository>((ref) {
  return AuthRepository(ref.watch(amsApiProvider));
});

final authUserProfider = Provider.autoDispose(
  (ref) => ref.watch(authRepositoryProvider).user,
);
