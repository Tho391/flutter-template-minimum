import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/configs/app_env.dart';
import 'package:flutter_template/shared/data/remote/dio_network_service.dart';

final networkServiceProvider = Provider<DioNetworkService>(
  (ref) {
    final Dio dio = Dio();
    final env = AppEnv();
    return DioNetworkService(dio, env);
  },
);
