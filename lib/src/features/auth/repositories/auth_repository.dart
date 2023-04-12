import 'package:ams_frontend/src/apis/AMSApi/ams_api.dart';
import 'package:ams_frontend/src/features/auth/models/user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

class AuthRepository {
  final AMSApi _amsApi;

  bool get userCached => _amsApi.credsCached;

  AuthRepository(this._amsApi);

  void logout() {
    _amsApi.logout();
  }

  Future<User?> login({
    String? email,
    String? password,
    UserType? userType,
  }) async {
    if (email == null || password == null || userType == null) {
      final response = await _amsApi.loginCached();

      if (response == null) {
        return null;
      }

      return response.when(success: (_, user) {
        userType = _amsApi.cachedUserType;
        return user!.intoUser(userType!);
      }, failure: (error) {
        throw error;
      });
    }

    final response = await _amsApi.login(
      userType: userType,
      authPayload: AuthPayloadDto(email: email, password: password),
    );

    return response.when(success: (_, user) {
      userType = _amsApi.cachedUserType;
      return user!.intoUser(userType!);
    }, failure: (error) {
      throw error;
    });
  }
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepository(ref.watch(amsApiProvider));
}
