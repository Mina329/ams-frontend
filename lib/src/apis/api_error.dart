import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_error.freezed.dart';
part 'api_error.g.dart';

@Freezed(unionKey: 'type')
class ApiError with _$ApiError {
  const factory ApiError.network() = Network;
  const factory ApiError.notFound() = NotFound;
  const factory ApiError.unauthorized(String message) = Authorization;
  const factory ApiError.faceRecognition() = FaceRecogintion;
  const factory ApiError.badRequest() = BadRequest;
  const factory ApiError.invalidOperation(String message) = InvalidOperation;
  const factory ApiError.internal() = Internal;

  factory ApiError.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorFromJson(json);
}
