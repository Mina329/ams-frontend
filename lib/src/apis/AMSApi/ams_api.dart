export 'dtos/dtos.dart';

import 'dart:io';

import 'package:ams_frontend/src/apis/apis.dart';
import 'package:ams_frontend/src/common/common.dart';
import 'package:ams_frontend/src/konstants/kstrings.dart';
import 'package:ams_frontend/src/utils/utils.dart';
import 'package:dio/dio.dart';
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
    _dio.options.baseUrl = 'http://${KApis.baseUrlME}:3000/api';
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
      (p0) => UserDto.fromJson(p0 as dynamic),
    );
  }

  // login with credential and then cache the jwt
  Future<ResponseDto<UserDto>> login({
    required UserType userType,
    required AuthPayloadDto authPayload,
  }) async {
    try {
      var response = await _dio.post(
        '/${userType.name}s/login',
        data: authPayload.toJson(),
      );
      final authBody = ResponseDto.fromJson(
        response.data,
        (p0) => AuthBodyDto.fromJson(p0 as dynamic),
      );
      if (!authBody.status) {
        throw ApiError.authorization(authBody.message);
      }
      _cachedJWTToken = authBody.data?.token;
      response = await _dio.get('/${userType.name}s/login');
      final user = ResponseDto.fromJson(
        response.data,
        (p0) => UserDto.fromJson(p0 as dynamic),
      );
      if (user.data != null) {
        cachedUserType = userType;
      }
      return user;
    } on DioError catch (e) {
      throw ApiError.internal(e.toString());
    }
  }

  // get a subject by [subjectId]
  Future<ResponseDto<SubjectDto>> subject(String subjectId) async {
    try {
      final response = await _dio.get('/subjects/$subjectId');

      return ResponseDto.fromJson(
        response.data,
        (p0) => SubjectDto.fromJson(p0 as dynamic),
      );
    } on DioError catch (error) {
      throw ApiError.internal(error.toString());
    }
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
    File? image,
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
        'image': MultipartFile.fromBytes(await image.readAsBytes()),
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
    String subjectId,
  ) async {
    final response = await _dio.get('/attendances/subjects/$subjectId');
    return ResponseDto.fromJson(response.data, (p0) {
      List<AttendanceDto> attendances = [];
      for (var user in p0 as List<dynamic>) {
        attendances.add(AttendanceDto.fromJson(user));
      }
      return attendances;
    });
  }

  // take attendance by [subjectId] and [attendeeId]
  Future<ResponseDto<void>> takeAttendance({
    required subjectId,
    required attendeeId,
  }) async {
    final response = await _dio.put(
      '/attendances/subjects/$subjectId/attendees/$attendeeId',
    );

    return ResponseDto.fromJson(response.data, (p0) {});
  }
}

@riverpod
AMSApi amsApi(AmsApiRef ref) {
  return AMSApi(Dio(), ref.watch(sharedPreferencesProvider));
}
