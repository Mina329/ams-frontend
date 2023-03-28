import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_error.freezed.dart';

@freezed
class ApiError with _$ApiError {
  const factory ApiError.network() = Network;
  const factory ApiError.internal(String msg) = Internal;
  const factory ApiError.authorization(String msg) = Authorization;
}
