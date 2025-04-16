import 'package:dio/dio.dart';
import 'package:flutter_template/shared/exceptions/http_exception.dart';
import 'package:fpdart/fpdart.dart';

class Response {
  final int statusCode;
  final String? statusMessage;
  final dynamic data;
  final Headers? headers;

  Response(
      {required this.statusCode, this.statusMessage, this.data = const {}, this.headers});

  @override
  String toString() {
    return 'statusCode=$statusCode\nstatusMessage=$statusMessage\n data=$data\n headers=$headers';
  }
}

extension ResponseExtension on Response {
  Right<AppException, Response> get toRight => Right(this);
}
