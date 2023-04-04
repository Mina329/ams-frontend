import 'package:ams_frontend/src/apis/apis.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'subjects_error.freezed.dart';

@freezed
class SubjectsError with _$SubjectsError {
  const factory SubjectsError.api(ApiError apiError) = Api;
  const factory SubjectsError.notFound(String msg) = NotFound;
}

extension ApiErrorIntoSubjectErrorExt on ApiError {
  SubjectsError intoSubjectsError() => maybeWhen(
        orElse: () => SubjectsError.api(this),
      );
}
