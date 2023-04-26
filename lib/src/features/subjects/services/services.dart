import 'package:ams_frontend/src/features/subjects/services/attendance_report_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

export 'attendance_report_service.dart';

part 'services.g.dart';

@riverpod
AttendanceReportService attendanceReportService(
  AttendanceReportServiceRef ref,
) {
  return AttendanceReportService();
}
