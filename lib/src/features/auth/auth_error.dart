import 'package:ams_frontend/src/apis/api_error.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_error.freezed.dart';

@freezed
class AuthError with _$AuthError {
  const factory AuthError.unauthorized(String message) = Unauthorized;
  const factory AuthError.api(ApiError apiError) = Api;
}

extension IntoAuthError on ApiError {
  AuthError intoAuthError() => AuthError.api(this);
}
