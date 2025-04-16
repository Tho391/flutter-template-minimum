import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_template/shared/data/remote/network_service.dart';
import 'package:flutter_template/shared/domain/models/response.dart'
    as response;
import 'package:flutter_template/shared/exceptions/http_exception.dart';
import 'package:fpdart/fpdart.dart';

mixin ExceptionHandlerMixin on NetworkService {
  Future<Either<AppException, response.Response>>
      handleException<T extends Object>(
          Future<Response<dynamic>> Function() handler,
          {String endpoint = ''}) async {
    try {
      final res = await handler();

      if (res.statusCode == 200) {
        return Right(
          response.Response(
            statusCode: res.statusCode ?? 200,
            data: res.data,
            statusMessage: res.statusMessage,
            headers: res.headers,
          ),
        );
      } else {
        final message = res.data['title'] as String? ?? 'Unknown error';
        final statusCode = res.statusCode;
        const identifier = '';

        return Left(AppException(
          message: message,
          statusCode: statusCode,
          identifier: identifier,
        ));
      }
    } catch (e) {
      String message = '';
      String identifier = '';
      int statusCode = 0;
      log(e.runtimeType.toString());
      switch (e.runtimeType) {
        case SocketException _:
          e as SocketException;
          message = 'Unable to connect to the server.';
          statusCode = 0;
          identifier = 'Socket Exception ${e.message}\n at  $endpoint';
          break;

        case DioException _:
          e as DioException;
          message = e.response?.data?['message'] as String? ??
              'Internal Error occurred';
          statusCode = 1;
          identifier = 'DioException ${e.message} \nat  $endpoint';
          break;

        default:
          message = 'Unknown error occurred';
          statusCode = 2;
          identifier = 'Unknown error ${e.toString()}\n at $endpoint';
      }
      return Left(
        AppException(
          message: message,
          statusCode: statusCode,
          identifier: identifier,
        ),
      );
    }
  }
}
