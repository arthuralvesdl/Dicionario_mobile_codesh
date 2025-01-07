import 'package:dicionario_mobile_codesh/app/app.dart';
import 'package:dicionario_mobile_codesh/app/provider/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => AppProvider(),
      builder: (context, child) => const App(),
    )
  ]));
}
