import 'package:dicionario_mobile_codesh/features/dictionary/model/dictionary_model.dart';
import 'package:dicionario_mobile_codesh/features/dictionary/service/dictionary_service.dart';
import 'package:flutter/material.dart';

class DictionaryViewModel extends ChangeNotifier {
  final TextEditingController _searchInput = TextEditingController();
  String? _searchInputText;
  TextEditingController get searchInput => _searchInput;
  String? get searchInputText => _searchInputText;

  DictionaryModel? _dictionaryInfo;
  DictionaryModel? get dictionaryInfo => _dictionaryInfo;

  Future searchWord() async {
    DictionaryModel? response =
        await DictionaryService().searchWord(_searchInput.text);

    if (response != null) {
      _dictionaryInfo = response;
      notifyListeners();
    }
  }

  void changeInputText(String value) {
    _searchInputText = value;
    notifyListeners();
  }

  @override
  void dispose() {
    _searchInput.dispose();
    super.dispose();
  }
}
