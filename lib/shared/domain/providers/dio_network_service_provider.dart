import 'package:dio/dio.dart';
import 'package:flutter_template/shared/data/remote/dio_network_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final networkServiceProvider = Provider<DioNetworkService>(
      (ref) {
    final Dio dio = Dio();
    return DioNetworkService(dio);
  },
);