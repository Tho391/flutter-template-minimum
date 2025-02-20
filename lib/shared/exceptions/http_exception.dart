import 'package:fpdart/fpdart.dart';

import '../domain/models/response.dart';

class AppException implements Exception {
  final String message;
  final int? statusCode;
  final String? identifier;

  AppException({
    required this.message,
    this.statusCode,
    this.identifier,
  });

  @override
  String toString() {
    return 'statusCode=$statusCode\nmessage=$message\nidentifier=$identifier';
  }
}

//  extension
extension HttpExceptionExtension on AppException {
  Left<AppException, Response> get toLeft => Left<AppException, Response>(this);
}
