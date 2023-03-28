import 'package:ams_frontend/src/apis/AMSApi/dto/api_auth_body.dart';
import 'package:ams_frontend/src/apis/AMSApi/dto/api_response.dart';
import 'package:ams_frontend/src/apis/AMSApi/dto/api_user.dart';
import 'package:ams_frontend/src/apis/AMSApi/dto/api_auth_payload.dart';
import 'package:ams_frontend/src/apis/apis.dart';
import 'package:ams_frontend/src/core/provider_observer.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum LoginUser { attendee, instructor }

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

  set jwtToken(String token) {
    _dio.options.headers.addAll({'Authorization': 'Bearer $token'});
  }

  Future<ApiResponse<ApiUser>> login({
    required LoginUser loginUser,
    required ApiAuthPayload authPayload,
  }) async {
    try {
      // login
      var response = await _dio.post('${loginUser.name}s/login');
      final authBody = ApiResponse.fromJson(
        response.data,
        (p0) => ApiAuthBody.fromJson(p0 as dynamic),
      );
      if (!authBody.status) {
        throw ApiError.authorization(authBody.message);
      }
      response = await _dio.get('${loginUser.name}s/login');
      final user = ApiResponse.fromJson(
        response.data,
        (p0) => ApiUser.fromJson(p0 as dynamic),
      );
      return user;
    } on DioError catch (e) {
      throw ApiError.internal(e.toString());
    }
  }

  Future<ApiResponse<ApiUser>> getUser({
    required LoginUser loginUser,
    String? id,
  }) async {
    try {
      final response = await _dio.get('/${loginUser.name}s/$id');
      return ApiResponse.fromJson(
        response.data,
        (p0) => ApiUser.fromJson(p0 as dynamic),
      );
    } on DioError catch (e) {
      throw ApiError.internal(e.toString());
    }
  }
}

final amsApiProvider = Provider<AMSApi>((ref) {
  return AMSApi(Dio(), ref.watch(sharedPreferencesProvider));
});
