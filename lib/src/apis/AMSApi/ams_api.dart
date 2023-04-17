export 'dtos/dtos.dart';

import 'package:ams_frontend/src/apis/apis.dart';
import 'package:ams_frontend/src/common/common.dart';
import 'package:ams_frontend/src/common/env.dart';
import 'package:ams_frontend/src/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dtos/dtos.dart';

part 'ams_api.g.dart';

enum UserType { attendee, instructor }

// Attendance Management System Api
class AMSApi {
  final Dio _dio;
  final SharedPreferences _sharedPreferences;

  // constructor
  AMSApi(this._dio, this._sharedPreferences) {
    _dio.options.baseUrl = EnvVars.apiUrl;
    _dio.options.validateStatus = (_) => true;
    _dio.interceptors.add(PrettyDioLogger(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
      maxWidth: 90,
      compact: true,
      logPrint: print,
    ));
  }

  // set the jwt token
  set _cachedJWTToken(String? token) {
    if (token != null) {
      _dio.options.headers.addAll({'Authorization': 'Bearer $token'});
      _sharedPreferences.setString('token', token);
    } else {
      _sharedPreferences.remove('token');
      _dio.options.headers.remove('Authorization');
    }
  }

  // set the cached user type
  set cachedUserType(UserType? userType) {
    if (userType != null) {
      _sharedPreferences.setInt('userType', userType.index);
    } else {
      _sharedPreferences.remove('userType');
    }
  }

  // get the cached jwt token
  String? get _cachedJWTToken {
    final value = _sharedPreferences.getString('token');
    _dio.options.headers.addAll({'Authorization': 'Bearer $value'});
    return value;
  }

  // get the cached user type
  UserType? get cachedUserType {
    final userType = _sharedPreferences.getInt('userType');
    if (userType == null) {
      return null;
    }
    final value = UserType.values[userType];
    return value;
  }

  // check if the credentials are cached
  bool get credsCached {
    return _cachedJWTToken != null && cachedUserType != null;
  }

  // logout
  void logout() {
    _cachedJWTToken = null;
    cachedUserType = null;
  }

  // login with jwt if is cached
  Future<ResponseDto<UserDto>?> loginCached() async {
    if (_cachedJWTToken == null || cachedUserType == null) {
      return null;
    }

    Utils.logger.d('found cached credentials');

    var user = await _dio.get('/${cachedUserType?.name}s/login');

    return ResponseDto.fromJson(
      user.data,
      (p0) => UserDto.fromJson(p0),
    );
  }

  // login with credential and then cache the jwt
  Future<ResponseDto<UserDto>> login({
    required UserType userType,
    required AuthPayloadDto authPayload,
  }) async {
    var response = await _dio.post(
      '/${userType.name}s/login',
      data: authPayload.toJson(),
    );

    final authBody = ResponseDto.fromJson(
      response.data,
      (p0) => AuthBodyDto.fromJson(p0),
    );

    final user = await authBody.when(success: (_, authBody) async {
      _cachedJWTToken = authBody?.token;

      response = await _dio.get('/${userType.name}s/login');
      final user = ResponseDto.fromJson(
        response.data,
        (p0) => UserDto.fromJson(p0),
      );

      user.whenOrNull(success: (_, user) {
        cachedUserType = userType;
      });

      return user;
    }, failure: (error) {
      throw error;
    });

    return user;
  }

  // get a subject by [subjectId]
  Future<ResponseDto<SubjectDto>> subject(String subjectId) async {
    final response = await _dio.get('/subjects/$subjectId');

    return ResponseDto.fromJson(
      response.data,
      (p0) => SubjectDto.fromJson(p0),
    );
  }

  // get subjects list filtered by user [id] and [userType]
  Future<ResponseDto<List<SubjectDto>>> subjects({
    String? userId,
    UserType? userType,
  }) async {
    Response response;
    if (userId != null && userType != null) {
      response = await _dio.get('/${userType.name}s/$userId/subjects');
    } else {
      response = await _dio.get('/subjects');
    }

    return ResponseDto.fromJson(
      response.data,
      (p0) {
        List<SubjectDto> subjects = [];
        for (var s in p0 as List<dynamic>) {
          subjects.add(SubjectDto.fromJson(s));
        }
        return subjects;
      },
    );
  }

  // get users list filtered by [subject] or [face]
  Future<ResponseDto<List<UserDto>>> attendees({
    String? subjectId,
    Uint8List? image,
  }) async {
    if (subjectId != null && image != null) {
      throw const ApiError.invalidOperation(
        "can't filter attendees with subject id and face at the same time",
      );
    }
    Response response;
    if (subjectId != null) {
      response = await _dio.get('/subjects/$subjectId/attendees');
    } else if (image != null) {
      final formData = FormData.fromMap({
        'image': MultipartFile.fromBytes(image),
      });
      response = await _dio.post('/attendees/image', data: formData);
    } else {
      response = await _dio.get('/attendees');
    }
    return ResponseDto.fromJson(response.data, (p0) {
      List<UserDto> users = [];
      for (var user in p0 as List<dynamic>) {
        users.add(UserDto.fromJson(user));
      }
      return users;
    });
  }

  // get attendances list filtered by [subjectId]
  Future<ResponseDto<List<AttendanceDto>>> attendances(
    String subjectId, {
    String? attendeeId,
  }) async {
    Response response;
    if (attendeeId == null) {
      response = await _dio.get('/attendances/subjects/$subjectId');
    } else {
      response = await _dio.get(
        '/${UserType.attendee}s/$attendeeId/subjects/$subjectId/attendances',
      );
    }
    return ResponseDto.fromJson(response.data, (p0) {
      List<AttendanceDto> attendances = [];
      for (var user in p0 as List<dynamic>) {
        attendances.add(AttendanceDto.fromJson(user));
      }
      return attendances;
    });
  }

  // take attendance by [subjectId] and [attendeeId]
  Future<ResponseDto<AttendanceDto>> takeAttendance({
    required String subjectId,
    required String attendeeId,
  }) async {
    final response = await _dio.put(
      '/attendances/subjects/$subjectId/attendees/$attendeeId',
    );
    return ResponseDto.fromJson(
      response.data,
      (p0) => AttendanceDto.fromJson(p0),
    );
  }
}

@Riverpod(keepAlive: true)
AMSApi amsApi(AmsApiRef ref) {
  return AMSApi(Dio(), ref.watch(sharedPreferencesProvider));
}
