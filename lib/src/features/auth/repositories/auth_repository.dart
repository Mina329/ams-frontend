import 'package:ams_frontend/src/apis/AMSApi/ams_api.dart';
import 'package:ams_frontend/src/apis/apis.dart';
import 'package:ams_frontend/src/features/auth/auth_error.dart';
import 'package:ams_frontend/src/features/auth/models/user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

class AuthRepository {
  final AMSApi _amsApi;

  bool get userCached => _amsApi.credsCached;

  AuthRepository(this._amsApi);

  Future<UserModel?> login({
    String? email,
    String? password,
    UserType? userType,
  }) async {
    try {
      if (email == null || password == null || userType == null) {
        final response = await _amsApi.loginCached();
        if (response == null) {
          return null;
        }
        if (!response.status) {
          throw AuthError.unauthorized(response.message);
        }
        userType = _amsApi.cachedUserType;
        return response.data!.intoUser(userType!);
      }

      final response = await _amsApi.login(
        userType: userType,
        authPayload: AuthPayloadDto(email: email, password: password),
      );

      if (!response.status) {
        throw AuthError.unauthorized(response.message);
      }

      return response.data!.intoUser(userType);
    } on ApiError catch (err) {
      throw err.intoAuthError();
    }
  }
}

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepository(ref.watch(amsApiProvider));
}
