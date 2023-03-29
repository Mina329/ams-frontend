import 'package:ams_frontend/src/apis/AMSApi/ams_api.dart';
import 'package:ams_frontend/src/apis/AMSApi/dto/api_auth_payload.dart';
import 'package:ams_frontend/src/features/auth/auth_error.dart';
import 'package:ams_frontend/src/features/auth/models/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthRepository {
  final AMSApi _amsApi;

  bool get userCached => _amsApi.credsCached;

  AuthRepository(this._amsApi);

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
      if (!response.status) {
        throw AuthError.unauthorized(response.message);
      }
      userType = _amsApi.userType;
      return response.data!.intoUser(userType!);
    }

    final response = await _amsApi.login(
      userType: userType,
      authPayload: ApiAuthPayload(email: email, password: password),
    );

    if (!response.status) {
      throw AuthError.unauthorized(response.message);
    }

    return response.data!.intoUser(userType);
  }
}

final authRepositoryProvider = Provider.autoDispose<AuthRepository>((ref) {
  return AuthRepository(ref.watch(amsApiProvider));
});
