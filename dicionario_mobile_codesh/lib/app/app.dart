import 'package:dicionario_mobile_codesh/app/app_lifecycle_manager.dart';
import 'package:dicionario_mobile_codesh/app/provider/app_provider.dart';
import 'package:dicionario_mobile_codesh/app/view/app_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLifecycleManager(
      child: Consumer<AppProvider>(
        builder: (context, app, child) => GestureDetector(
          onTap: () {
            //Ocultar teclado quando o usuário clicar na tela
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: MaterialApp(
            home: const AppView(),
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
              useMaterial3: true,
            ),
          ),
        ),
      ),
    );
  }
}
