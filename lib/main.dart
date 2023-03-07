import 'package:flutter/material.dart';
import 'app.dart';
import 'infra/util/setup.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await const Setup().setup();
  runApp(App());
}
