import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/shared/logging/logging.dart';

import 'app.dart';

FutureOr<void> runMainApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ProviderScope(
      observers: [Log.talkerRiverpodObserver], child: const App()));
}
