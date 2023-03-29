import 'package:ams_frontend/src/apis/AMSApi/dto/api_auth_body.dart';
import 'package:ams_frontend/src/apis/AMSApi/dto/api_response.dart';
import 'package:ams_frontend/src/apis/AMSApi/dto/api_subject.dart';
import 'package:ams_frontend/src/apis/AMSApi/dto/api_user.dart';
import 'package:ams_frontend/src/apis/AMSApi/dto/api_auth_payload.dart';
import 'package:ams_frontend/src/apis/apis.dart';
import 'package:ams_frontend/src/core/provider_observer.dart';
import 'package:ams_frontend/src/utils/logger.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  set _jwtToken(String? token) {
    if (token != null) {
      _dio.options.headers.addAll({'Authorization': 'Bearer $token'});
      _sharedPreferences.setString('token', token);
    } else {
      _sharedPreferences.remove('token');
      _dio.options.headers.remove('Authorization');
    }
  }

  set userType(UserType? userType) {
    if (userType != null) {
      _sharedPreferences.setInt('userType', userType.index);
    } else {
      _sharedPreferences.remove('userType');
    }
  }

  String? get _jwtToken {
    final value = _sharedPreferences.getString('token');
    _dio.options.headers.addAll({'Authorization': 'Bearer $value'});
    return value;
  }

  UserType? get userType {
    final value = UserType.values[_sharedPreferences.get('userType') as int];
    return value;
  }

  bool get credsCached {
    return _jwtToken != null && userType != null;
  }

  Future<ApiResponse<ApiUser>?> loginCached() async {
    if (_jwtToken == null || userType == null) {
      return null;
    }

    logger.d('found cached credentials');

    var user = await _dio.get('/${userType?.name}s/login');

    return ApiResponse.fromJson(
      user.data,
      (p0) => ApiUser.fromJson(p0 as dynamic),
    );
  }

  Future<ApiResponse<ApiUser>> login({
    required UserType userType,
    required ApiAuthPayload authPayload,
  }) async {
    try {
      var response = await _dio.post(
        '/${userType.name}s/login',
        data: authPayload.toJson(),
      );
      final authBody = ApiResponse.fromJson(
        response.data,
        (p0) => ApiAuthBody.fromJson(p0 as dynamic),
      );
      if (!authBody.status) {
        throw ApiError.authorization(authBody.message);
      }
      _jwtToken = authBody.data?.token;
      response = await _dio.get('/${userType.name}s/login');
      final user = ApiResponse.fromJson(
        response.data,
        (p0) => ApiUser.fromJson(p0 as dynamic),
      );
      if (user.data != null) {
        userType = userType;
      }
      return user;
    } on DioError catch (e) {
      throw ApiError.internal(e.toString());
    }
  }

  Future<ApiResponse<ApiSubject>> subject(String id) async {
    final response = await _dio.get('/subjects/$id');

    return ApiResponse.fromJson(
      response.data,
      (p0) => ApiSubject.fromJson(p0 as dynamic),
    );
  }

  Future<ApiResponse<List<ApiSubject>>> subjects({
    String? userId,
    UserType? userType,
  }) async {
    Response response;
    if (userId != null && userType != null) {
      response = await _dio.get('/${userType.name}s/$userId/subjects');
    } else {
      response = await _dio.get('/subjects');
    }

    return ApiResponse.fromJson(
      response.data,
      (p0) {
        List<ApiSubject> subjects = [];
        for (var s in p0 as List<dynamic>) {
          subjects.add(ApiSubject.fromJson(s));
        }
        return subjects;
      },
    );
  }
}

final amsApiProvider = Provider<AMSApi>((ref) {
  return AMSApi(Dio(), ref.watch(sharedPreferencesProvider));
});
