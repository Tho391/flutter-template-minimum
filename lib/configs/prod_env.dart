import 'package:envied/envied.dart';

import 'package:flutter_template/configs/app_env.dart';
import 'package:flutter_template/configs/app_env_fields.dart';

part '../generated/freezed/configs/prod_env.g.dart';

@Envied(name: 'Env', path: '.env/.env.prod', useConstantCase: true)
final class ProdEnv implements AppEnv, AppEnvFields {
  ProdEnv();

  @override
  @EnviedField(obfuscate: true, defaultValue: '')
  final String deeplinkHost = _Env.deeplinkHost;

  @override
  @EnviedField(obfuscate: true, defaultValue: '')
  final String secureKey = _Env.secureKey;

  @override
  @EnviedField(obfuscate: true, defaultValue: '')
  final String baseUrl = _Env.baseUrl;
}
