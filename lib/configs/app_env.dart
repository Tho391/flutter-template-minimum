import 'package:flutter_template/configs/app_env_fields.dart';
import 'package:flutter_template/configs/dev_env.dart';
import 'package:flutter_template/configs/prod_env.dart';

abstract interface class AppEnv implements AppEnvFields {
  factory AppEnv() => _instance;

  static String appFlavor = const String.fromEnvironment('FLAVOR');

  static final AppEnv _instance = appFlavor == 'dev'
      ? DevEnv()
      : appFlavor == 'prod'
          ? ProdEnv()
          : throw Exception('Invalid app flavor');
}
