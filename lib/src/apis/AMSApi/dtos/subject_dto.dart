import 'package:ams_frontend/src/apis/AMSApi/dtos/user_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'subject_dto.freezed.dart';
part 'subject_dto.g.dart';

@freezed
class SubjectDto with _$SubjectDto {
  const factory SubjectDto({
    required String id,
    required String name,
    required UserDto instructor,
    required DateTime createAt,
    required String cronExpr,
    required DateTime updatedAt,
  }) = _SubjectDto;

  factory SubjectDto.fromJson(Map<String, Object?> json) =>
      _$SubjectDtoFromJson(json);
}
