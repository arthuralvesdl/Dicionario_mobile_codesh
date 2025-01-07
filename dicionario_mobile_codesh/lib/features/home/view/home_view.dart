import 'package:dicionario_mobile_codesh/features/dictionary/view/dictionary_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Dictionary"),
        ),
        body: const DictionaryView());
  }
}
