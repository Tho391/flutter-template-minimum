import 'package:flutter_template/flavors.dart';
import 'package:flutter_template/main.dart' as runner;

Future<void> main() async {
  F.appFlavor = Flavor.dev;
  await runner.runMainApp();
}
