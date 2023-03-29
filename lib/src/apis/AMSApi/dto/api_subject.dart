import 'package:ams_frontend/src/apis/AMSApi/dto/api_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_subject.freezed.dart';
part 'api_subject.g.dart';

@freezed
class ApiSubject with _$ApiSubject {
  const factory ApiSubject({
    required String id,
    required String name,
    required ApiUser instructor,
    required DateTime createAt,
    required String cronExpr,
    required DateTime updatedAt,
  }) = _ApiSubject;

  factory ApiSubject.fromJson(Map<String, Object?> json) =>
      _$ApiSubjectFromJson(json);
}
