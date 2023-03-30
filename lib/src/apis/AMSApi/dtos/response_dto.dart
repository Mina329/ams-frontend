import 'package:freezed_annotation/freezed_annotation.dart';
part 'response_dto.freezed.dart';
part 'response_dto.g.dart';

@Freezed(genericArgumentFactories: true)
class ResponseDto<T> with _$ResponseDto<T> {
  const factory ResponseDto({
    required int code,
    required bool status,
    required String message,
    T? data,
  }) = _ResponseDto;

  factory ResponseDto.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$ResponseDtoFromJson(json, fromJsonT);
}
