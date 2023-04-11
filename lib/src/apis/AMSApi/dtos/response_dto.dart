import 'package:ams_frontend/src/apis/api_error.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_dto.freezed.dart';
part 'response_dto.g.dart';

@Freezed(genericArgumentFactories: true, unionKey: 'status')
class ResponseDto<T> with _$ResponseDto<T> {
  const factory ResponseDto.success({
    required String message,
    T? data,
  }) = Sccuess;

  const factory ResponseDto.failure({
    required ApiError error,
  }) = Failure;

  factory ResponseDto.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$ResponseDtoFromJson(json, fromJsonT);
}

extension RequireData<T> on ResponseDto<T> {
  T? get requireData {
    return when(
        success: (message, data) => data,
        failure: (error) {
          throw error;
        });
  }
}
