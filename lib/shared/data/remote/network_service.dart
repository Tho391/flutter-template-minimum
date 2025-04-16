import 'package:flutter_template/shared/domain/models/response.dart';
import 'package:flutter_template/shared/exceptions/http_exception.dart';
import 'package:fpdart/fpdart.dart';

abstract class NetworkService {
  String get baseUrl;

  Map<String, Object> get headers;

  void updateHeader(Map<String, dynamic> data);

  Future<Either<AppException, Response>> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  });

  Future<Either<AppException, Response>> post(
    String endpoint, {
    Map<String, dynamic>? data,
  });
}
