export 'dtos/dtos.dart';

import 'package:ams_frontend/src/apis/apis.dart';
import 'package:ams_frontend/src/common/common.dart';
import 'package:ams_frontend/src/utils/logger.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dtos/dtos.dart';

enum UserType { attendee, instructor }

class AMSApi {
  final Dio _dio;
  final SharedPreferences _sharedPreferences;

  AMSApi(this._dio, this._sharedPreferences) {
    _dio.options.baseUrl = 'http://localhost:3000/api';
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

  set _cachedJWTToken(String? token) {
    if (token != null) {
      _dio.options.headers.addAll({'Authorization': 'Bearer $token'});
      _sharedPreferences.setString('token', token);
    } else {
      _sharedPreferences.remove('token');
      _dio.options.headers.remove('Authorization');
    }
  }

  set cachedUserType(UserType? userType) {
    if (userType != null) {
      _sharedPreferences.setInt('userType', userType.index);
    } else {
      _sharedPreferences.remove('userType');
    }
  }

  String? get _cachedJWTToken {
    final value = _sharedPreferences.getString('token');
    _dio.options.headers.addAll({'Authorization': 'Bearer $value'});
    return value;
  }

  UserType? get cachedUserType {
    final userType = _sharedPreferences.getInt('userType');
    if (userType == null) {
      return null;
    }
    final value = UserType.values[userType];
    return value;
  }

  bool get credsCached {
    return _cachedJWTToken != null && cachedUserType != null;
  }

  Future<ResponseDto<UserDto>?> loginCached() async {
    if (_cachedJWTToken == null || cachedUserType == null) {
      return null;
    }

    logger.d('found cached credentials');

    var user = await _dio.get('/${cachedUserType?.name}s/login');

    return ResponseDto.fromJson(
      user.data,
      (p0) => UserDto.fromJson(p0 as dynamic),
    );
  }

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

  Future<ResponseDto<SubjectDto>> subject(String id) async {
    final response = await _dio.get('/subjects/$id');

    return ResponseDto.fromJson(
      response.data,
      (p0) => SubjectDto.fromJson(p0 as dynamic),
    );
  }

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

  Future<ResponseDto<List<UserDto>>> subjectUsers({
    required String id,
    UserType userType = UserType.attendee,
  }) async {
    final response = await _dio.get('/subjects/$id/${userType.name}s');
    return ResponseDto.fromJson(response.data, (p0) {
      List<UserDto> users = [];
      for (var user in p0 as List<dynamic>) {
        users.add(UserDto.fromJson(user));
      }
      return users;
    });
  }

  Future<ResponseDto<List<AttendanceDto>>> subjectAttendances(String id) async {
    final response = await _dio.get('/subjects/$id/${UserType.attendee.name}s');
    return ResponseDto.fromJson(response.data, (p0) {
      List<AttendanceDto> attendances = [];
      for (var user in p0 as List<dynamic>) {
        attendances.add(AttendanceDto.fromJson(user));
      }
      return attendances;
    });
  }
}

final amsApiProvider = Provider<AMSApi>((ref) {
  return AMSApi(Dio(), ref.watch(sharedPreferencesProvider));
});
