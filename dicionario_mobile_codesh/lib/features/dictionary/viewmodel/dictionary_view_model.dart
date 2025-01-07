import 'package:audioplayers/audioplayers.dart';
import 'package:dicionario_mobile_codesh/features/dictionary/model/dictionary_model.dart';
import 'package:dicionario_mobile_codesh/features/dictionary/service/dictionary_service.dart';
import 'package:flutter/material.dart';

class DictionaryViewModel extends ChangeNotifier {
  bool _isLoading = false;

  final TextEditingController _searchInput = TextEditingController();
  String? _searchInputText;
  TextEditingController get searchInput => _searchInput;
  String? get searchInputText => _searchInputText;

  DictionaryModel? _dictionaryInfo;
  DictionaryModel? get dictionaryInfo => _dictionaryInfo;
  bool get isLoading => _isLoading;

  Future searchWord() async {
    _isLoading = true;
    _dictionaryInfo = null;
    notifyListeners();

    DictionaryModel? response =
        await DictionaryService().searchWord(_searchInput.text);
    if (response != null) {
      _dictionaryInfo = response;
    }
    _isLoading = false;
    notifyListeners();
  }

  void changeInputText(String value) {
    _searchInputText = value;
    notifyListeners();
  }

  void playPhonetic(String audioUrl) async {
    final player = AudioPlayer();
    await player.play(UrlSource(audioUrl));
  }

  @override
  void dispose() {
    _searchInput.dispose();
    super.dispose();
  }
}
