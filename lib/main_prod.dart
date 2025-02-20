import 'app/main.dart';
import 'configs/flavors.dart';

Future<void> main() async {
  F.appFlavor = Flavor.prod;

  await runMainApp();
}
