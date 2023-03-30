import 'package:ams_frontend/src/apis/AMSApi/ams_api.dart';
import 'package:ams_frontend/src/features/auth/models/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'subject_model.freezed.dart';

@freezed
class Subject with _$Subject {
  const factory Subject({
    required String id,
    required String name,
    required UserModel instructor,
    required DateTime createAt,
    required String cronExpr,
    required DateTime updatedAt,
  }) = _Subject;
}

extension IntoSubject on SubjectDto {
  Subject intoSubject() => Subject(
        id: id,
        name: name,
        instructor: instructor.intoUser(UserType.instructor),
        createAt: createAt,
        cronExpr: cronExpr,
        updatedAt: updatedAt,
      );
}
