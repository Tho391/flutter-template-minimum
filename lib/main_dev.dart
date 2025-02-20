import 'app/main.dart';
import 'configs/flavors.dart';

Future<void> main() async {
  F.appFlavor = Flavor.dev;

  await runMainApp();
}
