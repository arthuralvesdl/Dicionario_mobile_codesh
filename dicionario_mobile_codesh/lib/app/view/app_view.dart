import 'package:dicionario_mobile_codesh/app/provider/app_provider.dart';
import 'package:dicionario_mobile_codesh/features/home/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, app, child) {
        //AQUI O APP PROVIDER PODE SER INJETADO NO APP
        return const SafeArea(child: HomeView());
      },
    );
  }
}
