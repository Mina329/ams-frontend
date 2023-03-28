import 'package:ams_frontend/src/apis/AMSApi/ams_api.dart';
import 'package:ams_frontend/src/apis/AMSApi/dto/api_auth_payload.dart';
import 'package:ams_frontend/src/apis/api_error.dart';
import 'package:ams_frontend/src/core/core.dart';
import 'package:ams_frontend/src/features/auth/auth_error.dart';
import 'package:ams_frontend/src/features/auth/model/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  final AMSApi _amsApi;
  final SharedPreferences _sharedPreferences;

  AuthRepository(this._amsApi, this._sharedPreferences) {
    final token = _sharedPreferences.getString('token');
    if (token != null) {
      _amsApi.jwtToken = token;
      final userType = _sharedPreferences.getString('userType')!;
      if (userType == UserType.attendee.name) {
        _amsApi.getUser(loginUser: LoginUser.attendee);
      } else {
        _amsApi.getUser(loginUser: LoginUser.instructor);
      }
    }
  }


  Future<User?> login() async {
    final token = _sharedPreferences.getString('token');
    if (token != null) {
      _amsApi.jwtToken = token;
      //TODO: remove this simulation
      await Future.delayed(const Duration(seconds: 2));
      final userType = _sharedPreferences.getString('userType')!;
      if (userType == UserType.attendee.name) {
        var response = await _amsApi.getUser(loginUser: LoginUser.attendee);
        if (response.status) return response.data!.intoAttendee();
        throw AuthError.unauthorized(response.message);
      } else {
        var response = await _amsApi.getUser(loginUser: LoginUser.instructor);
        if (response.status) return response.data!.intoInstructor();
        throw AuthError.unauthorized(response.message);
      }
    }
    return null;
  }

  Future<void> loginAttendee({
    required String email,
    required String password,
  }) async {
    try {
      var cachedToken = _sharedPreferences.getString('token');
      if (cachedToken == null) {
        final authBodyResponse = await _amsApi.login(
          loginUser: LoginUser.attendee,
          authPayload: ApiAuthPayload(email: email, password: password),
        );
        if (!authBodyResponse.status) {
          throw AuthError.unauthorized(authBodyResponse.message);
        }
        cachedToken = authBodyResponse.data!.token;
        await _sharedPreferences.setString('token', cachedToken);
        await _sharedPreferences.setString('userType', UserType.attendee.name);
      }
    } on ApiError catch (e) {
      throw e.intoAuthError();
    }
  }

  Future<void> loginInstructor({
    required String email,
    required String password,
  }) async {
    try {
      var cachedToken = _sharedPreferences.getString('token');
      if (cachedToken == null) {
        final authBodyResponse = await _amsApi.login(
          loginUser: LoginUser.instructor,
          authPayload: ApiAuthPayload(email: email, password: password),
        );
        if (!authBodyResponse.status) {
          throw AuthError.unauthorized(authBodyResponse.message);
        }
        cachedToken = authBodyResponse.data!.token;
        await _sharedPreferences.setString('token', cachedToken);
        await _sharedPreferences.setString('userType', UserType.attendee.name);
      }
      _amsApi.jwtToken = cachedToken;
      final userResponse =
          await _amsApi.getUser(loginUser: LoginUser.instructor);
      if (userResponse.status) {
      } else {
        throw AuthError.unauthorized(userResponse.message);
      }
    } on ApiError catch (e) {
      throw e.intoAuthError();
    }
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(
    ref.watch(amsApiProvider),
    ref.watch(sharedPreferencesProvider),
  );
});
