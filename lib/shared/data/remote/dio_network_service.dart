import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_template/configs/app_env.dart';
import 'package:flutter_template/shared/data/remote/network_service.dart';
import 'package:flutter_template/shared/domain/models/response.dart'
    as response;
import 'package:flutter_template/shared/exceptions/http_exception.dart';
import 'package:flutter_template/shared/globals.dart';
import 'package:flutter_template/shared/logging/logging.dart';
import 'package:flutter_template/shared/mixins/exception_handler_mixin.dart';
import 'package:fpdart/fpdart.dart';

class DioNetworkService extends NetworkService with ExceptionHandlerMixin {
  final Dio dio;
  final AppEnv env;

  DioNetworkService(this.dio, this.env) {
    // this throws error while running test
    if (!kTestMode) {
      dio.options = dioBaseOptions;
      if (kDebugMode) {
        dio.interceptors.add(Log.dioLogger);
      }
    }
  }

  BaseOptions get dioBaseOptions => BaseOptions(
        baseUrl: baseUrl,
        headers: headers,
        connectTimeout: const Duration(minutes: 1),
        receiveTimeout: const Duration(minutes: 1),
        sendTimeout: const Duration(minutes: 1),
      );

  @override
  String get baseUrl => env.baseUrl;

  @override
  Map<String, Object> get headers => {
        'accept': 'application/json',
        'content-type': 'application/json',
      };

  @override
  Map<String, dynamic>? updateHeader(Map<String, dynamic> data) {
    final header = {...data, ...headers};
    if (!kTestMode) {
      dio.options.headers = header;
    }
    return header;
  }

  @override
  Future<Either<AppException, response.Response>> post(
    String endpoint, {
    Object? data,
    Options? options,
  }) {
    final res = handleException(
      () => dio.post(
        endpoint,
        data: data,
        options: options,
      ),
      endpoint: endpoint,
    );
    return res;
  }

  @override
  Future<Either<AppException, response.Response>> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    final res = handleException(
      () => dio.get(
        endpoint,
        queryParameters: queryParameters,
        options: options,
      ),
      endpoint: endpoint,
    );
    return res;
  }
}
